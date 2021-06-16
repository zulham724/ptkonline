<?php

namespace App\Http\Controllers;

use App\Models\Pretest;
use Illuminate\Http\Request;
use App\Models\Campaign;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Answer;
use DB;

class PretestController extends Controller
{
    // menyimpan jawaban sementara pada saat mengerjakan soal
    public function setAnswers(Request $request, $pretest_id){
        $request->validate([
            'question_lists'=>'array',
            'question_lists.*.question_list_type'=>'required',
            'question_lists.*.answer_lists'=>'array',
        ]);
        $user = $request->user();
        
        $campaign = Campaign::with('questions.question_list.question_list_type')->whereHasMorph('campaignable', [Pretest::class],  function (Builder $query)use($pretest_id, $user) {
            $query->where('pretests.id', $pretest_id);
        })->where('user_id', $user->id)->first();

        // jika ada campaign dgn pretest id tsb, maka set answers
        if($campaign){
            
            $user_question_lists = [];
            foreach($request->question_lists as $question_list){
                $user_question_lists[$question_list['id']] = $question_list;
                if(isset($question_list['answer_lists'])){
                    $user_question_lists[$question_list['id']]['arr_answer_lists']=[];
                    foreach($question_list['answer_lists'] as $answer_list){
                        $user_question_lists[$question_list['id']]['arr_answer_lists'][$answer_list['id']] = $answer_list;
                    }
                }
              
            }
            // return $user_question_lists;
            try {

                DB::beginTransaction();
                foreach($campaign->questions as $question){
                    $question_type = $question->question_list->question_list_type->name;
                    // jika pilihan ganda (selectoptions), maka
                    if($question_type=="selectoptions"){
                        $user_question_list = $user_question_lists[$question->question_list_id];
                        $selected_answer_list_id = $user_question_list['answer']; //answer_list_id yg dipilih
                        if($selected_answer_list_id)$value=$user_question_list['arr_answer_lists'][$selected_answer_list_id]['value'];
                        else $value=null;
                        // jika soal pilihan ganda, masukkan answer_list_id dan value yg dipilih user
                        Answer::updateOrCreate(
                            ['question_id'=>$question->id],
                            ['answer_list_id'=>$selected_answer_list_id, 
                            'value'=>$value]
                        );
                    }elseif($question_type=="textfield"){
                        // jika soal teks, biarkan answer_list_id'nya null dan masukkan value yg ditulis user 
                        Answer::updateOrCreate(
                            ['question_id'=>$question->id],
                            ['answer_list_id'=>null, 'value'=>$user_question_lists[$question->question_list_id]['answer']]
                        );
                    }
                
                }
              
                DB::commit();
            } catch (\PDOException $e) {
                // Woopsy
                dd($e);
                DB::rollBack();
            }
            // return $campaign->questions;

        }
    
      
    }
    public function beginTest($pretest_id){

        // BEGIN preprocessing pretest
        $pretest = Pretest::findOrFail($pretest_id);
        $user = auth()->user();
        $campaign = Campaign::whereHasMorph('campaignable', [Pretest::class],  function (Builder $query)use($pretest, $user) {
            $query->where('pretests.id', $pretest->id);
        })->where('user_id', $user->id)->first();

        $pretest->load(['question_lists.question_list_type','question_lists.answer_lists'=>function($query){
            $query->select('answer_lists.id','answer_lists.value','answer_lists.question_list_id');
        }])->has('question_lists');
        
        $pretest->question_lists->transform(function($item,$key){
            $item->answer=null;
            if($item->question_list_type->name=='textfield')unset($item['answer_lists']);
            return $item;
        });
        // END preprocessing pretest

        // jika campaign dgn $pretest_id sudah ada, maka load data dgn answer yg sudah ada
        if($campaign){
            // menampung db question_lists ke array dgn key berupa ID
            $db_question_lists = [];
            foreach($pretest->question_lists as $question_list){
                $db_question_lists[$question_list->id] = $question_list;
            }
            $new_question_lists = [];

            // load questions
            $campaign->load('questions.answer','questions.question_list.question_list_type');
            foreach($campaign->questions as $question){
                $new_question_lists[$question->id] = $db_question_lists[$question->question_list_id];

                if($new_question_lists[$question->id]->question_list_type->name=="textfield"){
                    
                    $new_question_lists[$question->id]->answer = $question->answer->value;
                }else{
                    // jika piliha ganda, answer adalah answer_list_id 
                    $new_question_lists[$question->id]->answer = $question->answer->answer_list_id;
                }

            }
            
            unset($pretest->question_lists);

            $pretest->question_lists = collect();
            foreach($new_question_lists as  $new_question_list){
                $pretest->question_lists->push($new_question_list);
            }
            // return $pretest;

            return \Inertia\Inertia::render('Pretest/Show',['user'=>auth()->user()->load('campaigns'),'data'=>$pretest]);

        }else{
 
            // soal diacak jika dibuka pertama kali
            $shuffled = $pretest->question_lists->shuffle();
            unset($pretest->question_lists);
            $pretest->question_lists = $shuffled->all();

            // mulai transaction
            try {
                DB::beginTransaction();
                 //masukkan pretest ke campaign
                $campaign = new Campaign;
                $campaign->user_id = $user->id;
                $pretest->campaigns()->save($campaign);
                
                $questions = [];
                foreach($pretest->question_lists as $question_list){
                    $questions[] = ['campaign_id'=>$campaign->id,'question_list_id'=>$question_list['id'],'value'=>$question_list['value']];
                }
                //masukkan campaign id ke questions
                DB::table('questions')->insert($questions);

                DB::commit();
                return \Inertia\Inertia::render('Pretest/Show',['user'=>auth()->user()->load('campaigns'),'data'=>$pretest]);
            }catch (\PDOException $e) {
                // Woopsy
                DB::rollBack();
                dd($e);
            }
           
    
        }

        
        
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = auth()->user()->loadCount('pretest_campaigns','posttest_campaigns','classroom_researches');
        
        $pretest_campaigns = DB::table('campaigns as c')->where('c.user_id',$user->id)
        ->join('pretests as p','p.id','=','c.campaign_id')
        ->where('c.campaign_type','App\Models\Pretest')
        ->where('c.is_publish',true)
        ->orderBy('c.id','desc')->get();
        // return $pretest_campaign;

    //    return $data->get()  ;
        // return $campaign_items;
        //return Pretest::withCount('question_lists')->get();
        $pretests = Pretest::withCount('question_lists')->whereDoesntHave('campaigns',function($query){
            $query->where('campaigns.user_id','=',auth()->user()->id);
        })->get();
        $user = auth()->user()->loadCount('pretest_campaigns','posttest_campaigns','classroom_researches');

        $uncompleted_pretests =  Pretest::withCount('question_lists')->whereHas('campaigns',function($query){
            $query->where('campaigns.user_id','=',auth()->user()->id)->where(function($query2){
                $query2->where('is_submitted',false)->orWhereNull('is_submitted');
            });
        })->get();

        return \Inertia\Inertia::render('Pretest/Index',['user'=>$user, 'uncompleted_pretests'=>$uncompleted_pretests, 'items'=>$pretests, 'pretest_campaigns'=>$pretest_campaigns]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //return $request;
        if($request->has('question_lists')){
            $pretest = Pretest::findOrFail($request->id);
            $campaign = new \App\Models\Campaign;
            $campaign->user_id = auth()->user()->id;
            $pretest->campaigns()->save($campaign);

            //$campaign = $request->user()->campaigns()->save(new \App\Models\Campaign);

            // $request->user
            $score=0;
            $selectoptions_count = $textfield_count = 0;
            foreach($request->question_lists as $question_list){
                
                $question = \App\Models\QuestionList::findOrFail($question_list['id']);
                $question_db = new \App\Models\Question;
                $question_db->question_list_id = $question->id;
                $question_db->value = $question->value;

                $campaign->questions()->save($question_db);

                $answer_db = new \App\Models\Answer; 
                if($question->question_list_type->name=="selectoptions"){
                    $answer = \App\Models\AnswerList::findOrFail($question_list['answer']);
                    $answer_db->answer_list_id = $answer->id;
                    $answer_db->value = $answer->value;
                    $answer_db->score = $answer->score;
                    $selectoptions_count++;
                }else{
                    $answer_db->answer_list_id = null;
                    $answer_db->score = null; //jika uraian maka harus koreksi manual
                    $answer_db->value = $question_list['answer'];
                    $textfield_count++;
                }
                $score+=$answer_db->score;
                $question_db->answer()->save($answer_db);

            }
             //jika semua soal pilihan ganda, maka langsung hitung skor akhir
             if($selectoptions_count==count($request->question_lists)){
                $score=$score/$selectoptions_count;
                $campaign->value = $score;
                $campaign->save();
            }
          
            return redirect()->route('pretests.index');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pretest  $pretest
     * @return \Illuminate\Http\Response
     */
    public function show(Pretest $pretest)
    {
        
        
        // $pretest->load(['question_lists.question_list_type','question_lists.answer_lists'=>function($query){
        //     $query->select('answer_lists.id','answer_lists.value','answer_lists.question_list_id');
        // }])->whereHas('question_lists',function($query){
        //     //$query->where
        // });
        // $pretest->question_lists->transform(function($item,$key){
        //     $item->answer=null;
        //     if($item->question_list_type->name=='textfield')unset($item['answer_lists']);
        //     return $item;
        // });
        // $shuffled = $pretest->question_lists->shuffle();
        // unset($pretest->question_lists);
        // $pretest->question_lists = $shuffled->all();
        // // return $pretest->question_lists;
  
        // //return $data;
        // return \Inertia\Inertia::render('Pretest/Show',['user'=>auth()->user()->load('campaigns'),'data'=>$pretest]);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Pretest  $pretest
     * @return \Illuminate\Http\Response
     */
    public function edit(Pretest $pretest)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pretest  $pretest
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pretest $pretest)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pretest  $pretest
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pretest $pretest)
    {
        //
    }
}

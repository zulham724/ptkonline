<?php

namespace App\Http\Controllers;

use App\Models\Pretest;
use Illuminate\Http\Request;
use App\Models\Campaign;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Answer;
use Carbon\Carbon;
use App\Models\PretestQuestionList;
use App\Models\QuestionList;
use App\Models\Question;
use App\Models\AnswerList;
use DB;


class PretestController extends Controller
{
    // menyimpan jawaban sementara pada saat mengerjakan soal
    public function setAnswers(Request $request, $pretest_id){
        $request->validate([
            'question_lists'=>'array',
            // 'question_lists.*.question_list_type'=>'required',
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
    public function index(Request $request)
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
                $query2->where('is_submitted',false)->orWhereNull('is_submitted')
                ->whereRaw('ABS(TIMESTAMPDIFF(MINUTE,campaigns.created_at,?))<8', [Carbon::now()]);
            });
        })->get();

        // $request->session()->flash('status', 'Task was successful!');

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

    // mengurutkan apakah 2 array number sama. contoh: [3,2,1] dan [1,3,2] adalah sama
    function checkIsSame($a, $b){
        if(count($a)!==count($b))return false;
        sort($a);
        sort($b);
        foreach($a as $k=>$v){
            if($v!==$b[$k])return false;
        }
        return true;
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    
    public function store(Request $request)
    {
        $request->validate([
            'question_lists'=>'array',
            'question_lists.*.id'=>'required',
            'question_lists.*.answer'=>'required',
        ]);
        $user = $request->user();
        $pretest = Pretest::findOrFail($request->id);
        // cek apakah ada campaign dgn pretest_id sekain dan user auth
        $campaign = Campaign::whereHasMorph('campaignable',[Pretest::class],  function (Builder $query, $type)use($pretest, $user) {
            $query->where('pretests.id', $pretest->id);
        })->where('user_id', $user->id)->first();

        if($campaign){
            // return $campaign->created_at;
            $begin = $campaign->created_at;
            $end = Carbon::now();
            $diff = $begin->diffInMinutes($end);
            // jika lebih besar dri 7 menit, maka jgn simpan
            if($diff>7){
               return response('<h1>Waktu Habis</h1>', 403);
            }
            if($campaign->is_submitted){
                return response('<h2>Anda sudah mengerjakan soal ini</h2>', 403);
            }
            try {
                $pretest->load('question_lists.question_list_type','question_lists.answer_lists');
                // menampung question lists dan jawaban ke array key
                $db_question_list_ids = [];
                $db_question_lists = [];
                foreach($pretest->question_lists as $question_list){
                    $db_question_lists[$question_list->id] = $question_list;
                    // menampung answer_lists di array key
                    $arr_answer_lists = [];
                    foreach($db_question_lists[$question_list->id]->answer_lists as $answer_list){
                        $arr_answer_lists[$answer_list->id] = $answer_list;
                    }
                    $db_question_lists[$question_list->id]->arr_answer_lists = $arr_answer_lists;
                    $db_question_list_ids[] = $question_list->id;
                }

                // return $db_question_lists;
                // $campaign = new \App\Models\Campaign;
                // $campaign->user_id = auth()->user()->id;
                // $pretest->campaigns()->save($campaign);
    
                //$campaign = $request->user()->campaigns()->save(new \App\Models\Campaign);
                $request_question_list_ids = [];
                $request_question_lists = [];
                foreach($request->question_lists as $question_list){
                    $request_question_list_ids[] = $question_list['id'];
                    $request_question_lists[$question_list['id']] = $question_list;
                }
                
                // jika id pada request question_lists dan db question_lists tidak identik, maka throw error
                if(!$this->checkIsSame($db_question_list_ids, $request_question_list_ids)){
                    return response('<h1>Opps, ngapain gan :p</h1>', 403);
                }

              
                DB::beginTransaction();
 
                foreach($request_question_lists as $question_list){

                    $db_question_list = $db_question_lists[$question_list['id']];

                    // walaupun data `question` di sudah ada hasil dri method setanswers, tpi buat jaga2 saja
                    Question::updateOrCreate(['campaign_id'=>$campaign->id, 
                    'question_list_id'=>$db_question_list->id],
                    ['value'=>$db_question_list->value, 'updated_at'=>Carbon::now()]
                    );

                    // $question_list_type = $db_question_list->question_list_type;
                   
                 

                    // $question = QuestionList::findOrFail($question_list['id']);
                    // $question_db = new Question;
                    // $question_db->question_list_id = $question->id;
                    // $question_db->value = $question->value;
    
                    // $campaign->questions()->save($question_db);
    
                    // $answer_db = new Answer; 
                    // if($question->question_list_type->name=="selectoptions"){
                    //     $answer = AnswerList::findOrFail($question_list['answer']);
                    //     $answer_db->answer_list_id = $answer->id;
                    //     $answer_db->value = $answer->value;
                    //     $answer_db->score = $answer->score;
                    //     $selectoptions_count++;
                    // }else{
                    //     $answer_db->answer_list_id = null;
                    //     $answer_db->score = null; //jika uraian maka harus koreksi manual
                    //     $answer_db->value = $question_list['answer'];
                    //     $textfield_count++;
                    // }
                    // $score+=$answer_db->score;
                    // $question_db->answer()->save($answer_db);
    
                }
                // setelah Question::updateOrCreate dri proses di atas, pasti ada campaign->questions
                $score_total = 0;
                $selectoptions_count = $textfield_count = 0;
                
                foreach($campaign->questions as $question){
                    $db_question_list = $db_question_lists[$question->question_list_id];
                    $request_question_list = $request_question_lists[$question->question_list_id];

                    $question_list_type = $db_question_list->question_list_type;

                    if($question_list_type->name=="selectoptions"){
                        $selectoptions_count++; 
                        $score = $db_question_list->arr_answer_lists[$request_question_list['answer']]['score']; //jika pilihan ganda, score'nya antara 100 (benar) atau null (salah)
                        $score_total+=$score;

                        $selected_answer_list_id = $request_question_list['answer']; //answer adalah answer_list_id yg dipilih user
                        $value = $db_question_list->value;
                    
                    }else{
                        $textfield_count++;
                        $score = null; //jika uraian maka harus koreksi manual
                        $selected_answer_list_id = null; //jika uraian maka tidak perlu answer_list_id
                        $value = $request_question_list->answer; //answer adalah kalimat jawaban dri user
                    }
                    Answer::updateOrCreate([
                        'question_id'=>$question->id,
                    ], ['score'=>$score, 'value'=>$value, 'answer_list_id'=>$selected_answer_list_id,]);
                }
                // jika semua soal pilihan ganda, maka langsung hitung skor akhir dan simpan di campaign
                if($selectoptions_count==count($db_question_lists)){
                    $score=$score_total/$selectoptions_count;
                    $campaign->value = $score;
                   
                }
                $campaign->is_submitted = true; 
                $campaign->save();

                DB::commit();
            }catch (\PDOException $e) {
                // Woopsy
                dd($e);
                DB::rollBack();
            }

        }
      
        return 'cok';
        // if($campaign)
        //return $request;
        
        
        
        return redirect()->route('pretests.index');
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

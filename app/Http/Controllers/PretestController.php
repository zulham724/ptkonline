<?php

namespace App\Http\Controllers;

use App\Models\Pretest;
use Illuminate\Http\Request;

class PretestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //return Pretest::withCount('question_lists')->get();
        $pretest = Pretest::withCount('question_lists')->whereDoesntHave('campaigns',function($query){
            $query->where('campaigns.user_id','=',auth()->user()->id);
        })->get();
        return \Inertia\Inertia::render('Pretest/Index',['user'=>auth()->user()->load('campaigns'), 'items'=>$pretest]);
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
        
        // //soal pilihan ganda
        // $selectoptions = Pretest::with(['question_lists'=>function($query){
        //     $query->with(['answer_lists'=>function($query2){
        //         $query2->select('answer_lists.id','answer_lists.value','answer_lists.question_list_id');
        //     },'question_list_type'])->whereHas('question_list_type',function($query3){
        //         $query3->where('name','selectoptions');
        //     });

        //     $query->whereHas('question_list_type',function($query2){
        //         $query2->where('name','textfield');
        //     });
            
        // }])->findOrFail($pretest_id);
        // return $selectoptions;
        //  //soal uraian
        // $textfield = Pretest::with(['question_lists'=>function($query){
        //     $query->whereHas('question_list_type',function($query2){
        //         $query2->where('name','textfield');
        //     });
        // }])->findOrFail($pretest_id);
        // //return $textfield;
        $pretest->load(['question_lists.question_list_type','question_lists.answer_lists'=>function($query){
            $query->select('answer_lists.id','answer_lists.value','answer_lists.question_list_id');
        }])->whereHas('question_lists',function($query){
            //$query->where
        });
        $pretest->question_lists->transform(function($item,$key){
            $item->answer=null;
            if($item->question_list_type->name=='textfield')unset($item['answer_lists']);
            return $item;
        });
        //return $pretest;
  
        //return $data;
        return \Inertia\Inertia::render('Pretest/Show',['user'=>auth()->user()->load('campaigns'),'data'=>$pretest]);

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

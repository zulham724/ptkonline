<?php

namespace App\Http\Controllers;

use App\Models\Posttest;
use Illuminate\Http\Request;

class PosttestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posttest = Posttest::withCount('question_lists')->whereDoesntHave('campaigns',function($query){
            $query->where('campaigns.user_id','=',auth()->user()->id);
        })->get();
        $user = auth()->user()->loadCount('pretest_campaigns','posttest_campaigns','classroom_researches');

        return \Inertia\Inertia::render('Posttest/Index',['user'=>$user, 'items'=>$posttest]);
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
        if($request->has('question_lists')){
            $posttest = Posttest::findOrFail($request->id);
            $campaign = new \App\Models\Campaign;
            $campaign->user_id = auth()->user()->id;
            $posttest->campaigns()->save($campaign);

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
          
            return redirect()->route('posttests.index');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Posttest  $posttest
     * @return \Illuminate\Http\Response
     */
    public function show(Posttest $posttest)
    {
        $posttest->load(['question_lists.question_list_type','question_lists.answer_lists'=>function($query){
            $query->select('answer_lists.id','answer_lists.value','answer_lists.question_list_id');
        }]);
        $posttest->question_lists->transform(function($item, $key){
            $item->answer=null;
            return $item;
        });
        //return $pretest;
        return \Inertia\Inertia::render('Posttest/Show',['data'=>$posttest]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Posttest  $posttest
     * @return \Illuminate\Http\Response
     */
    public function edit(Posttest $posttest)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Posttest  $posttest
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Posttest $posttest)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Posttest  $posttest
     * @return \Illuminate\Http\Response
     */
    public function destroy(Posttest $posttest)
    {
        //
    }
}

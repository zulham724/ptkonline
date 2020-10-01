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
        return \Inertia\Inertia::render('Posttest/Index',['items'=>Posttest::withCount('question_lists')->get()]);
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
            $campaign = $request->user()->campaign()->save(new \App\Models\Campaign);

            // $request->user
            foreach($request->question_lists as $question_list){
                $question = \App\Models\QuestionList::findOrFail($question_list['id']);
                $question_db = new \App\Models\Question;
                $question_db->question_list_id = $question->id;
                $question_db->value = $question->value;

                $campaign->questions()->save($question_db);

                $answer = \App\Models\AnswerList::findOrFail($question_list['answer']);
                $answer_db = new \App\Models\Answer; 
                $answer_db->answer_list_id = $answer->id;
                $answer_db->value = $answer->value;
                $answer_db->score = $answer->score;

                $question_db->answer()->save($answer_db);


            }
            return $campaign;
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
        return \Inertia\Inertia::render('Pretest/Show',['data'=>$posttest]);
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

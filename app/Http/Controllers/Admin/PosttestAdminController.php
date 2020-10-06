<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Posttest;
class PosttestAdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        if($request->has('question_lists') && $request->has('posttest_id')){
            $posttest = Posttest::findOrFail($request->posttest_id);
            $question_list_ids=[];
            foreach($request->question_lists as $question_list){
                if(isset($question_list['id'])){
                    $question_list_db = \App\Models\QuestionList::findOrFail($question_list['id']);
                }else{
                    $question_list_db = new \App\Models\QuestionList;
                    $type = \App\Models\QuestionListType::where('name',$question_list['question_list_type']['name'])->first();
                    if($type)$question_list_db->question_list_type_id = $type->id;
                }
                $question_list_db->value = $question_list['value'];
                $question_list_db->save();
                array_push($question_list_ids, $question_list_db->id);

                if($question_list['question_list_type']['name']=="selectoptions"){
                    $answer_list_ids=[];
                    foreach($question_list['answer_lists'] as $answer_list){
                        if(isset($answer_list['id'])){
                            $answer_list_db = \App\Models\AnswerList::findOrFail($answer_list['id']);
                        }else{
                            $answer_list_db = new \App\Models\AnswerList;
                        }
                        $answer_list_db->value = $answer_list['value'];
                        $question_list_db->answer_lists()->save($answer_list_db);
                        array_push($answer_list_ids, $answer_list_db->id);
                    }
                    $question_list_db->answer_lists()->whereNotIn('answer_lists.id',$answer_list_ids)->delete();
                }else{
                    $answer_list = $question_list['answer_lists'][0];
                    if(isset($answer_list['id'])){
                        $answer_list_db = \App\Models\AnswerList::findOrFail($answer_list['id']);
                    }else{
                        $answer_list_db = new \App\Models\AnswerList;
                    }
                    $answer_list_db->value = $answer_list['value'];
                    $question_list_db->answer_lists()->save($answer_list_db);
                    
                }
              
               
            }
            $posttest->question_lists()->sync($question_list_ids);
            return $posttest;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

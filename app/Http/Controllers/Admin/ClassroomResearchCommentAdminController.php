<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ClassroomResearchComment;
use App\Models\ClassroomResearch;
use Illuminate\Http\Request;
use DB;
class ClassroomResearchCommentAdminController extends Controller
{
    
    public function submitcomments(Request $request, $classroom_research_id){
        $request->validate([
            'comments'=>'array',
            'comments.*.value'=>'required',
        ]);
        // return $request->comments;
        $data = ClassroomResearch::findOrFail($classroom_research_id);
        $comment_ids = [];

        foreach($request->comments as $comment){
            if(isset($comment['id'])){
                array_push($comment_ids, $comment['id']);
               DB::table('classroom_research_comments')->where('id',$comment['id'])->update(['value'=>$comment['value']]);
            }else{
                $db_comment = new ClassroomResearchComment;
                $db_comment->value = $comment['value'];
                $db_comment->classroom_research_id = $data->id;
                $db_comment->save();
                array_push($comment_ids, $db_comment->id);
            }
          
        }
        //hapus komentar yg tidak ada dalam request comments.*.id
        DB::table('classroom_research_comments')->where('classroom_research_id',$data->id)->whereNotIn('id', $comment_ids)->delete();
        
        $data->load('classroom_research_comments');
        return $data;
    }
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ClassroomResearchComment  $classroomResearchComment
     * @return \Illuminate\Http\Response
     */
    public function show(ClassroomResearchComment $classroomResearchComment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ClassroomResearchComment  $classroomResearchComment
     * @return \Illuminate\Http\Response
     */
    public function edit(ClassroomResearchComment $classroomResearchComment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ClassroomResearchComment  $classroomResearchComment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ClassroomResearchComment $classroomResearchComment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ClassroomResearchComment  $classroomResearchComment
     * @return \Illuminate\Http\Response
     */
    public function destroy(ClassroomResearchComment $classroomResearchComment)
    {
        //
    }
}

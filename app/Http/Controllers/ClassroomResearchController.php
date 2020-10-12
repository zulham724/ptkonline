<?php

namespace App\Http\Controllers;

use App\Models\ClassroomResearch;
use App\Models\ClassroomResearchContent;
use Illuminate\Http\Request;
use App\Jobs\ProcessClassRoomResearch;
class ClassroomResearchController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data=ClassroomResearch::with('educational_level','classroom_research_contents')->where('user_id',auth()->user()->id)->get();
        foreach($data as $classroomResearch){
            $classroomResearch->plagiarism_score = round($classroomResearch->classroom_research_contents->avg('plagiarism_score'), 2).'%';
        }
        //return $data;
        $user = auth()->user()->loadCount('pretest_campaigns','posttest_campaigns','classroom_researches');

        return \Inertia\Inertia::render('ClassroomResearch/Index',['user'=>$user,'items'=>$data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $user = auth()->user()->loadCount('pretest_campaigns','posttest_campaigns','classroom_researches');
        return \Inertia\Inertia::render('ClassroomResearch/Create',['user'=>$user,'educationalLevels'=>\App\Models\EducationalLevel::all()]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if($request->has('contents') && $request->has('data')){
            $classroomResearch = new ClassroomResearch;
            $classroomResearch->year=$request->data['year'];
            $classroomResearch->title=$request->data['title'];
            $classroomResearch->school_name=$request->data['school_name'];
            $classroomResearch->school_address=$request->data['school_address'];
            $classroomResearch->educational_level_id=$request->data['educational_level'];
            $classroomResearch = $request->user()->classroom_researches()->save($classroomResearch);

            foreach($request->contents as $content){
                $classroomResearchContent = new ClassroomResearchContent;
                $classroomResearchContent->name = $content['name'];
                $classroomResearchContent->value = isset($content['html'])?$content['html']:null;
                $classroomResearch->classroom_research_contents()->save($classroomResearchContent);
            }
            ProcessClassRoomResearch::dispatch($classroomResearch); 
            return redirect()->route('classroom_researches.index');
            
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ClassroomResearch  $classroomResearch
     * @return \Illuminate\Http\Response
     */
    public function show(ClassroomResearch $classroomResearch)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ClassroomResearch  $classroomResearch
     * @return \Illuminate\Http\Response
     */
    public function edit(ClassroomResearch $classroomResearch)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ClassroomResearch  $classroomResearch
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ClassroomResearch $classroomResearch)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ClassroomResearch  $classroomResearch
     * @return \Illuminate\Http\Response
     */
    public function destroy(ClassroomResearch $classroomResearch)
    {
        //
    }
    public function getplagiarism($id){
        $res = ClassroomResearch::with('classroom_research_contents')->findOrFail($id);
        return $res;
    }
}

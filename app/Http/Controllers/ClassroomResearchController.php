<?php

namespace App\Http\Controllers;

use App\Models\ClassroomResearch;
use App\Models\ClassroomResearchContent;
use Illuminate\Http\Request;

class ClassroomResearchController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data=ClassroomResearch::with('educational_level')->where('user_id',auth()->user()->id)->get();
        return \Inertia\Inertia::render('ClassroomResearch/Index',['items'=>$data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
        return \Inertia\Inertia::render('ClassroomResearch/Create',['educationalLevels'=>\App\Models\EducationalLevel::all()]);
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
}

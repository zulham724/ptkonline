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
            $classroomResearch->isShow = false;
        }
        //return $data;
        $user = auth()->user()->loadCount('pretest_campaigns','posttest_campaigns','classroom_researches');

        return \Inertia\Inertia::render('ClassroomResearch/Index',['user'=>$user,'items'=>$data,'educationalLevels'=>\App\Models\EducationalLevel::all()]);
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
            $classroomResearch->year = $request->data['year'];
            $classroomResearch->title = $request->data['title'];
            $classroomResearch->school_name = $request->data['school_name'];
            $classroomResearch->school_address = $request->data['school_address'];
            $classroomResearch->educational_level_id = $request->data['educational_level'];
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
    public function show($classroomResearchId)
    {
        $classroomResearch = ClassroomResearch::with('classroom_research_contents')->where('user_id','=',auth()->user()->id)->findOrFail($classroomResearchId);
        return $classroomResearch;

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ClassroomResearch  $classroomResearch
     * @return \Illuminate\Http\Response
     */
    public function edit($classroomResearchId)
    {
        $classroomResearch = ClassroomResearch::with('classroom_research_contents','educational_level')->where('user_id','=',auth()->user()->id)->findOrFail($classroomResearchId);

        return $classroomResearch;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ClassroomResearch  $classroomResearch
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $classroomResearchId)
    {
        $classroomResearch = ClassroomResearch::where('user_id','=',auth()->user()->id)->findOrFail($classroomResearchId);
        $classroomResearch->title = $request->title;
        $classroomResearch->year = $request->year;
        $classroomResearch->school_address = $request->school_address;
        $classroomResearch->school_name = $request->school_name;
        $classroomResearch->educational_level_id = \App\Models\EducationalLevel::findOrFail($request->educational_level_id)->id;
        $classroomResearch->save();
        foreach($request->classroom_research_contents as $content){
              $content_db=\App\Models\ClassroomResearchContent::where('classroom_research_id','=',$classroomResearch->id)->findOrFail($content['id']);
              $content_db->value = $content['value'];
              $content_db->save();
        }
        //$classroomResearch->classroom_research_contents()->save
        ProcessClassRoomResearch::dispatch($classroomResearch);
        return redirect()->route('classroom_researches.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ClassroomResearch  $classroomResearch
     * @return \Illuminate\Http\Response
     */
    public function destroy($classroomResearchId)
    {
        $classroomResearch = ClassroomResearch::where('user_id','=',auth()->user()->id)->findOrFail($classroomResearchId);
        $classroomResearch->load('classroom_research_contents');
        foreach($classroomResearch->classroom_research_contents as $classroomResearchContent){
            $classroomResearchContent->plagiarism()->delete();
        }
        $classroomResearch->delete();
        return redirect()->route('classroom_researches.index');



    }
    public function getplagiarism($id){
        $res = ClassroomResearch::with('classroom_research_contents')->findOrFail($id);
        return $res;
    }
}

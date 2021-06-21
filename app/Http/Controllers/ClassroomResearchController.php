<?php

namespace App\Http\Controllers;

use App\Models\ClassroomResearch;
use App\Models\ClassroomResearchFormat;
use App\Models\ClassroomResearchContent;
use Illuminate\Http\Request;
use App\Jobs\ProcessClassRoomResearch;
use DB;
class ClassroomResearchController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
   
    public function index()
    {
        $formatTotal = ClassroomResearchFormat::selectRaw('educational_level_id, count(1) as format_total')->groupBy('educational_level_id');
        $data = ClassroomResearch::with('user','educational_level','classroom_research_contents','classroom_research_comments')->selectRaw('classroom_researches.*,format_total.format_total')->where('user_id',auth()->user()->id)
        ->joinSub($formatTotal, 'format_total', function($join){
            $join->on('classroom_researches.educational_level_id','=','format_total.educational_level_id');
        })
        ->orderBy('id','desc')->get();
        foreach($data as $classroomResearch){
            $classroomResearch->plagiarism_score = round($classroomResearch->classroom_research_contents->avg('plagiarism_score'), 2).'%';
            $classroomResearch->isShow = false;
            $status = 1; //1 completed, 0 draft/belum completed, -1 invalid
            if(count($classroomResearch->classroom_research_contents)!=$classroomResearch->format_total)$status=-1;
            else{
                // mengecek jika adalah salah satu konten yg kosong
                foreach($classroomResearch->classroom_research_contents as $content){
                    if(empty(trim($content->value))){
                        $status = 0;
                        break;
                    }
                }
            }
            $classroomResearch->status = $status;
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
        try{
            DB::beginTransaction();

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
    
            }

            DB::commit();

            return redirect()->route('classroom_researches.index');

        }catch (\PDOException $e) {
            // Woopsy
            dd($e);
            DB::rollBack();
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
    public function download($id){
        $data = ClassroomResearch::with('user','classroom_research_contents')->findOrFail($id);
        // return $data;
        $pdf = \PDF::loadView('pages.classroomresearch.preview', $data);
        $download = $pdf->stream($data->name.' '.auth()->user()->name);
        return $download;

    }
    public function getplagiarism($id){
        $res = ClassroomResearch::with('classroom_research_contents')->findOrFail($id);
        return $res;
    }
}

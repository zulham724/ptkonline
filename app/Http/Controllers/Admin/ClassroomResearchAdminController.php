<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ClassroomResearch;
use App\Models\ClassroomResearchFormat;
use App\Models\ClassroomResearchContent;

use Illuminate\Http\Request;
use DB;
class ClassroomResearchAdminController extends Controller
{
    public function getclassroomresearches(Request $request){
        $request->validate([
            'user_ids'=>'array',
            'search'=>'nullable'
        ]);
        $search = trim($request->search);

        $itemsPerPage = 10;
        if($request->query('itemsPerPage')){
            $itemsPerPage = $request->query('itemsPerPage');
            if($itemsPerPage==-1)$itemsPerPage=9999999999;
        }


        $formatTotal = ClassroomResearchFormat::selectRaw('educational_level_id, count(1) as format_total')->groupBy('educational_level_id');
        $averagePlagiarism = DB::table('classroom_research_contents as crc')->selectRaw('crc.id,crc.classroom_research_id,round(AVG(crc.plagiarism_score),2) as plagiarism_score_avg')
        ->groupBy('crc.classroom_research_id');

        $data = ClassroomResearch::with('classroom_research_contents','classroom_research_comments')->selectRaw('classroom_researches.*,el.name as educational_level_name, u.name as author_name,format_total.format_total,average_plagiarism.plagiarism_score_avg as plagiarism_score')
        ->joinSub($formatTotal, 'format_total', function($join){
            $join->on('classroom_researches.educational_level_id','=','format_total.educational_level_id');
        })
        ->join('users as u','u.id','=','classroom_researches.user_id')
        ->join('educational_levels as el','el.id','=','classroom_researches.educational_level_id')
        ->joinSub($averagePlagiarism, 'average_plagiarism', function($join){
            $join->on('classroom_researches.id','=','average_plagiarism.classroom_research_id');
        });
        // jika count user_ids>0, maka cari berdasarkan kepemilikan user_id
        if(count($request->user_ids)>0){
            $data->whereIn('classroom_researches.user_id',$request->user_ids);
        }
        // filter berdasarkan kata kunci
        if(!empty($search)){
            $data->where(function($query)use($search){
                $query->where('classroom_researches.id','like', '%'.$search.'%')->orWhere('u.name','like','%'.$search.'%')
                ->orWhere('title','like', '%'.$search.'%')->orWhere('year','like', '%'.$search.'%')
                ->orWhere('el.name', 'like', '%'.$search.'%')->orWhere('average_plagiarism.plagiarism_score_avg', 'like', '%'.$search.'%');
            });
            
        }
        $data->orderBy('classroom_researches.id','desc');

        $paginate = $data->paginate($itemsPerPage);
        foreach($paginate as $classroomResearch){
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
    
        return $paginate;
    }
    public function list_ptk($user_id=null){
        
        $data['users'] = DB::table('users')->orderBy('id','desc')->get();
     
        return view('list_ptk.index', $data);
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

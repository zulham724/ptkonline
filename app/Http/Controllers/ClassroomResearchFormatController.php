<?php

namespace App\Http\Controllers;

use App\Models\ClassroomResearchFormat;
use Illuminate\Http\Request;

class ClassroomResearchFormatController extends Controller
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ClassroomResearchFormat  $classroomResearchFormat
     * @return \Illuminate\Http\Response
     */
    public function show(ClassroomResearchFormat $classroomResearchFormat)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ClassroomResearchFormat  $classroomResearchFormat
     * @return \Illuminate\Http\Response
     */
    public function edit(ClassroomResearchFormat $classroomResearchFormat)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ClassroomResearchFormat  $classroomResearchFormat
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ClassroomResearchFormat $classroomResearchFormat)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ClassroomResearchFormat  $classroomResearchFormat
     * @return \Illuminate\Http\Response
     */
    public function destroy(ClassroomResearchFormat $classroomResearchFormat)
    {
        //
    }
    public function getByEducatioanlLevel($id){
        return ClassroomResearchFormat::where('educational_level_id',$id)->orderBy('id','asc')->get();
    }
}

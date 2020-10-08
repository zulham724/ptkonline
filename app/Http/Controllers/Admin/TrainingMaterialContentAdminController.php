<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\TrainingMaterialContent;
use Illuminate\Http\Request;

class TrainingMaterialContentAdminController extends Controller
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
        return 'asu';
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TrainingMaterialContent  $trainingMaterialContent
     * @return \Illuminate\Http\Response
     */
    public function show(TrainingMaterialContent $trainingMaterialContent)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\TrainingMaterialContent  $trainingMaterialContent
     * @return \Illuminate\Http\Response
     */
    public function edit(TrainingMaterialContent $trainingMaterialContent)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TrainingMaterialContent  $trainingMaterialContent
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TrainingMaterialContent $trainingMaterialContent)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TrainingMaterialContent  $trainingMaterialContent
     * @return \Illuminate\Http\Response
     */
    public function destroy(TrainingMaterialContent $trainingMaterialContent)
    {
        //
    }
}

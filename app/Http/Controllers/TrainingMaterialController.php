<?php

namespace App\Http\Controllers;

use App\Models\TrainingMaterial;
use Illuminate\Http\Request;

class TrainingMaterialController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //return TrainingMaterial::with('training_material_contents')->get();
        $user = auth()->user()->loadCount('pretest_campaigns','posttest_campaigns','classroom_researches');

        return \Inertia\Inertia::render('TrainingMaterial/Index',['user'=>$user, 'items'=>TrainingMaterial::all()]);
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
     * @param  \App\Models\TrainingMaterial  $trainingMaterial
     * @return \Illuminate\Http\Response
     */
    public function show($trainingMaterialId)
    {
        return \Inertia\Inertia::render('TrainingMaterial/Show',['user'=>auth()->user()->load('campaigns'), 'data'=>TrainingMaterial::with('training_material_contents')->findOrFail($trainingMaterialId)]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\TrainingMaterial  $trainingMaterial
     * @return \Illuminate\Http\Response
     */
    public function edit(TrainingMaterial $trainingMaterial)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TrainingMaterial  $trainingMaterial
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TrainingMaterial $trainingMaterial)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TrainingMaterial  $trainingMaterial
     * @return \Illuminate\Http\Response
     */
    public function destroy(TrainingMaterial $trainingMaterial)
    {
        //
    }
}

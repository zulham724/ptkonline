<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\TrainingMaterialContent;
use App\Models\TrainingMaterial;
use Illuminate\Http\Request;

class TrainingMaterialAdminController extends Controller
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
        if($request->has('contents') && $request->has('training_material_id')){
            $trainingMaterial = TrainingMaterial::findOrFail($request->training_material_id);
            $training_material_content_ids=[];
            foreach($request->contents as $training_material_content){
                if(isset($training_material_content['id'])){
                    $training_material_content_db = \App\Models\TrainingMaterialContent::findOrFail($training_material_content['id']);
                }else{
                    $training_material_content_db = new \App\Models\TrainingMaterialContent;
                }
                $training_material_content_db->name=$training_material_content['name'];
                $training_material_content_db->value=$training_material_content['value'];
                $trainingMaterial->training_material_contents()->save($training_material_content_db);
                array_push($training_material_content_ids, $training_material_content_db->id);              
               
            }
            $trainingMaterial->training_material_contents()->whereNotIn('training_material_contents.id',$training_material_content_ids)->delete();
            return $trainingMaterial;
        }
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

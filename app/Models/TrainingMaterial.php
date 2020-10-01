<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TrainingMaterial extends Model
{
    use HasFactory;

    public function training_material_contents(){
        return $this->hasMany('App\Models\TrainingMaterialContent');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClassroomResearch extends Model
{
    use HasFactory;

    protected $table = 'classroom_researches';

    public function classroom_research_contents(){
        return $this->hasMany('App\Models\ClassroomResearchContent');
    }
    public function educational_level(){
        return $this->belongsTo('App\Models\EducationalLevel');
    }

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EducationalLevel extends Model
{
    use HasFactory;
    public function classroom_research_formats(){
        return $this->hasMany('App\Models\ClassroomResearchFormat');
    }
}

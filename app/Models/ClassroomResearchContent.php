<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClassroomResearchContent extends Model
{
    use HasFactory;

    public function plagiarism(){
        return $this->morphOne('App\Models\Plagiarism', 'plagiarism');
    }
}

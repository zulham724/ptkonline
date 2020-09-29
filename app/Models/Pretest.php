<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pretest extends Model
{
    use HasFactory;

    public function question_lists(){
        return $this->belongsToMany('App\Models\QuestionList','pretest_question_lists');
    }
}

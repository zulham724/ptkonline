<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Posttest extends Model
{
    use HasFactory;

    public function question_lists(){
        return $this->belongsToMany('App\Models\QuestionList','posttest_question_lists');
    }
}

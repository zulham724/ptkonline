<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuestionList extends Model
{
    use HasFactory;

    public function answer_lists(){
        return $this->hasMany('App\Models\AnswerList');
    }
    public function question_list_type(){
        return $this->belongsTo('App\Models\QuestionListType');
    }
    public function pretest(){
        return $this->belongsToMany('App\Models\Pretest','pretest_question_lists');
    }
    public function answer(){
        return $this->hasManyThrough('App\Models\Answer','App\Models\Question');
    }
    public function questions(){
        return $this->hasMany('App\Models\Question');
    }
}

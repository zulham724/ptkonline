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
}

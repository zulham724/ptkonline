<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Posttest extends Model
{
    use HasFactory, SoftDeletes;

    public function question_lists(){
        return $this->belongsToMany('App\Models\QuestionList','posttest_question_lists');
    }
    public function campaigns(){
        return $this->morphMany('\App\Models\Campaign','campaign');
    }
}

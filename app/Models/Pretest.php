<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Pretest extends Model
{
    use HasFactory, SoftDeletes;

    public function question_lists(){
        return $this->belongsToMany('App\Models\QuestionList','pretest_question_lists');
    }
    public function campaigns(){
        return $this->morphMany('\App\Models\Campaign','campaign');
    }
    // public function campaign(){
    //     return $this->mor
    // }
    public function auth_campaigns(){
        return $this->morphMany('\App\Models\Campaign','campaign');
    }
}

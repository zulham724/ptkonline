<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;

    public function answer(){
        return $this->hasOne('App\Models\Answer');
    }
    public function question_list(){
        return $this->belongsTo('App\Models\QuestionList');
    }
    protected $guarded = [];
 
}

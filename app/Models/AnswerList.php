<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AnswerList extends Model
{
    use HasFactory;

    public function answers(){
        return $this->hasMany('App\Models\Answer');
    }
}

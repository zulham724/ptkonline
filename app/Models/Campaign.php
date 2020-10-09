<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Campaign extends Model
{
    use HasFactory;

    public function questions(){
        return $this->hasMany('App\Models\Question');
    }
    public function campaign(){
        return $this->morphTo(__FUNCTION__, 'campaign_type', 'campaign_id');
    }
    public function user(){
        return $this->belongsTo('App\Models\User');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    use HasFactory;
    public function educational_level(){
        return $this->belongsTo('App\Models\EducationalLevel');
    }
}

<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\EducationalLevel;
use App\Models\ClassroomResearchFormat;
class AddClassroomResearchFormat extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $educational_levels = EducationalLevel::all();
     
        foreach($educational_levels as $educational_level){
            $lampiran = ClassroomResearchFormat::firstOrCreate([
                'educational_level_id'=>$educational_level->id,
                'name'=>'G. Lampiran',
            ]);
            echo $lampiran->id."\n";
            $daftar_pustaka = ClassroomResearchFormat::firstOrCreate([
                'educational_level_id'=>$educational_level->id,
                'name'=>'H. Daftar Pustaka',
            ]);
            echo $daftar_pustaka->id."\n";
        }
    }
}

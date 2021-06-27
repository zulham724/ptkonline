<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ClassroomResearchContent;
use App\Models\ClassroomResearch;
class AddClassroomResearchContent extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $researchs = ClassroomResearch::all();
        foreach($researchs as $research){
            echo "classroom_reseach_id:".$research->id."\n";
            $lampiran = ClassroomResearchContent::firstOrCreate([
                'classroom_research_id'=>$research->id,
                'name'=>'G. Lampiran',
            ]);
            echo $lampiran->id."\n";
            $daftar_pustaka = ClassroomResearchContent::firstOrCreate([
                'classroom_research_id'=>$research->id,
                'name'=>'H. Daftar Pustaka',
            ]);
            echo $daftar_pustaka->id."\n";
        }
    }
}

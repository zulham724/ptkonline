<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use DB;
class EditClassRoomResearchFormat extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('classroom_research_formats')->where('name','like','%lampiran%')->update([
            'name'=>'Lampiran'
        ]);
        DB::table('classroom_research_formats')->where('name','like','%daftar pustaka%')->update([
            'name'=>'Daftar Pustaka'
        ]);
        DB::table('classroom_research_contents')->where('name','like','%lampiran%')->update([
            'name'=>'Lampiran'
        ]);
        DB::table('classroom_research_contents')->where('name','like','%daftar pustaka%')->update([
            'name'=>'Daftar Pustaka'
        ]);
    
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddPlagiarismScoreToClassroomResearchContentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('classroom_research_contents', function (Blueprint $table) {
            $table->smallInteger('plagiarism_score')->nullable()->after('value');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('classroom_research_contents', function (Blueprint $table) {
            $table->dropColumn('plagiarism_score');
        });
    }
}

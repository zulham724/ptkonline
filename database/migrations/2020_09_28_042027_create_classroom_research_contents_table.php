<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClassroomResearchContentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('classroom_research_contents', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('classroom_research_id');
            $table->timestamps();

            $table->foreign('classroom_research_id')->references('id')->on('classroom_researches')->onDelete('cascade');




        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('classroom_research_contents');
    }
}

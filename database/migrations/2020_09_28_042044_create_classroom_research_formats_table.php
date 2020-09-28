<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClassroomResearchFormatsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('classroom_research_formats', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('educational_level_id')->nullable();
            $table->string('name');
            $table->timestamps();

            $table->foreign('educational_level_id')->references('id')->on('educational_levels')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('classroom_research_formats');
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePosttestQuestionListsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posttest_question_lists', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('posttest_id');
            $table->unsignedBigInteger('question_list_id');
            $table->timestamps();

            $table->foreign('posttest_id')->references('id')->on('posttests')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('question_list_id')->references('id')->on('question_lists')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('posttest_question_lists');
    }
}

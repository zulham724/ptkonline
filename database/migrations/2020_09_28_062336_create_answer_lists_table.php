<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnswerListsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('answer_lists', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('question_list_id');
            $table->text('value');
            $table->integer('score')->nullable();
            $table->timestamps();

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
        Schema::dropIfExists('answer_lists');
    }
}

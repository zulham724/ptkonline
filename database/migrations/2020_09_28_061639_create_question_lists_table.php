<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateQuestionListsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('question_lists', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('question_list_type_id')->nullable();
            $table->text('value');
            $table->timestamps();

            $table->foreign('question_list_type_id')->references('id')->on('question_list_types')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('question_lists');
    }
}

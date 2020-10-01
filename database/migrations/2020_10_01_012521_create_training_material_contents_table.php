<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTrainingMaterialContentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('training_material_contents', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('training_material_id');
            $table->string('name');
            $table->text('value');
            $table->timestamps();
            
            $table->foreign('training_material_id')->references('id')->on('training_materials')->onDelete('cascade')->onUpdate('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('training_material_contents');
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddEducationalLevelIdToClassroomResearchesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('classroom_researches', function (Blueprint $table) {
            $table->unsignedBigInteger('educational_level_id')->nullable()->after('title');
            $table->string('school_name')->nullable()->after('educational_level_id');
            $table->text('school_address')->nullable()->after('educational_level_id');

            $table->foreign('educational_level_id')->references('id')->on('educational_levels')->onDelete('cascade')->onUpdate('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('classroom_researches', function (Blueprint $table) {
            $table->dropForeign('classroom_researches_educational_level_id_foreign');
        });
    }
}

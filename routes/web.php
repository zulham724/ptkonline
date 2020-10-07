<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PretestController;
use App\Http\Controllers\Admin\PretestAdminController;
use App\Http\Controllers\Admin\PosttestAdminController;
use App\Http\Controllers\PosttestController;
use App\Http\Controllers\ClassroomResearchController;
use App\Http\Controllers\ClassroomResearchFormatController;
use App\Http\Controllers\TrainingMaterialController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\CommentController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    //return view('welcome');
    return redirect('dashboard');
});

// Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
//     return Inertia\Inertia::render('Home',['title'=>'Selamat Datang di Dashboard Penelitian Tindakan Kelas Guru','image_path'=>asset('storage/images/')]);
// })->name('dashboard');

// Route::middleware(['auth:sanctum', 'verified'])->get('/pretest', 'PretestController@index')->name('pretest.index');

Route::middleware(['auth:sanctum', 'verified'])->group(function(){
    Route::get('/dashboard', function () {
        //$campaigns = \App\Models\Campaign::where('user_id',auth()->user()->id);
        return Inertia\Inertia::render('Home',['user'=>auth()->user()->load('campaigns'),'title'=>'Selamat Datang di Dashboard Penelitian Tindakan Kelas Guru','image_path'=>asset('storage/images/')]);
    })->name('dashboard');

    Route::resource('pretests', PretestController::class);
    Route::resource('posttests', PosttestController::class);
    Route::resource('classroom_researches', ClassroomResearchController::class);
    Route::resource('training_materials', TrainingMaterialController::class);
    Route::resource('posts', PostController::class);
    Route::resource('posts.comments', CommentController::class);
    Route::get('educational_level/{id}/classroom_research_format',[ClassroomResearchFormatController::class,'getByEducatioanlLevel']);

    Route::get('classroom_research_plagiarism/{id}', [ClassroomResearchController::class, 'getplagiarism']);
    

});


// Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
//     return Inertia\Inertia::render('Test',['test'=>'jancok']);
// })->name('dashboard');

Route::get('/test', function(){
    return \App\Models\ClassroomResearch::with(['educational_level',])->where('user_id',auth()->user()->id)->selectRaw('classroom_researches.*')->groupBy('id')->get();

});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    Route::middleware('admin.user')->group(function(){
        Route::get('custom_pretest_question_lists',function(){
            return view('custom_pretest');
        })->name('custom_pretest_question_lists.index');

        Route::get('custom_posttest_question_lists',function(){
            return view('custom_posttest');
        })->name('custom_posttest_question_lists.index');

        Route::get('custom_training_material_contents/{training_material_id?}',function($training_material_id=null){
            return view('custom_training_material_contents',['training_material_id'=>$training_material_id]);
        })->name('custom_training_material_contents.index');

        Route::get('getpretests',function(){
            return \App\Models\Pretest::all(); 
        });
        Route::get('getposttests',function(){
            return \App\Models\Posttest::all(); 
        });
        Route::get('gettrainingmaterials',function(){
            return \App\Models\TrainingMaterial::all(); 
        });

        Route::get('getpretestquestionlists/{pretest_id}', function($pretest_id){
            return \App\Models\Pretest::with('question_lists.answer_lists','question_lists.question_list_type')->findOrFail($pretest_id);
        });
        Route::get('getposttestquestionlists/{posttest_id}', function($posttest_id){
            return \App\Models\Posttest::with('question_lists.answer_lists','question_lists.question_list_type')->findOrFail($posttest_id);
        });
        Route::get('gettrainingmaterialcontents/{training_material_id}', function($training_material_id){
            return \App\Models\TrainingMaterial::with('training_material_contents')->findOrFail($training_material_id);
        });

        Route::post('pretestquestionlists', [PretestAdminController::class, 'store']);
        Route::post('posttestquestionlists', [PosttestAdminController::class, 'store']);
    });
   
});


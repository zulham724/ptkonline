<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PretestController;
use App\Http\Controllers\Admin\PretestAdminController;
use App\Http\Controllers\Admin\PosttestAdminController;
use App\Http\Controllers\Admin\TrainingMaterialAdminController;
use App\Http\Controllers\Admin\UserAdminController;
use App\Http\Controllers\Admin\PosttestCampaignAdminController;
use App\Http\Controllers\Admin\PretestCampaignAdminController;

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



Route::middleware(['auth:sanctum', 'verified'])->get('/profile', function () {
    return Inertia\Inertia::render('Dashboard');
})->name('profile.dashboard');

// Route::middleware(['auth:sanctum', 'verified'])->get('/pretest', 'PretestController@index')->name('pretest.index');

Route::middleware(['auth:sanctum', 'verified'])->group(function(){
    Route::get('/dashboard', function () {
        //$campaigns = \App\Models\Campaign::where('user_id',auth()->user()->id);
        $user = auth()->user()->loadCount('pretest_campaigns','posttest_campaigns','classroom_researches');
        return Inertia\Inertia::render('Home',['user'=>$user,'title'=>'Selamat Datang di Dashboard Penelitian Tindakan Kelas Guru','image_path'=>asset('storage/images/')]);
    })->name('dashboard');

    Route::resource('pretests', PretestController::class);
    Route::resource('posttests', PosttestController::class);
    Route::resource('classroom_researches', ClassroomResearchController::class);
    Route::resource('training_materials', TrainingMaterialController::class);
    Route::resource('posts', PostController::class);
    Route::resource('posts.comments', CommentController::class);
    Route::get('achievements', function(){
        $user = auth()->user()->loadCount('pretest_campaigns','posttest_campaigns','classroom_researches');
        $items = auth()->user()->load('profile.educational_level','pretest_campaigns.campaign','posttest_campaigns.campaign');
        return Inertia\Inertia::render('Achievement/Index',['user'=>$user, 'items'=>$items]);
    })->name('achievements.index');
    Route::get('educational_level/{id}/classroom_research_format',[ClassroomResearchFormatController::class,'getByEducatioanlLevel']);

    Route::get('classroom_research_plagiarism/{id}', [ClassroomResearchController::class, 'getplagiarism']);
    

});


// Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
//     return Inertia\Inertia::render('Test',['test'=>'jancok']);
// })->name('dashboard');

Route::get('/test', function(){
   return auth()->user()->load('profile.educational_level','pretest_campaigns.campaign','posttest_campaigns.campaign');

})->middleware('auth:sanctum');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    Route::middleware('admin.user')->group(function(){
        Route::get('custom_pretest_question_lists/{pretest_id?}',function($pretest_id=null){
            return view('custom_pretest',['pretest_id'=>$pretest_id]);
        })->name('custom_pretest_question_lists.index');

        Route::get('custom_posttest_question_lists/{posttest_id?}',function($posttest_id=null){
            return view('custom_posttest',['posttest_id'=>$posttest_id]);
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
        Route::get('getpretestcampaignlists/{pretest_id}', [PretestCampaignAdminController::class,'getpretestcampaignlists']);

        Route::get('getposttestquestionlists/{posttest_id}', function($posttest_id){
            return \App\Models\Posttest::with('question_lists.answer_lists','question_lists.question_list_type')->findOrFail($posttest_id);
        });
        Route::get('gettrainingmaterialcontents/{training_material_id}', function($training_material_id){
            return \App\Models\TrainingMaterial::with('training_material_contents')->findOrFail($training_material_id);
        });
        
        Route::post('pretestquestionlists', [PretestAdminController::class, 'store']);
        Route::post('posttestquestionlists', [PosttestAdminController::class, 'store']);
        Route::post('trainingmaterialcontents', [TrainingMaterialAdminController::class, 'store']);

        //user reports
        Route::get('userreports',function(){
            return view('userreports');
        })->name('userreports.index');

        Route::post('getuserslistpagination',[UserAdminController::class,'userslist']);

        Route::post('pretest/{pretest_id}/getcampaignlistpagination',[PretestCampaignAdminController::class,'getcampaignlistpagination']);
        Route::post('posttest/{posttest_id}/getcampaignlistpagination',[PosttestCampaignAdminController::class,'getcampaignlistpagination']);

        Route::get('pretest/getcampaignquestionlist/{campaign_id}',[PretestCampaignAdminController::class,'getcampaignquestionlist']);
        Route::get('posttest/getcampaignquestionlist/{campaign_id}',[PosttestCampaignAdminController::class,'getcampaignquestionlist']);

        Route::get('pretest_assessment',[PretestCampaignAdminController::class,'index'])->name('pretest_assessment.index');
        Route::get('posttest_assessment',[PosttestCampaignAdminController::class,'index'])->name('posttest_assessment.index');

        //submit penilaian
        Route::post('pretest/campaign/{campaign_id}',[PretestCampaignAdminController::class, 'updateByCampaign']);
        Route::post('posttest/campaign/{campaign_id}',[PosttestCampaignAdminController::class, 'updateByCampaign']);
        //Route::get('posttest_assessment');
    });
   
});


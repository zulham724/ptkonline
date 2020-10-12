<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Posttest;
use Illuminate\Http\Request;

class PosttestCampaignAdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('custom_posttest_assessment');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Posttest  $posttest
     * @return \Illuminate\Http\Response
     */
    public function show(Posttest $posttest)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Posttest  $posttest
     * @return \Illuminate\Http\Response
     */
    public function edit(Posttest $posttest)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Posttest  $posttest
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Posttest $posttest)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Posttest  $posttest
     * @return \Illuminate\Http\Response
     */
    public function destroy(Posttest $posttest)
    {
        //
    }
    public function getcampaignlistpagination(Request $request, $posttest_id){
        $itemsPerPage = $request->query('itemsPerPage')?$request->query('itemsPerPage'):10;
        $res=\App\Models\Campaign::with('user.profile.educational_level','campaign');

        $res->whereHasMorph('campaign','App\Models\Posttest', function($query)use($posttest_id){
            if($posttest_id!='-1')$query->where('id',$posttest_id);
        });
        
        
        

        return response()->json(['totalData'=>$res->count(),'data'=>$res->paginate($itemsPerPage)]);


    }
    public function getcampaignquestionlist($campaign_id){
        //return $campaign_id;
        $campaign = \App\Models\Campaign::findOrFail($campaign_id);
        $res = \App\Models\Question::with('answer','question_list.answer_lists','question_list.question_list_type')->where('campaign_id','=',$campaign->id)->orderBy('question_list_id')->get();
        return response()->json(['questions'=>$res,'campaign'=>$campaign]);
    }
    public function updatebyCampaign(Request $request, $campaign_id){
        //hanya pilih soal yg uraian (textfield)
        // $campaign=\App\Models\Campaign::with(['questions'=>function($query){
        //     $query->whereHas('question_list.question_list_type',function($query2){
        //         $query2->where('question_list_types.name','textfield');
        //     });
        // }])->findOrFail($campaign_id);
        
        $campaign=\App\Models\Campaign::with('questions.question_list.question_list_type')->findOrFail($campaign_id);
        $questions_collect = collect($request->questions);
        $totalScore=0;
        foreach($campaign->questions as $question_db){
            if($question_db->question_list->question_list_type->name=='textfield'){
                $index = $questions_collect->search(function($item, $key)use($question_db){
                    return $item['id']==$question_db->id;
                });
                $question_db->answer->score=$questions_collect[$index]['answer']['score'];
                //dd($questions_collect[$index]['answer']['score']);
                $question_db->answer->save();
            }else{
                $answer_list_db = \App\Models\AnswerList::findOrFail($question_db->answer->answer_list_id);
                $question_db->answer->score = $answer_list_db->score;
            }
            $totalScore += $question_db->answer->score;
        }
        $questions_count = count($campaign->questions);
        $totalScore=$questions_count>0?$totalScore/$questions_count:0;
        //update score pada model table campaigns
        $campaign->value = $totalScore;
        $campaign->save();
        return $campaign;
    }
}

<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Pretest;
use Illuminate\Http\Request;

class PretestCampaignAdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('custom_pretest_assessment');
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
        
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pretest  $pretest
     * @return \Illuminate\Http\Response
     */
    public function show(Pretest $pretest)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Pretest  $pretest
     * @return \Illuminate\Http\Response
     */
    public function edit(Pretest $pretest)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pretest  $pretest
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pretest $pretest)
    {
        //return $request;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pretest  $pretest
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pretest $pretest)
    {
        
    }
    // public function getpretestcampaignlists($pretest_id=null){
    //     //return 'asu';
        
    //     return \App\Models\Campaign::with('questions.question_list.pretest')->whereHas('questions',function($query)use($pretest_id){
    //         $query->whereHas('question_list',function($query2)use($pretest_id){
    //             $query2->whereHas('pretest',function($query3)use($pretest_id){
    //                 $query3->where('pretests.id','=',$pretest_id);
    //             });
    //         });
    //     })->paginate();
    // }
    public function getcampaignlistpagination(Request $request, $pretest_id){
        $itemsPerPage = $request->query('itemsPerPage')?$request->query('itemsPerPage'):10;
        $res=\App\Models\Campaign::with('user.profile.educational_level','campaign');

        if($pretest_id!='-1'){
            $res->whereHasMorph('campaign','App\Models\Pretest', function($query)use($pretest_id){
                $query->where('id',$pretest_id);
            });
        }
        
        

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
        $totalScore=$totalScore>0?$totalScore/count($campaign->questions):0;
        //update score pada model table campaigns
        $campaign->value = $totalScore;
        $campaign->save();
        return $campaign;
    }
}

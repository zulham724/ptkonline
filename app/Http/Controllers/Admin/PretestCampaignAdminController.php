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
        //
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
        //
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
        $res = \App\Models\Question::with('answer','question_list.answer_lists','question_list.question_list_type')->where('campaign_id','=',$campaign_id)->orderBy('question_list_id')->get();
        return $res;
    }
}

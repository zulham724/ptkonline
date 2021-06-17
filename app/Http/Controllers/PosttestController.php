<?php

namespace App\Http\Controllers;

use App\Models\Posttest;
use Illuminate\Http\Request;
use App\Models\Campaign;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Answer;
use Carbon\Carbon;
use App\Models\PosttestQuestionList;
use App\Models\QuestionList;
use App\Models\Question;
use App\Models\AnswerList;
use DB;


class PosttestController extends Controller
{
    private $timer;
    private $minute;
    public function __construct(){
        $this->minute = intval(env('POSTTEST_TIMER',7));
        $this->timer = 60*$this->minute;
    }
    // menyimpan jawaban sementara pada saat mengerjakan soal
    public function setAnswers(Request $request, $posttest_id){
        $request->validate([
            'question_lists'=>'array',
            // 'question_lists.*.question_list_type'=>'required',
            'question_lists.*.answer_lists'=>'array',
        ]);
        $user = $request->user();
        
        $campaign = Campaign::with('questions.question_list.question_list_type')->whereHasMorph('campaignable', [Posttest::class],  function (Builder $query)use($posttest_id, $user) {
            $query->where('posttests.id', $posttest_id);
        })->where('user_id', $user->id)->first();

        // jika ada campaign dgn posttest id tsb, maka set answers
        if($campaign){
            
            $user_question_lists = [];
            foreach($request->question_lists as $question_list){
                $user_question_lists[$question_list['id']] = $question_list;
                if(isset($question_list['answer_lists'])){
                    $user_question_lists[$question_list['id']]['arr_answer_lists']=[];
                    foreach($question_list['answer_lists'] as $answer_list){
                        $user_question_lists[$question_list['id']]['arr_answer_lists'][$answer_list['id']] = $answer_list;
                    }
                }
              
            }
            // return $user_question_lists;
            try {

                DB::beginTransaction();
                foreach($campaign->questions as $question){
                    $question_type = $question->question_list->question_list_type->name;
                    // jika pilihan ganda (selectoptions), maka
                    if($question_type=="selectoptions"){
                        $user_question_list = $user_question_lists[$question->question_list_id];
                        $selected_answer_list_id = $user_question_list['answer']; //answer_list_id yg dipilih
                        if($selected_answer_list_id)$value=$user_question_list['arr_answer_lists'][$selected_answer_list_id]['value'];
                        else $value=null;
                        // jika soal pilihan ganda, masukkan answer_list_id dan value yg dipilih user
                        Answer::updateOrCreate(
                            ['question_id'=>$question->id],
                            ['answer_list_id'=>$selected_answer_list_id, 
                            'value'=>$value]
                        );
                    }elseif($question_type=="textfield"){
                        // jika soal teks, biarkan answer_list_id'nya null dan masukkan value yg ditulis user 
                        Answer::updateOrCreate(
                            ['question_id'=>$question->id],
                            ['answer_list_id'=>null, 'value'=>$user_question_lists[$question->question_list_id]['answer']]
                        );
                    }
                
                }
              
                DB::commit();
            } catch (\PDOException $e) {
                // Woopsy
                dd($e);
                DB::rollBack();
            }
            // return $campaign->questions;

        }
    
      
    }
    // cek apakah ada campaign dgn  yg is_submitted=false tpi belum expired
    public function checkIsCampaignable($target_id){
        $user = auth()->user();
        $exists = Campaign::whereHasMorph('campaignable', [Posttest::class], function(Builder $query)use($target_id){
            $query->where('id','!=',$target_id);
        })->where(function($query){
            $query->where('is_submitted',false)->orWhereNull('is_submitted');
        })->whereRaw('TIMESTAMPDIFF(SECOND,campaigns.created_at,?)<=?', [Carbon::now(), $this->timer])
        ->where('user_id', $user->id)->exists();
        if($exists)return false;
        return true; 
    }
     // cek apakah ada pretest campaign yg aktif (belum expired) dan is_submitted=false
     public function checkActivePretestCampaign(){
        $seconds_end = 60*intval(env('PRETEST_TIMER', 5));
        $user = auth()->user();
        $exists = Campaign::whereHasMorph('campaignable', [\App\Models\Pretest::class])
        ->where(function(Builder $query){
            $query->where('is_submitted',false)->orWhereNull('is_submitted');
        })->whereRaw('TIMESTAMPDIFF(SECOND,campaigns.created_at,?)<=?', [Carbon::now(), $seconds_end])
        ->where('user_id', $user->id)->exists();
        if($exists)return true;
        return false;
    }
    public function checkIsExpired($target_id){
        $user = auth()->user();
        $exists = Campaign::whereHasMorph('campaignable', [Posttest::class], function(Builder $query)use($target_id){
            $query->where('id',$target_id);
        })->whereRaw('TIMESTAMPDIFF(SECOND,campaigns.created_at,?)<=?', [Carbon::now(), $this->timer])
        ->where('user_id', $user->id)->exists();
        if($exists)return false;
        return true; 
    }
    private function getNotExpiredPosttestCampaignQuery($posttest_id){
        $user = auth()->user();
        $query = Campaign::whereHasMorph('campaignable', [Posttest::class],  function (Builder $query)use($posttest_id, $user) {
            $query->where('posttests.id', $posttest_id)
            ->whereRaw('TIMESTAMPDIFF(SECOND,campaigns.created_at,?)<=?', [Carbon::now(), $this->timer]);
        })->where('user_id', $user->id);
        return $query;
    }
    public function beginTest(Request $request, $posttest_id){

        if(!$this->checkIsCampaignable($posttest_id)){
            $request->session()->flash('warning', 'Ada soal posttest lain yang masih dikerjakan');
            return redirect()->route('posttests.index');
        }
        if($this->checkActivePretestCampaign()){
            $request->session()->flash('warning', 'Ada soal pretest yang masih dikerjakan');
            return redirect()->route('pretests.index');
        }
        // BEGIN preprocessing posttest
        $posttest = Posttest::findOrFail($posttest_id);
        $user = auth()->user();
        $campaign = Campaign::whereHasMorph('campaignable', [Posttest::class],  function (Builder $query)use($posttest, $user) {
            $query->where('posttests.id', $posttest->id);
        })->where('user_id', $user->id)->first();

        $posttest->load(['question_lists.question_list_type','question_lists.answer_lists'=>function($query){
            $query->select('answer_lists.id','answer_lists.value','answer_lists.question_list_id');
        }])->has('question_lists');
        
        $posttest->question_lists->transform(function($item,$key){
            $item->answer=null;
            if($item->question_list_type->name=='textfield')unset($item['answer_lists']);
            return $item;
        });
        // END preprocessing posttest

        // jika campaign dgn $posttest_id sudah ada, maka load data dgn answer yg sudah ada
        if($campaign){
            //check jika campaign expired
            if(!$this->getNotExpiredPosttestCampaignQuery($posttest->id)->exists()){
                $request->session()->flash('warning', 'Waktu telah habis!');
                return redirect()->route('posttests.index'); 
            }

            // menampung db question_lists ke array dgn key berupa ID
            $db_question_lists = [];
            foreach($posttest->question_lists as $question_list){
                $db_question_lists[$question_list->id] = $question_list;
            }
            $new_question_lists = [];

            // load questions
            $campaign->load('questions.answer','questions.question_list.question_list_type');
            foreach($campaign->questions as $question){
                $new_question_lists[$question->id] = $db_question_lists[$question->question_list_id];

                if($new_question_lists[$question->id]->question_list_type->name=="textfield"){
                    
                    $new_question_lists[$question->id]->answer = $question->answer?$question->answer->value:null;
                }else{
                    // jika piliha ganda, answer adalah answer_list_id 
                    $new_question_lists[$question->id]->answer = $question->answer?$question->answer->answer_list_id:null;
                }

            }
            
            unset($posttest->question_lists);

            $posttest->question_lists = collect();
            foreach($new_question_lists as  $new_question_list){
                $posttest->question_lists->push($new_question_list);
            }
            // return $posttest;

            // return \Inertia\Inertia::render('Posttest/Show',['user'=>auth()->user()->load('campaigns'),'data'=>$posttest, 'campaign'=>$campaign]);

        }else{
 
            // soal diacak jika dibuka pertama kali
            $shuffled = $posttest->question_lists->shuffle();
            unset($posttest->question_lists);
            $posttest->question_lists = $shuffled->all();

            // mulai transaction
            try {
                DB::beginTransaction();
                 //masukkan posttest ke campaign
                $campaign = new Campaign;
                $campaign->user_id = $user->id;
                $posttest->campaigns()->save($campaign);
                
                $questions = [];
                foreach($posttest->question_lists as $question_list){
                    $questions[] = ['campaign_id'=>$campaign->id,'question_list_id'=>$question_list['id'],'value'=>$question_list['value']];
                }
                //masukkan campaign id ke questions
                DB::table('questions')->insert($questions);

                DB::commit();
                // return \Inertia\Inertia::render('Posttest/Show',['user'=>auth()->user()->load('campaigns'),'data'=>$posttest, 'campaign'=>$campaign]);
            }catch (\PDOException $e) {
                // Woopsy
                DB::rollBack();
                dd($e);
            }
 
    
        }

        $end_at = $campaign->created_at->addMinutes($this->minute);
        $campaign->end_at = $end_at->toDateTimeString();
        $campaign->start_at = $campaign->created_at->toDateTimeString();
        $campaign->end_at_timestamp = $end_at->timestamp;
        $campaign->start_at_timestamp = $campaign->created_at->timestamp;
       
        return \Inertia\Inertia::render('Posttest/Show',['user'=>auth()->user()->load('campaigns'),'data'=>$posttest, 'campaign'=>$campaign]);

        
        
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $user = auth()->user()->loadCount('posttest_campaigns','posttest_campaigns','classroom_researches');
        
        // $posttest_campaigns = DB::table('campaigns as c')->where('c.user_id',$user->id)
        // ->join('posttests as p','p.id','=','c.campaign_id')
        // ->where('c.campaign_type','App\Models\Posttest')
        // ->where('c.is_publish',true)
        // ->orderBy('c.id','desc')->get();
        // return $posttest_campaign;

    //    return $data->get()  ;
        // return $campaign_items;
        //return Posttest::withCount('question_lists')->get();
        $user = auth()->user()->loadCount('posttest_campaigns','posttest_campaigns','classroom_researches');

        $posttests = Posttest::withCount('question_lists')->whereDoesntHave('campaigns',function($query)use($user){
            $query->where('campaigns.user_id','=',$user->id);
        })->get();

        $uncompleted_posttests =  Posttest::withCount('question_lists')->whereHas('campaigns',function($query)use($user){
            $query->where('campaigns.user_id','=',$user->id)->where(function($query2){
                $query2->where('is_submitted',false)->orWhereNull('is_submitted')
                ->whereRaw('TIMESTAMPDIFF(SECOND,campaigns.created_at,?)<=?', [Carbon::now(), $this->timer]);
            });
        })->get();

        // completed jika is_submitted=true dan selisih now() dan campaign.created_at > $this->timer
        $completed_posttests = Campaign::with('campaignable')->whereHasMorph('campaignable', [Posttest::class], function(Builder $query){
            $query->where('is_submitted',true)->orWhereRaw('TIMESTAMPDIFF(SECOND,campaigns.created_at,?)>?', [Carbon::now(), $this->timer]);
        })->where('user_id', $user->id)->orderBy('campaigns.id','desc')->get();
        // return $
        return \Inertia\Inertia::render('Posttest/Index',['completed_posttests'=>$completed_posttests, 'user'=>$user, 'uncompleted_posttests'=>$uncompleted_posttests, 'items'=>$posttests]);
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

    // mengurutkan apakah 2 array number sama. contoh: [3,2,1] dan [1,3,2] adalah sama
    function checkIsSame($a, $b){
        if(count($a)!==count($b))return false;
        sort($a);
        sort($b);
        foreach($a as $k=>$v){
            if($v!==$b[$k])return false;
        }
        return true;
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    
    public function store(Request $request)
    {
        $request->validate([
            'question_lists'=>'array',
            'question_lists.*.id'=>'required',
            // 'question_lists.*.answer'=>'required', jgn di required karena saat forceSubmit, answer boleh null
        ]);
        // inisialisasi
        foreach($request->question_lists as $question_list){
            if(!$question_list['answer']){
                $question_list['answer'] = null;
            }
        }

        $user = $request->user();
        $posttest = Posttest::findOrFail($request->id);
        // cek apakah ada campaign dgn posttest_id sekain dan user auth
        $campaign = Campaign::whereHasMorph('campaignable',[Posttest::class],  function (Builder $query, $type)use($posttest, $user) {
            $query->where('posttests.id', $posttest->id);
        })->where('user_id', $user->id)->first();

        if($campaign){
            // PENTING: ditambah 30 detik karena latency internet
            $begin = $campaign->created_at->addSeconds(30);
            
            $end = Carbon::now(); 
            $diff = $begin->diffInSeconds($end);
            // jika lebih besar dri $this->timer detik, maka jgn simpan
            if($diff>$this->timer){
                $request->session()->flash('error', 'Waktu telah habis!');
                return redirect()->route('posttests.index');
            }
            if($campaign->is_submitted){
                $request->session()->flash('warning', 'Anda sudah mengerjakan soal ini');
                return redirect()->route('posttests.index');

            }
            try {
                $posttest->load('question_lists.question_list_type','question_lists.answer_lists');
                // menampung question lists dan jawaban ke array key
                $db_question_list_ids = [];
                $db_question_lists = [];
                foreach($posttest->question_lists as $question_list){
                    $db_question_lists[$question_list->id] = $question_list;
                    // menampung answer_lists di array key
                    $arr_answer_lists = [];
                    foreach($db_question_lists[$question_list->id]->answer_lists as $answer_list){
                        $arr_answer_lists[$answer_list->id] = $answer_list;
                    }
                    $db_question_lists[$question_list->id]->arr_answer_lists = $arr_answer_lists;
                    $db_question_list_ids[] = $question_list->id;
                }

                // return $db_question_lists;
                // $campaign = new \App\Models\Campaign;
                // $campaign->user_id = auth()->user()->id;
                // $posttest->campaigns()->save($campaign);
    
                //$campaign = $request->user()->campaigns()->save(new \App\Models\Campaign);
                $request_question_list_ids = [];
                $request_question_lists = [];
                foreach($request->question_lists as $question_list){
                    $request_question_list_ids[] = $question_list['id'];
                    $request_question_lists[$question_list['id']] = $question_list;
                }
                
                // jika id pada request question_lists dan db question_lists tidak identik, maka throw error
                if(!$this->checkIsSame($db_question_list_ids, $request_question_list_ids)){
                    return response('<h1>Opps, ngapain gan :p</h1>', 403);
                }

              
                DB::beginTransaction();
 
                foreach($request_question_lists as $question_list){

                    $db_question_list = $db_question_lists[$question_list['id']];

                    // walaupun data `question` di sudah ada hasil dri method setanswers, tpi buat jaga2 saja
                    Question::updateOrCreate(['campaign_id'=>$campaign->id, 
                    'question_list_id'=>$db_question_list->id],
                    ['value'=>$db_question_list->value, 'updated_at'=>Carbon::now()]
                    );

                    // $question_list_type = $db_question_list->question_list_type;
                   
                 

                    // $question = QuestionList::findOrFail($question_list['id']);
                    // $question_db = new Question;
                    // $question_db->question_list_id = $question->id;
                    // $question_db->value = $question->value;
    
                    // $campaign->questions()->save($question_db);
    
                    // $answer_db = new Answer; 
                    // if($question->question_list_type->name=="selectoptions"){
                    //     $answer = AnswerList::findOrFail($question_list['answer']);
                    //     $answer_db->answer_list_id = $answer->id;
                    //     $answer_db->value = $answer->value;
                    //     $answer_db->score = $answer->score;
                    //     $selectoptions_count++;
                    // }else{
                    //     $answer_db->answer_list_id = null;
                    //     $answer_db->score = null; //jika uraian maka harus koreksi manual
                    //     $answer_db->value = $question_list['answer'];
                    //     $textfield_count++;
                    // }
                    // $score+=$answer_db->score;
                    // $question_db->answer()->save($answer_db);
    
                }
                // setelah Question::updateOrCreate dri proses di atas, pasti ada campaign->questions
                $score_total = 0;
                $selectoptions_count = $textfield_count = 0;
                
                foreach($campaign->questions as $question){
                    $db_question_list = $db_question_lists[$question->question_list_id];
                    $request_question_list = $request_question_lists[$question->question_list_id];

                    $question_list_type = $db_question_list->question_list_type;

                    if($question_list_type->name=="selectoptions"){
                        $selectoptions_count++; 

                        //jika pilihan ganda, score'nya antara 100 (benar) atau 0 (salah)
                        if($request_question_list['answer']){
                            $request_answer = $db_question_list->arr_answer_lists[$request_question_list['answer']];
                            $score = $request_answer?$request_answer['score']:0;
                        }else{
                            $score = 0;
                        }
                       

                        $score_total+=$score;

                        $selected_answer_list_id = $request_question_list['answer']; //answer adalah answer_list_id yg dipilih user
                        $value = $db_question_list->value;
                    
                    }else{
                        $textfield_count++;
                        $score = null; //jika uraian maka harus koreksi manual
                        $selected_answer_list_id = null; //jika uraian maka tidak perlu answer_list_id
                        $value = $request_question_list['answer']; //answer adalah kalimat jawaban dri user
                    }
                    Answer::updateOrCreate([
                        'question_id'=>$question->id,
                    ], ['score'=>$score, 'value'=>$value, 'answer_list_id'=>$selected_answer_list_id,]);
                }
                // jika semua soal pilihan ganda, maka langsung hitung skor akhir dan simpan di campaign
                if($selectoptions_count==count($db_question_lists)){
                    $score=$score_total/$selectoptions_count;
                    $campaign->value = $score;
                   
                }
                $campaign->is_submitted = true; 
                $campaign->save();

                DB::commit();
            }catch (\PDOException $e) {
                // Woopsy
                dd($e);
                DB::rollBack();
            }

        }
      
        // return 'cok';
        // if($campaign)
        //return $request;
        
        
        $request->session()->flash('success', 'Selamat, soal berhasil disubmit');  
        return redirect()->route('posttests.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Posttest  $posttest
     * @return \Illuminate\Http\Response
     */
    public function show(Posttest $posttest)
    {
        
        
        // $posttest->load(['question_lists.question_list_type','question_lists.answer_lists'=>function($query){
        //     $query->select('answer_lists.id','answer_lists.value','answer_lists.question_list_id');
        // }])->whereHas('question_lists',function($query){
        //     //$query->where
        // });
        // $posttest->question_lists->transform(function($item,$key){
        //     $item->answer=null;
        //     if($item->question_list_type->name=='textfield')unset($item['answer_lists']);
        //     return $item;
        // });
        // $shuffled = $posttest->question_lists->shuffle();
        // unset($posttest->question_lists);
        // $posttest->question_lists = $shuffled->all();
        // // return $posttest->question_lists;
  
        // //return $data;
        // return \Inertia\Inertia::render('Posttest/Show',['user'=>auth()->user()->load('campaigns'),'data'=>$posttest]);

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
}

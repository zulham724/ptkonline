<?php

namespace App\Jobs;

use Illuminate\Support\Facades\DB;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\ClassroomResearch;
use App\Helper\CheckPlagiarism;
class ProcessClassRoomResearch implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    protected $classroomResearch;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(ClassroomResearch $classroomResearch)
    {
        $this->classroomResearch = $classroomResearch;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        //echo CheckPlagiarism::getPercentage("asu","asssadassu");
        $this->classroomResearch->load('classroom_research_contents');
        //print_r($this->classroomResearch);
        //$all
        //DB::enableQueryLog(); // Enable query log

        // $allpreviouscontents=\App\Models\ClassroomResearchContent::where('classroom_research_id','!=',$this->classroomResearch->id)->where('created_at','<=', $this->classroomResearch->created_at)->get();
        $allpreviouscontents=\App\Models\ClassroomResearchContent::where('classroom_research_id','!=',$this->classroomResearch->id)->where('classroom_research_id','<', $this->classroomResearch->id)->get();

        //dd(DB::getQueryLog()); // Show results of log
        //dd($allpreviouscontents);
        foreach($this->classroomResearch->classroom_research_contents as $classroom_research_content){
          $id_values=[];
          $score_values=[];
          foreach($allpreviouscontents as $content){
            $plagiarismPercentage = CheckPlagiarism::getPercentage($classroom_research_content->value,$content->value);
            array_push($id_values, $content->id);
            array_push($score_values, $plagiarismPercentage);
          }
          $plagiarism_db = new \App\Models\Plagiarism;
          $plagiarism_db->id_values = json_encode($id_values);
          $plagiarism_db->score_values = json_encode($score_values);
          $classroom_research_content->plagiarism()->save($plagiarism_db);

          $id_values_count = count($id_values);
          $classroom_research_content->plagiarism_score =  $id_values_count>=1?array_sum($score_values) / $id_values_count : 0;
          $classroom_research_content->save();
        }
    }
}

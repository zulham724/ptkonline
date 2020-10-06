<?php

namespace App\Jobs;

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
        $allcontents=\App\Models\ClassroomResearchContent::where('classroom_research_id','!=',$this->classroomResearch->id)->get();
        foreach($classroomResearch->classroom_research_contents as $classroom_research_content){
          foreach($allcontents as $content){
            $plagiarismPercentage = CheckPlagiarism::getPercentage($classroom_research_content,$content);
          }
        }
    }
}

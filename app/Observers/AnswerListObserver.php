<?php

namespace App\Observers;

use App\Models\AnswerList;

class AnswerListObserver
{
    /**
     * Handle the answer list "created" event.
     *
     * @param  \App\Models\AnswerList  $answerList
     * @return void
     */
    public function created(AnswerList $answerList)
    {
        //
    }

    /**
     * Handle the answer list "updated" event.
     *
     * @param  \App\Models\AnswerList  $answerList
     * @return void
     */
    public function updated(AnswerList $answerList)
    {
        $answerList->answers()->update(['score'=>$answerList->score]);
    }

    /**
     * Handle the answer list "deleted" event.
     *
     * @param  \App\Models\AnswerList  $answerList
     * @return void
     */
    public function deleted(AnswerList $answerList)
    {
        //
    }

    /**
     * Handle the answer list "restored" event.
     *
     * @param  \App\Models\AnswerList  $answerList
     * @return void
     */
    public function restored(AnswerList $answerList)
    {
        //
    }

    /**
     * Handle the answer list "force deleted" event.
     *
     * @param  \App\Models\AnswerList  $answerList
     * @return void
     */
    public function forceDeleted(AnswerList $answerList)
    {
        //
    }
}

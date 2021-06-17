<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Database\Eloquent\Builder;

class HandleInertiaRequests 
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        Inertia::share('flash',  [
            'success' => fn () => $request->session()->get('success'),
            'error' => fn () => $request->session()->get('error'),
            'warning' => fn () => $request->session()->get('warning')
        ]);
        Inertia::share('active_campaign', fn() => $this->getActiveCampaign($request));

        return $next($request);
    }
    private function getActiveCampaign($request){
        // return null;
        $user = $request->user();
        $seconds_end = 60*env('PRETEST_TIMER', 5);
        //cek apakah ada pretest campaign yg belum expired dan belum disubmit
        $pretest_campaign = \App\Models\Campaign::whereHasMorph('campaignable',[\App\Models\Pretest::class])->where(function(Builder $query){
            $query->where('is_submitted',false)->orWhereNull('is_submitted');
        })->where('user_id',$user->id)->whereRaw('TIMESTAMPDIFF(SECOND,campaigns.created_at,?)<=?', [\Carbon\Carbon::now(), $seconds_end]);
        if($pretest_campaign->exists()){
          
            $pretest_campaign =  $pretest_campaign->first();
            $end_at = $pretest_campaign->created_at->addSeconds($seconds_end);
            $pretest_campaign->start_at = $pretest_campaign->created_at->toDateTimeString();
            $pretest_campaign->start_at_timestamp = $pretest_campaign->created_at->timestamp;
            $pretest_campaign->end_at = $end_at->toDateTimeString();
            $pretest_campaign->end_at_timestamp = $end_at->timestamp;
            return $pretest_campaign;
        }

        //cek apakah ada posttest campaign yg belum expired dan belum disubmit
        $seconds_end = 60*env('POSTTEST_TIMER', 7);
        $posttest_campaign = \App\Models\Campaign::whereHasMorph('campaignable',[\App\Models\Posttest::class])->where(function(Builder $query){
            $query->where('is_submitted',false)->orWhereNull('is_submitted');
        })->where('user_id',$user->id)->whereRaw('TIMESTAMPDIFF(SECOND,campaigns.created_at,?)<=?', [\Carbon\Carbon::now(), $seconds_end]);
        if($posttest_campaign->exists()){

            $posttest_campaign = $posttest_campaign->first();
            $end_at = $posttest_campaign->created_at->addSeconds($seconds_end);
            $posttest_campaign->start_at = $posttest_campaign->created_at->toDateTimeString();
            $posttest_campaign->start_at_timestamp = $posttest_campaign->created_at->timestamp;
            $posttest_campaign->end_at = $end_at->toDateTimeString();
            $posttest_campaign->end_at_timestamp = $end_at->timestamp;
            return $posttest_campaign;
        }
        return null;

    }
}

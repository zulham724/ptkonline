<?php

namespace App\Providers;

use App\Observers\AnswerListObserver;
use App\Models\AnswerList;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);
        AnswerList::observe(AnswerListObserver::class);
    }
}

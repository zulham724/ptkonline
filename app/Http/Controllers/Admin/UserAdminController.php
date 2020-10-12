<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserAdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }
    public function userslist(Request $request){
        $itemsPerPage = $request->query('itemsPerPage')?$request->query('itemsPerPage'):10;

        $res = User::with('profile.educational_level','pretest_campaigns.campaign','posttest_campaigns.campaign','classroom_researches.classroom_research_contents','classroom_researches.educational_level')->withCount(['pretest_campaigns','posttest_campaigns','classroom_researches']);
        $data=$res->paginate($itemsPerPage);
        // $res=\App\User::with('')
        foreach($data->items() as $user){
            foreach($user['classroom_researches'] as $classroomResearch){
                $classroomResearch->plagiarism_score = round(collect($classroomResearch['classroom_research_contents'])->avg('plagiarism_score'), 2).'%';
            }
        }
        return ['totalUser'=>$res->count(), 'data'=>$data];
    }

}

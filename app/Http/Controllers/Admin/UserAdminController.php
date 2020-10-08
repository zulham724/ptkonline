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
        //return $itemsPerPage;
       // return $request;
        //$res=DB::table('users')->join('pns_statuses',);

        //filter gender
        $filter_options=$request;
      
        // $res = User::with('profile.educational_level')->whereHas('profile',function($query)use($filter_options){

        //     // //filter umur
        //     // $begin_date=\Carbon\Carbon::now()->subYears($filter_options->age_range[1])->format('Y-m-d');
        //     // $end_date=\Carbon\Carbon::now()->subYears($filter_options->age_range[0])->format('Y-m-d');

        //     // $query->whereBetween('birthdate',[$begin_date, $end_date]);

        //     // //filter gender
        //     // if($filter_options['gender']=='L' || $filter_options['gender']=='P'){$query->where('gender','=',$filter_options['gender']);
        //     // }

        //     //  //filter educational_level
        //     //  if($filter_options['educational_level']!='-')$query->where('educational_level_id','=',$filter_options['educational_level']);

        //     //  //filter school_status
        //     //  //if($filter_options['school_status']=='Negeri' || $filter_options['school_status']=='Swasta')$query->where('school_status','=',$filter_options['school_status']);

        //     //  //filter province
        //     //  /*if(!in_array(-1,$filter_options['province'])){
        //     //     $query->whereIn('province_id',$filter_options['province']);
        //     //  }*/
         
        // });
        $res = User::with('profile.educational_level');
        // $res=\App\User::with('')
        return ['totalUser'=>$res->count(), 'data'=>$res->paginate($itemsPerPage)];
    }

}

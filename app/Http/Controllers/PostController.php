<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //return 
        $itemsPerPage=10;
        $posts_count = Post::where('status','PUBLISHED')->count();
        $posts=Post::withCount('comments')->with('comments.user','user')->where('status','PUBLISHED')->orderBy('id','desc')->paginate($itemsPerPage);
        //return $posts;
        $user = auth()->user()->loadCount('pretest_campaigns','posttest_campaigns','classroom_researches');

        return \Inertia\Inertia::render('Post/Index',['page'=>$posts->currentPage(),'user'=>$user, 'items'=>$posts,'pagination_length'=>ceil($posts_count/$itemsPerPage)]);
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
        if($request->has('body') && $request->has('title')){
            $post = new Post;
            $post->author_id = auth()->user()->id;
            $post->body = trim($request->body);
            $post->title = trim($request->title);
            $post->slug =  Str::slug($request->title.time());
            $post->status = 'PUBLISHED';
            $post->save();
            return redirect()->route('posts.index');
        }
        
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $post_id)
    {
        //return $request->query('page');
        $post=Post::where('author_id','=',auth()->user()->id)->findOrFail($post_id);
        $post->comments()->delete();
        $post->delete();
        //return redirect()->route('posts.index');
        return redirect('/posts?page='.$request->query('page'));
    }
}

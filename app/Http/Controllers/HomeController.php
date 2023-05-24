<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\User;

class HomeController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }


    public function index()
    {
        return view('home');
    }

    public function list_user()
    {
        $usres = User::all();
        return view('users.List_Users')->with("dataUsers", $usres);
    }
    public function notautrized()
    {
        return view('401');
    }
}

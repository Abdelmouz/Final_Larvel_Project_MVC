<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class AdminsController extends Controller
{
    public function dashboard()
    {
        return view('AdminHomePage');
    }
    public function GotoLoginAdminPage()
    {
        return view('auth.Adminlogin');
    }
    public function CheckAdminLogin(Request $request)
    {
        $request->validate([
            'email' => 'required | email',
            "password" => 'required'
        ]);
        if (Auth::guard('admin')->attempt([
            'email' => $request->email,
            'password' => $request->password,
        ])) {
            return redirect()->route("admin.dashboard");
        } else {
            return redirect()->route("admin.loginPage");
        };
    }
}

<?php

namespace App\Http\Controllers;

use App\Models\Drive;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DriveController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $userId = auth()->user()->id;
        $drive = Drive::where("UserID", "=", $userId)->get();
        return view('drive.index')->with("data_file", $drive);
    }
    public function publicFile()
    {

        $drive = DB::table("userjoindrive")->get();
        return view('drive.publicFile')->with("data_file", $drive);
    }
    public function AllDrive()
    {
        $drive = DB::table("alldrives")->get();
        return view('drive.AllDrive')->with("data_file", $drive);
    }

    public function state($id)
    {
        $drive = Drive::Find($id);
        if ($drive->state == "privete") {
            $drive->state = "public";
            $drive->save();
            return redirect()->back()->with("done", "Make File public");
        } elseif ($drive->state = "public") {
            $drive->state = "privete";
            $drive->save();
            return redirect()->back()->with("done", "Make File privete");
        }
    }
    public function create()
    {
        return view('drive.create');
    }


    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required |min:3|max:200',
            'description' => 'required |min:4|max:500 |string',
            'yourfile' => 'required |min:1| max:100000'
        ]);

        $drive = new Drive();
        $drive->title = $request->title;
        $drive->description = $request->description;
        $drive->UserID = auth()->user()->id;
        $drive->state = "privete";
        // data file
        $data_file = $request->file("yourfile");
        $drive_name = time() . $data_file->getClientOriginalName();
        $location = public_path('./drives');
        $data_file->move($location, $drive_name);
        $drive->file = $drive_name;
        $drive->save();
        return redirect()->back()->with("done", "Post Done");
    }

    public function download($id)
    {
        $drive = Drive::Find($id);
        $drive_name = $drive->file;
        $fillpathname = public_path() . "/drives/" . $drive_name;
        return response()->download($fillpathname);
    }
    public function show(Drive $drive)
    {
        //
    }


    public function edit($id)
    {
        $drive = Drive::Find($id);
        return view('drive.edite')->with("data", $drive);
    }

    public function update(Request $request,  $id)
    {
        $request->validate([
            'title' => 'required|min:3|max:200',
            'description' => 'required|min:3|max:500',
            'yourfile' => '|min:1|max:10000'

        ]);
        $drive = Drive::Find($id);
        $drive->title = $request->title;
        $drive->description = $request->description;
        $data_file = $request->file("yourfile");
        if ($data_file != null) {
            // delete old file
            $old_file = $drive->file;
            $file_path = public_path() . '/drives/' . $old_file;
            unlink($file_path);
            ///////
            $file_name = time() . $data_file->getClientOriginalName();
            $location = public_path('./drives/');
            $data_file->move($location, $file_name);
        } else {
            $drive_name = $drive->file;
        }
        $drive->file = $drive_name;
        $drive->save();
        return redirect()->back()->with("done", "Edite Done");
    }

    public function destroy($id)
    {
        $drive = Drive::Find($id);
        // return $drive;
        $oldFile = $drive->file;
        $filPath = public_path() . "/drives/" . $oldFile;
        unlink($filPath);
        $drive->delete();
        return redirect()->back()->with("done", "Delete Done");
    }
}

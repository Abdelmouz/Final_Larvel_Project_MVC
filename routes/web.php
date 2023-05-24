<?php

use App\Http\Controllers\AdminsController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\DriveController;
use App\Http\Controllers\HomeController;
use PhpParser\Node\Name;

Route::get('/', function () {
    return view('auth.login');
});
Route::get('home', function () {
    return view('home');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::prefix("Admin")->group(function () {
    Route::get('adminDashboard', [AdminsController::class, "dashboard"])->name("admin.dashboard")->middleware('auth:admin');
    Route::get('AdminLogin', [AdminsController::class, "GotoLoginAdminPage"])->name('admin.loginPage');
    Route::post('CheckAdminLogin', [AdminsController::class, "CheckAdminLogin"])->name('admin.login');
});

Route::get('401', [HomeController::class, "notautrized"])->name("notautrized");




Route::prefix("Drive")->group(function () {

    Route::middleware(["AllAccess"])->group(function () {
        Route::get('ListUsers', [HomeController::class, "list_user"])->name("users.list");
        Route::get("All_Drive", [DriveController::class, "AllDrive"])->name("drive.all");
    });


    Route::get('List', [DriveController::class, 'index'])->name("drive.index");
    Route::get("Create", [DriveController::class, "create"])->name("drive.create");

    Route::post("Store", [DriveController::class, "store"])->name('drive.store');


    Route::get("Edite/{id}", [DriveController::class, "edit"])->name("drive.edit");
    Route::get("Delete/{id}", [DriveController::class, "destroy"])->name("drive.destroy");
    Route::get("Download/{id}", [DriveController::class, "download"])->name("drive.download");

    Route::post("update/{id}", [DriveController::class, "update"])->name("drive.update");

    Route::get("ChangeStateFile/{id}", [DriveController::class, "state"])->name("drive.state");
    Route::get("publicFile", [DriveController::class, "publicFile"])->name("drive.publicFile")->middleware("Access");
});

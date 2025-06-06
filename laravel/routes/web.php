<?php

use App\Models\User;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TestController;

Route::get('/', function () {
    Log::info('Welcome route accessed');
    User::create([
        'name' => 'Test User',
        'email' => 'test' .rand(1,10000).'@example.com',
        'password' => bcrypt('password'),
    ]);
    return User::all();
    return view('welcome');
});


Route::get('/test',[TestController::class,'index'])->name('test');




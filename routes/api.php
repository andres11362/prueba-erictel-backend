<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\V1\User\CreateUserController;
use App\Http\Controllers\Api\V1\User\GetUserController;
use App\Http\Controllers\Api\V1\User\UpdateUserController;

use App\Http\Controllers\Api\V1\Auth\AuthController;
use App\Http\Controllers\Api\V1\Crypto\CryptoCurrencyController;
use App\Http\Controllers\Api\V1\User\ImageUserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::group(['middleware' => 'api', 'prefix' => 'v1'], function ($router) {
    /**
     * Rutas de administracion de usuarios
     * 1. Crear un usuario.
     * 2. Inicio de sesion
     * 3. Mostrar un usuario.
     * 4. Actualizar un usuario.
     * 5. Cerrar sesion. 
     * 6. Subir imagen de usuario
     * 7. Obtener todas las monedas (id de 1 a 10)
     * 8. Obtener una moneda en especifico
     */
   
    Route::post('create-user', [CreateUserController::class, 'store'])->name('create-user');
    Route::post('login', [AuthController::class, 'login'])->name('login');
    Route::group(['middleware' => ['jwt.verify']], function() {
        Route::get('get-user', [GetUserController::class, 'show'])->name('get-user');
        Route::put('update-user', [UpdateUserController::class, 'update'])->name('update-user');
        Route::post('logout', [AuthController::class, 'logout'])->name('logout');
        Route::post('upload-image-user', [ImageUserController::class, 'storeImage'])->name('upload-image-user');
        Route::get('get-all-currencies', [CryptoCurrencyController::class, 'getAllCurrencies'])->name('get-all-currencies');
        Route::get('get-spec-currency', [CryptoCurrencyController::class, 'getSpecificCurrency'])->name('get-spec-currency');
    });
});

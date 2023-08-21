<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\UpdateUserRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class UpdateUserController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:api');
    }

    /**
     * Funcion que registra usuarios en el sistema
     * Retornamos informacion del usuario
     * @return response
     * 
     * @OA\Put(
     *     path="/api/v1/update-user",
     *     tags={"users"},
     *     summary="Actualiza un usuario",
     *     description="Retorna datos del usuario",
     *     @OA\RequestBody(
     *        @OA\MediaType(
     *          mediaType="application/json",
     *          @OA\Schema(
     *                 @OA\Property(
     *                     property="name",
     *                     type="string"
     *                 ),
     *                 @OA\Property(
     *                     property="email",
     *                     type="string"
     *                 ),    
     *                 @OA\Property(
     *                     property="description",
     *                     type="string"
     *                 ),    
     *                 @OA\Property(
     *                     property="password",
     *                     type="string"
     *                 ),  
     *                 @OA\Property(
     *                     property="password_confirmation",
     *                     type="string"
     *                 ),       
     *                 example={"email":"correo@correo.com","name":"Andrés Góngora","description":"Hola","password":"123456","password_confirmation":"123456"}        
     *          )
     *        )
     *     ),
     *    @OA\Response(
     *         response=200,
     *         description="Usuario actualizado exitosamente",  
     *         @OA\JsonContent(
     *            @OA\Examples(example="result", value={"user":{"id":31,"name":"Andrés Góngora","email":"correo@correo.com","description":"Hola","image":null,"email_verified_at":null,"created_at":"2023-08-19T17:21:41.000000Z","updated_at":"2023-08-19T17:21:41.000000Z"}}, summary="An result object."),
     *         )
     *     ),
     *     @OA\Response(
     *         response="default",
     *         description="Ha ocurrido un error.",  
     *         @OA\JsonContent(
     *              @OA\Examples(example="result", value={"message": "Error"}, summary="An result object."),
     *         )
     *     ),
     *     security={{ "apiAuth": {} }}
     * )
     */
    public function update(UpdateUserRequest $request)
    {
        try {
            $user = Auth::user();
            $validator = $request->validated();

            if ($request->has('errors')) {
                return response()->json(['errors' => $validator], 422);
            }

            DB::beginTransaction();

            $validated = $request->validated();

            $user->name = isset($validated['name']) ? $validated['name'] : $user->name;
            $user->email = isset($validated['email']) ? $validated['email'] : $user->email;
            $user->description = isset($validated['description']) ? $validated['description'] : $user->description;

            if (isset($validated['password'])) {
                $user->password = $validated['password'];
            }

            $user->save();

            DB::commit();

            return response()->json(['message' => 'Datos actualizados correctamente.'], 200);
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json(['message' => $e->getMessage()], 500);
        }
    }
}

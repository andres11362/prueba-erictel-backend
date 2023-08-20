<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Helpers\StorageFiles;
use App\Http\Controllers\Controller;
use App\Http\Requests\User\UserCreateRequest;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use JWTAuth;

class CreateUserController extends Controller
{

    /**
     * Funcion que registra usuarios en el sistema
     * Retornamos informacion del usuario
     * @return response
     * 
     * @OA\Post(
     *     path="/api/v1/create-user",
     *     tags={"users"},
     *     summary="Crea un usuario",
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
     *     @OA\Response(
     *         response=200,
     *         description="¡Usuario creado exitosamente!",  
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
     *     )
     * )
     */
    public function store(UserCreateRequest $request)
    {

        try {

            $validator = $request->validated();

            if ($request->has('errors')) {
                return response()->json(['errors' => $validator], 422);
            }
            DB::beginTransaction();
            $credentials = $request->only('email', 'password');
            $token = JWTAuth::attempt($credentials);

            $body = $this->getBodySecciones($validator);
            $user = User::create($body);
            DB::commit();

            return response()->json([
                'user' => $user,
                'token' => $token,
                'message' => '¡Usuario creado exitosamente!'
            ], 200);
        } catch (\Exception $e) {
            DB::rollback();
            return response(['message' => $e->getMessage()], 500);
        }
    }

    /**
     * Funcion para armar el cuerpo de la peticion de la noticia
     * al ser un archivo se le enviara la ruta y el nombre del mismo
     */
    private function getBodySecciones($data)
    {
        if (is_array($data)) {
            $body = [
                'name' => $data['name'],
                'email' => $data['email'],
                'password' => $data['password'],
                'description' => $data['description']
            ];
        }

        return $body;
    }
}

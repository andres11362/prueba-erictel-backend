<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\GetUserRequest;
use JWTAuth;

class GetUserController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:api');
    }
    /**
     * Funcion que obtiene los datos de un usuario por medio del token
     * @return response
     * 
     *  @OA\get(
     *      path="/api/v1/get-user",
     *      tags={"users"},
     *      summary="Muestra datos de un usuario",
     *      description="Retorna datos del usuario",
     *      @OA\RequestBody(
     *        @OA\MediaType(
     *          mediaType="application/json",
     *          @OA\Schema(
     *                 @OA\Property(
     *                     property="token",
     *                     type="string"
     *                 ),
     *                 example={"token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3YxL2xvZ2luIiwiaWF0IjoxNjkyNDExNDAwLCJleHAiOjE2OTI0MTUwMDAsIm5iZiI6MTY5MjQxMTQwMCwianRpIjoiUnppVmpaWWVyNUxVdjNrbiIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.cI-Vo3eoPD1-Xpy4kW1pWHiBZTlKRdeZn-AIFfRCFww"}        
     *          )
     *        )
     *      ),
     *     @OA\Response(
     *         response=200,
     *         description="Resultado correcto",  
     *         @OA\JsonContent(
     *            @OA\Examples(example="result", value={"user":{"id":31,"name":"Andrés Góngora","email":"correo@correo.com","description":"Hola","image":null,"email_verified_at":null,"created_at":"2023-08-19T17:21:41.000000Z","updated_at":"2023-08-19T17:21:41.000000Z"}}, summary="An result object."),
     *         )
     *      ),
     *      @OA\Response(
     *         response=401,
     *         description="Usuario invalido",  
     *         @OA\JsonContent(
     *            @OA\Examples(example="result", value={"message": "Token has expired"}, summary="An result object."),
     *         )
     *      ),
     *      @OA\Response(
     *         response=500,
     *         description="Error",  
     *         @OA\JsonContent(
     *            @OA\Examples(example="result", value={"message": "Error"}, summary="An result object."),
     *         )
     *      ),
     *      security={{ "apiAuth": {} }}
     *  )
     */
    public function show(GetUserRequest $request) 
    {
        try {
            $validator = $request->validated();

            if ($request->has('errors')) {
                return response()->json(['error' => $validator], 422);
            }
    
            $user = JWTAuth::authenticate($request->token);
            
            if(!$user)
                return response()->json([
                    'message' => 'Invalid token / token expired',
                ], 401);
            //Devolvemos los datos del usuario si todo va bien. 
            return response()->json(['user' => $user]);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()]);
        }
       
    }
}

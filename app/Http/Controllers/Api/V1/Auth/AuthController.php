<?php

namespace App\Http\Controllers\Api\V1\Auth;

use JWTAuth;
use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Auth\LogoutRequest;
use Illuminate\Support\Facades\Auth;

final class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'create-user']]);
    }

    /**
     * Funcion que realizar el login del usuario
     * Retornamos informacion del usuario
     * @return response
     * 
     * @OA\Post(
     *     path="/api/v1/login",
     *     tags={"auth"},
     *     summary="Valida las credenciales del usuario",
     *     description="Retorna datos del usuario",
     *     @OA\RequestBody(
     *        @OA\MediaType(
     *          mediaType="application/json",
     *          @OA\Schema(
     *                 @OA\Property(
     *                     property="email",
     *                     type="string"
     *                 ),    
     *                 @OA\Property(
     *                     property="password",
     *                     type="string"
     *                 ),    
     *                 example={"email":"correo@correo.com", "password":"123456"}        
     *          )
     *        )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="¡Usuario logeado exitosamente!",  
     *         @OA\JsonContent(
     *            @OA\Examples(example="result", value={"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3BydWViYS1lcmljdGVsLWJhY2tlbmQvcHVibGljL2FwaS92MS9sb2dpbiIsImlhdCI6MTY5MjQ3MzIxNSwiZXhwIjoxNjkyNDc2ODE1LCJuYmYiOjE2OTI0NzMyMTUsImp0aSI6IlBPc05QWm1mZFB6ZTU0OWQiLCJzdWIiOiIzMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.73yF7Z5vvqsDFsOl1wpsisW6pSHn6RRE1FO64WuQmE8","user":{"id":31,"name":"Andrés Góngora","email":"correo@correo.com","description":"Hola","image":null,"email_verified_at":null,"created_at":"2023-08-19T17:21:41.000000Z","updated_at":"2023-08-19T17:21:41.000000Z"}}, summary="An result object."),
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
    public function login(LoginRequest $request)
    {
        try {
            $validator = $request->validated();

            if ($request->has('errors')) {
                return response()->json(['error' => $validator->messages()], 422);
            }

            $credentials = $request->only('email', 'password');

            if (!$token = JWTAuth::attempt($credentials)) {
                //Credenciales incorrectas.
                return response()->json([
                    'message' => 'Login failed',
                ], 401);
            } else {
                return response()->json([
                    'token' => $token,
                    'user' => Auth::user()
                ]);
            }
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 500);
        }
    }

    /**
     * Funcion que realizar el logout del usuario
     * Retornamos la confirmacion de cierre de sesion
     * @return response
     * 
     * @OA\Post(
     *     path="/api/v1/logout",
     *     tags={"auth"},
     *     summary="Valida las credenciales del usuario",
     *     description="Retorna la confirmación de cierre",
     *     @OA\RequestBody(
     *        @OA\MediaType(
     *          mediaType="application/json",
     *          @OA\Schema(
     *                 @OA\Property(
     *                     property="email",
     *                     type="string"
     *                 ),    
     *                 example={"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3YxL2xvZ2luIiwiaWF0IjoxNjkyNDA5NDY5LCJleHAiOjE2OTI0MTMwNjksIm5iZiI6MTY5MjQwOTQ2OSwianRpIjoiYU9nZjROemdZYzRSUFdZMiIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.H3TBGRRubLGvIxhlc2nbNCEQayRuVx7YNumtXr93s4s"}      
     *          )
     *        )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Usuario desconectado exitosamente.",
     *         @OA\JsonContent(
     *            @OA\Examples(example="result", value={"success":true,"message":"Se ha desconectado la sesion."}, summary="An result object."),
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
    public function logout(LogoutRequest $request) 
    {        
        try {
            
            $validator = $request->validated();

            if ($request->has('errors')) {
                return response()->json(['error' => $validator], 422);
            }

            JWTAuth::invalidate($request->token);

            return response()->json([
                'success' => true,
                'message' => 'Se ha desconectado la sesion.'
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage()
            ], 500);
        }
    }
}

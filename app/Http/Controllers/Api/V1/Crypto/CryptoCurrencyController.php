<?php

namespace App\Http\Controllers\Api\V1\Crypto;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use CoinMarketCapApi;

class CryptoCurrencyController extends Controller
{
    
    /**
     * Funcion que registra usuarios en el sistema
     * Retornamos informacion del usuario
     * @return response
     * 
     * @OA\Get(
     *     path="/api/v1/get-all-currencies",
     *     tags={"cripto"},
     *     summary="Listar cripto monedas",
     *     description="Retorna dla lista de criptomonedas",
     *     @OA\Response(
     *         response=200,
     *         description="¡Usuario creado exitosamente!",  
     *         @OA\JsonContent(
     *            @OA\Examples(example="result", value={"status":{"timestamp":"2023-08-19T13:38:29.223Z","error_code":0,"error_message":null,"elapsed":2,"credit_count":1,"notice":null},"data":{}}, summary="An result object."),
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
    public function getAllCurrencies()
    {
        try {
            return CoinMarketCapApi::quotes([
                'id' => '1,2,3,4,5,6,7,8,9,10',
            ]);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 500);
        }
    }

    /**
     * Funcion que registra usuarios en el sistema
     * Retornamos informacion del usuario
     * @return response
     * 
     * @OA\Get(
     *     path="/api/v1/get-spec-currency",
     *     tags={"cripto"},
     *     summary="Mostrar una cripto moneda en especifico",
     *     description="Retorna dla lista de criptomonedas",
     *     @OA\RequestBody(
     *        @OA\MediaType(
     *          mediaType="application/json",
     *          @OA\Schema(
     *                 @OA\Property(
     *                     property="id",
     *                     type="integer"
     *                 ),
     *                 example={ "id": 1 }
     *          )
     *        )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Moneda encontrada",  
     *         @OA\JsonContent(
     *            @OA\Examples(example="result", value={"status":{"timestamp":"2023-08-19T13:38:29.223Z","error_code":0,"error_message":null,"elapsed":2,"credit_count":1,"notice":null},"data":{}}, summary="An result object."),
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
    public function getSpecificCurrency(Request $request) 
    {
        try {

            if(isset($request->id)) {
                $id = $request->id;

                return CoinMarketCapApi::quotes([
                    'id' => $id,
                ]);
            } else {
                return response()->json('', 204);
            }
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 500);
        }
    }
}

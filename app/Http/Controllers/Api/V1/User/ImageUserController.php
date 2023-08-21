<?php

namespace App\Http\Controllers\Api\V1\User;

use App\Helpers\StorageFiles;
use App\Http\Controllers\Controller;
use App\Http\Requests\User\UserImageRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Storage;

/**
 * Funcion que registra usuarios en el sistema
 * Retornamos informacion del usuario
 * @return response
 * 
 * @OA\Post(
 *     path="/api/v1/upload-image-user",
 *     tags={"users"},
 *     summary="Sube la imagen de  un usuario",
 *     description="Retorna la confirmacion de subida",
 *     @OA\RequestBody(
 *        @OA\MediaType(
 *          mediaType="multipart/form-data",
 *          @OA\Schema(
 *                 @OA\Property(
 *                     property="image",
 *                     type="string",
 *                     format="binary"
 *                 )
 *          )
 *        )
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Imagen subida correctamente",  
 *         @OA\JsonContent(
 *            @OA\Examples(example="result", value={"message": "Imagen de perfil actualizada"}, summary="An result object."),
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
class ImageUserController extends Controller
{
    public function storeImage(UserImageRequest $request)
    {
        try {
            $validator = $request->validated();

            if ($request->has('errors')) {
                return response()->json(['error' => $validator], 422);
            }

            if ($request->file('image') !== null) {
                $user = Auth::user();
                if (isset($user->image)) {
                    Storage::delete($user->image);
                }

                $image_name = time();
                $storage_files = new StorageFiles('users', $image_name, $request->file('image'));
                $path = $storage_files->createFile();

                $user->image = $path;

                $user->save();

                DB::commit();

                return response()->json(['message' => 'Imagen de perfil actualizada', 'route' => $user->image], 200);
            } else {
                return response()->json(['message' => 'No se subio nada'], 403);
            }
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json(['message' => $e->getMessage()], 500);
        }
    }
}

<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class UpdateUserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {

        $user = Auth::user();

        return [
            'name' => 'nullable|max:55',
            'email' => 'email|unique:users,email,'.$user->id,
            'description'   => 'nullable',
            'password' => 'confirmed'
        ];
    }
}

<?php

namespace Tests\Feature\app\User;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use Tymon\JWTAuth\Facades\JWTAuth;

class UpdateUserControllerTest extends TestCase
{
    public function testUserUpdatedSuccessfully()
    {
        $user = User::factory([
            'email' => 'sample@test.com',
            'password' => 'sample123',
            'description' => 'test',
            'name' => 'sample test'
        ])->create();

        $token = JWTAuth::fromUser($user);

        $this->actingAs($user, 'api');

        $payload = [
            "name" => "Demo User",
            "description' => 'test 2",
        ];

        $this->json('PUT', 'api/v1/update-user', $payload, ['authorization' => 'Bearer '.$token,  'Accept' => 'application/json'])
            ->assertStatus(200)
            ->assertJson([
                'message' => "Datos actualizados correctamente."
            ]);
    }
}

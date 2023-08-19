<?php

namespace Tests\Feature\app\Auth;

use App\Models\User;
// use Illuminate\Foundation\Testing\RefreshDatabase;
// use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use Tymon\JWTAuth\Facades\JWTAuth;

class LoginControllerTest extends TestCase
{
    public function testMustEnterEmailAndPassword()
    {
        $this->json('POST', 'api/v1/login')
            ->assertStatus(422)
            ->assertJson([
                "message" => "The email field is required. (and 1 more error)",
                "errors" => [
                    'email' => ["The email field is required."],
                    'password' => ["The password field is required."],
                ]
            ]);
    }

    public function testSuccessfulLogin()
    {

        User::factory()->make([
            'email' => 'sample@test.com',
            'password' => 'sample123',
            'description' => 'test',
            'name' => 'sample test'
        ]);

        $loginData = ['email' => 'sample@test.com', 'password' => 'sample123'];

        JWTAuth::attempt($loginData);

        $this->json('POST', 'api/v1/login', $loginData, ['Accept' => 'application/json'])
            ->assertStatus(200)
            ->assertJsonStructure([
                "user" => [
                    'id',
                    'name',
                    'email',
                    'email_verified_at',
                    'created_at',
                    'updated_at',
                ],
                "access_token",
                "message"
            ]);

        $this->assertAuthenticated();
    }
}

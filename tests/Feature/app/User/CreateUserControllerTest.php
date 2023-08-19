<?php

namespace Tests\Feature\app\User;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class CreateUserControllerTest extends TestCase
{

    public function testRequiredFieldsForRegistration()
    {
        $this->json('POST', 'api/v1/create-user', ['Accept' => 'application/json'])
            ->assertStatus(422)
            ->assertJson([
                "message" => "The email field is required. (and 2 more errors)",
                "errors" => [
                    "email" => ["The email field is required."],
                    "name" => ["The name field is required."],
                    "description" => ["The description field is required."],
                ]
            ]);
    }

    public function testRepeatPassword()
    {
        $userData = [
            "name" => "John Doe",
            "email" => "doe@example.com",
            "password" => "abc12345",
            "description" => "abcdefg"
        ];

        $this->json('POST', 'api/v1/create-user', $userData, ['Accept' => 'application/json'])
            ->assertStatus(422)
            ->assertJson([
                "message" => "The password confirmation does not match.",
                "errors" => [
                    "password" => ["The password confirmation does not match."],
                ]
            ]);
    }

    public function testCreateUser()
    {

        $user_data = [
            "email" => "correo@correo.com",
            "name" => "Andrés Góngora",
            "description" => "Hola",
            "password" => "123456",
            "password_confirmation" => "123456"
        ];

        $this->json('POST', 'api/v1/create-user', $user_data, ['Accept' => 'application/json'])
            ->assertStatus(200)
            ->assertJsonStructure([
                "user" => [
                    'id',
                    'name',
                    'email',
                    'description',
                    'created_at',
                    'updated_at',
                ],
                "message"
            ]);
    }
}

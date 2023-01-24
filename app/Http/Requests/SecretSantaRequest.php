<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class SecretSantaRequest extends FormRequest
{
    public function rules()
    {
        return [
            'id' => ['required', 'string', 'max:255'],
        ];
    }
}

<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\SecretSanta;
use App\Models\User;
use Illuminate\Http\Request;

class SecretSantaController extends Controller
{
    public function index(Request $request)
    {

        return "qweqwe";
    }

    public function show($id)
    {
        $secretSanta = SecretSanta::find($id);
        $podopechnyi = User::find($secretSanta->to_user_id);
        $uchastnik = User::find($secretSanta->from_user_id);
        $result = $secretSanta->toArray();
        $result["from_user_id"] = $uchastnik;
        $result["to_user_id"] = $podopechnyi;
        return $result;
    }

    public function __invoke()
    {
        // ...
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('secret_santas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('from_user_id');
            $table->foreignId('to_user_id');
            $table->timestamps();
        });
        DB::statement('ALTER TABLE secret_santas ADD CONSTRAINT self_check CHECK ( from_user_id != to_user_id )');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('secret_santas');
    }
};

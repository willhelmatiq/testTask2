<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\SecretSanta;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Sequence;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
//    private static mixed $from_id = -1;
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $n = 10;
        $sequenceValues = $this->getSequenceValues($n);
        User::factory($n)->create();
        SecretSanta::factory()->count($n)->state(new Sequence(
            fn ($sequence) => ['from_user_id' => $sequenceValues[$sequence->index][0],
                'to_user_id'=> $sequenceValues[$sequence->index][1]]
        ))->create();
    }

    private function getSequenceValues(int $n): array
    {
        $from_arr = array();
        $to_arr = array();
        for($i = 1; $i <= $n; $i++)
        {
            $j = rand(1, $n);

            while($i == $j || in_array($j, $to_arr) )
            {
                $j = rand(1, $n);
            }
            $from_arr[$i] = $i;
            $to_arr[$i] = $j;

        }
        return array_map(null, $from_arr, $to_arr);
    }
}

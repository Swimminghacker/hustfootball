<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class TeamYellowCardsList{

    public function insertTeamYellowCardsList(){

    }

    public static function getTeamYellowCardsList($championship_id){
    	if ($championship_id === FALSE){
        $result = DB::select('teamyellowcardslist',['*']);
        return $result;
    	}

	    $result =  DB::select('teamyellowcardslist',['*'],['championship_id'=>$championship_id],'and','ORDER BY yellowCards DESC');
	    return $result;
    }
}
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class TeamGoalList{

    public function insertTeamGoalList(){

    }

    public static function getTeamGoalList($championship_id){
    	if ($championship_id === FALSE){
        $result = DB::select('teamgoallist',['*']);
        return $result;
    	}

	    $result =  DB::select('teamgoallist',['*'],['championship_id'=>$championship_id]);
	    return $result;
    }
}
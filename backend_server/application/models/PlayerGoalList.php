<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class PlayerGoalList{

    public function insertPlayerGoalList(){

    }

    public function getPlayerGoalList($championship_id){
    	if ($championship_id === FALSE){
        $result = DB::select('playergoallist',['*']);;
        return $result;
    	}

	    $result =  DB::select('playergoallist',['*'],['championship_id'=>$championship_id]);
	    return $result;
    }
}
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class TeamRedCardsList{

    public function insertTeamRedCardsList(){

    }

    public static function getTeamRedCardsList($championship_id){
    	if ($championship_id === FALSE){
        $result = DB::select('teamredcardslist',['*']);
        return $result;
    	}

	    $result =  DB::select('teamredcardslist',['*'],['championship_id'=>$championship_id]);
	    return $result;
    }
}
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class PlayerRedCardList{

    public function insertPlayerRedCardList(){

    }

    public static function getPlayerRedCardList($championship_id){
    	if ($championship_id === FALSE){
        $result = DB::select('playerredcardlist',['*']);
        return $result;
    	}

	    $result =  DB::select('playerredcardlist',['*'],['championship_id'=>$championship_id],'and','ORDER BY redCards DESC');
	    return $result;
    }
}
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class PlayerYellowCardList{

    public function insertPlayerYellowCardList(){

    }

    public static function getPlayerYellowCardList($championship_id){
    	if ($championship_id === FALSE){
        $result = DB::select('playeryellowcardlist',['*']);
        return $result;
    	}

	    $result =  DB::select('playeryellowcardlist',['*'],['championship_id'=>$championship_id],'and','ORDER BY yellowCards DESC');
	    return $result;
    }
}
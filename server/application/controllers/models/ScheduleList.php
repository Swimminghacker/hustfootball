<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class ScheduleList{

    public function insertScheduleList(){

    }

    public static function getScheduleList($championship_id,$round){
    	if ($championship_id === FALSE){
        $result = DB::select('schedulelist',['*']);
        return $result;
    	}

	    $result =  DB::select('schedulelist',['*'],['championship_id'=>$championship_id,'round'=>$round]);
	    if($result === null){
          return 0;
      }
	    return $result;
    }
}
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class TeamRankList{

    public function insertChampionship($name,$year,$school,$is_ended = 1){

        if($name===null || $year===null || $school===null){
            return 'fail';
        }else{
            try{
                $res = DB::insert(
                'championship', 
                ['name' => $name,'year'=>$year,'school'=>$school,'is_ended'=>$is_ended]);
                return 'sucess';
            }catch(Exception $e){
                return 'fail';
            }
            
        }
    }

    public static function getTeamRankList(){
    
	    $result =  DB::select('teamranklist',['*']);
      if($result === null){
          return 0;
      }
	    return $result;
    }
}
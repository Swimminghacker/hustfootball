<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class PlayerGoalList{

     //插入数据
    public static function insertPlayerGoalList($name,$macth,$result,$goal,$belong,$championship_id){
            if($name===null || $macth===null || $goal===null || 
                $result===null || $belong===null || $championship_id===null){
                return 'fail';
            }else{
                try{
                    $res = DB::insert(
                    'group', 
                    ['name' => $name,'goal'=>$goal,'macth'=>$macth,'belong'=>$belong,
                    'result'=>$result,'championship_id'=>$championship_id]);
                    return 'sucess';
                }catch(Exception $e){
                    return 'fail';
                }
                
            }
        }

    public static function getPlayerGoalList($championship_id){
    	if ($championship_id === FALSE){
        $result = DB::select('playergoallist',['*']);
        return $result;
    	}

	    $result =  DB::select('playergoallist',['*'],['championship_id'=>$championship_id]);
	    return $result;
    }
}
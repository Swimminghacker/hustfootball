<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class FinalMatch{

    //插入数据
    public static function insertFinalMatchList($homeTeam,$guestTeam,$score,$time,$belong,$championship_id){
            if($homeTeam===null || $guestTeam===null || 
                $score===null || $belong===null || $championship_id===null){
                return 'fail';
            }else{
                try{
                    $res = DB::insert(
                    'final', 
                    ['homeTeam' => $homeTeam,'time'=>$time,'guestTeam'=>$guestTeam,'round'=>$belong,
                    'score'=>$score,'championship_id'=>$championship_id]);
                    return 'sucess';
                }catch(Exception $e){
                    return 'fail';
                }
                
            }
        }

    

    //查询
    public static function getFinalMatchList($championship_id,$round){
    	if ($round === FALSE){
        $result = DB::select('final',['*']);
        return $result;
    	}

	    $result =  DB::select('final',['*'],['belong'=>$round,'championship_id'=>$championship_id]);
	    return $result;
    }
}
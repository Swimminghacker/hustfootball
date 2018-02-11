<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class Group{

    //插入数据
    public static function insertGroupMatchList($name,$macth,$result,$goal,$belong,$championship_id){
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

    public static function getGroupMatchList($championship_id,$group){
    	if ($group === FALSE){
        $result = DB::select('group',['*']);
        return $result;
    	}

	    $result =  DB::select('group',['*'],['belong'=>$group,'championship_id'=>$championship_id]);
	    return $result;
    }
}
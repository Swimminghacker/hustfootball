<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class HonorList{

    public static function getHonorList(){
    
	    $result =  DB::select('honor',['*']);
        if($result === null){
            return 0;
        }
	    return $result;
    }
}
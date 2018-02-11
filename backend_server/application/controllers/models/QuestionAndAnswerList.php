<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class QuestionAndAnswerList{

    public static function getQuestionAndAnswerList(){
    
	    $result =  DB::select('questionandanswer',['*']);
        if($result === null){
            return 0;
        }
	    return $result;
    }
}
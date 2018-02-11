<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;
/**
**添加数据到数据库中；
**/
class Add extends CI_Controller {
  
  //首页
	public function index()
	{
    $this->load->view('add');
	}

  //添加数据页面
  public function addFinalMatch(){
    $this->load->view('addFinalMatch');
  }
  //数据添加到数据库中
  public function insertMatch(){

    function getPost($str){
      $val = !empty($_POST[$str]) ? $_POST[$str] : null;
      return $val; 
    }
    $homeTeam = getPost('homeTeam');
    $guestTeam = getPost('guestTeam');
    $score = getPost('score');
    $date = getPost('date');
    
    if(($homeTeam !=null) && ($guestTeam != null)){
      DB::insert('final', [
      'homeTeam' => $homeTeam,
      'guestTeam' => $guestTeam,
      'score' => $score,
      'time' => $date,
      'belong' => 'final'
      ]);
      echo("插入成功");

    }else{
      echo("插入失败");
    }
  }
}

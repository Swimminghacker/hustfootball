<?php
header("Access-Control-Allow-Origin: *"); // 允许任意域名发起的跨域请求  
defined('BASEPATH') OR exit('No direct script access allowed');
use \QCloud_WeApp_SDK\Mysql\Mysql as DB;
require_once('models/PlayerRedCardList.php');
require_once('models/Group.php');
require_once('models/PlayerGoalList.php');
require_once('models/FinalMatch.php');
require_once('models/PlayerYellowCardList.php');
require_once('models/ScheduleList.php');
require_once('models/TeamGoalList.php');
require_once('models/TeamRedCardsList.php');
require_once('models/TeamYellowCardsList.php');
require_once('models/Championship.php');
require_once('models/QuestionAndAnswerList.php');
require_once('models/TeamRankList.php');
require_once('models/HonorList.php');

class Info extends CI_Controller {

	public function index()
	{
    $arr = '';
    echo(__NAMESPACE__);
	}
  public function result(){

    $championship_code = $_GET['championship_code'];
    $championship_id = Championship::getChampionship_id($championship_code);
    
    
    $final = FinalMatch::getFinalMatchList($championship_id,'final');  //决赛
    $semiFinal = FinalMatch::getFinalMatchList($championship_id,'semiFinal'); //半决赛
    $quarterFinal = FinalMatch::getFinalMatchList($championship_id,'quarterFinal'); //四分之一决赛
    $eighthFinal = FinalMatch::getFinalMatchList($championship_id,'eighthFinal');//八分之一决赛
    $groupA = Group::getGroupMatchList($championship_id,'A');//小组赛 A组
    $groupB = Group::getGroupMatchList($championship_id,'B');//小组赛 B组
    $groupC = Group::getGroupMatchList($championship_id,'C');//小组赛 C组
    $groupD = Group::getGroupMatchList($championship_id,'D');//小组赛 D组
    $groupE = Group::getGroupMatchList($championship_id,'E');//小组赛 E组
    $groupF = Group::getGroupMatchList($championship_id,'F');//小组赛 F组
    //赛程列表
    $scoreList = array(
      'final'=>$final,
      'semiFinal'=>$semiFinal,
      'quarterFinal'=>$quarterFinal,
      'eighthFinal'=>$eighthFinal,
      'groupA'=>$groupA,
      'groupB'=>$groupB,
      'groupC'=>$groupC,
      'groupD'=>$groupD,
      'groupE'=>$groupE,
      'groupF'=>$groupF);
   
    $playerGoalList = PlayerGoalList::getPlayerGoalList($championship_id); //球员进球列表
    $playerYellowCardList = PlayerYellowCardList::getPlayerYellowCardList($championship_id); //球员黄牌
    $playerRedCardList = PlayerRedCardList::getPlayerRedCardList($championship_id); //球员红牌
    $teamGoalList = TeamGoalList::getTeamGoalList($championship_id); //球队进球
    $teamRedCardsList = TeamRedCardsList::getTeamRedCardsList($championship_id); //球队红牌
    $teamYellowCardsList = TeamYellowCardsList::getTeamYellowCardsList($championship_id); //球队黄牌
    $roundArray = [];
    if($championship_code==0||$championship_code==2){
      $roundArray = ['决    赛','半  决  赛','四分之一决赛','八分之一决赛','小组赛第五轮','小组赛第四轮','小组赛第三轮','小组赛第二轮','小组赛第一轮'];
    }else{
       $roundArray = ['决    赛','半  决  赛','四分之一决赛','八分之一决赛','小组赛第三轮','小组赛第二轮','小组赛第一轮'];
    }

    $result = array(
      'scoreList'=>$scoreList,
      'playerGoalList'=>$playerGoalList,
      'playerYellowCardList'=>$playerYellowCardList,
      'playerRedCardList'=>$playerRedCardList,
      'teamGoalList'=>$teamGoalList,
      'teamRedCardsList'=>$teamRedCardsList,
      'teamYellowCardsList'=>$teamYellowCardsList,
      'roundArray'=>$roundArray,
      );
    $this->json($result);
  }
  
  public function roundList(){
	  
  }

  public function scheduleList(){
    $championship_code = $_GET['championship_code'];
    $round = $_GET['round'];
    $championship_id = Championship::getChampionship_id($championship_code);
    $scheduleList = [];
    if($round=='final'||$round=='semiFinal'||$round=='quarterFinal'||$round=='eighthFinal'){
      $scheduleList = FinalMatch::getFinalMatchList($championship_id,$round);//淘汰赛赛程
    }else{
       $scheduleList = ScheduleList::getScheduleList($championship_id,$round); //小组赛赛程表
    }
    $result = array(
      'scheduleList'=>$scheduleList,
    );
    $this->json($result);
  }


  public function moreInfo(){
    $rankList = TeamRankList::getTeamRankList();
    $honorList = HonorList::getHonorList();
    $questionandanswerList = QuestionAndAnswerList::getQuestionAndAnswerList();
    $result = array(
        'rankList'=>$rankList,
        'honorList'=>$honorList,
        'questionandanswerList'=>$questionandanswerList,
    );
    $this->json($result);
  }
}



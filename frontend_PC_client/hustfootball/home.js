var schedule = document.getElementById('schedule');
var team = document.getElementById('team');
var player = document.getElementById('player');
var score = document.getElementById('score');
var baseUrl = 'https://aqjkpt7u.qcloud.la/info/result?championship_code=';

getStatistic(1);

function getStatistic(id){
	var url = baseUrl+id;
	var request = new XMLHttpRequest();
	request.open('GET',url);
	request.send();
	var response;
	request.onreadystatechange=function(){
		if (request.readyState==4 && request.status==200)
		{
			response = JSON.parse(request.responseText);
			console.log(response.scoreList);
		}
	}

	return response;
}
new Vue({
	el:'#nav',
	data:{
		navList:[
			{name:'华工杯甲组',id:1,},
			{name:'华工杯乙组',id:2,},
			{name:'女足华工杯',id:3,},
			{name:'新生杯',id:4,},
			{name:'研赛杯',id:5,},
			{name:'毕业杯',id:6,},
		],
		nowId : 1,
		item:'nav-item',
		active:'nav-item-active',
	},
	methods:{
		getData:function(id){
			console.log(id);
			this.nowId = id;
			getStatistic(id);
		}
	}
})

new Vue({
	el:'#match',
	data:{
		roundList:[
			{title:'决赛',
			 matches:[{result:'电信vs土木',time:'2015-5-6',place:'中心操场'},
					  {result:'电信vs环境',time:'2015-4-6',place:'韵苑操场'}]
			},
			{title:'半决赛',
			 matches:[{result:'自动化vs土木',time:'2015-5-6',place:'中心操场'},
					  {result:'电信vs环境',time:'2015-4-6',place:'韵苑操场'}]
			},
			{title:'1/4决赛',
			 matches:[{result:'电信vs土木',time:'2015-5-6',place:'中心操场'},
					  {result:'电信vs环境',time:'2015-4-6',place:'韵苑操场'}]
			},
			{title:'1/8决赛',
			 matches:[{result:'自动化vs土木',time:'2015-5-6',place:'中心操场'},
					  {result:'电信vs环境',time:'2015-4-6',place:'韵苑操场'}]
			},
			
		],
		groupList:[
		
			{title:'A组',
			 matches:[
					 	{round:'第一轮',
					 	 list:[{result:'电信vs土木',time:'2015-5-6',place:'中心操场'},
							  {result:'电信vs环境',time:'2015-4-6',place:'韵苑操场'}]
						},
						{round:'第二轮',
					 	 list:[{result:'电信vs土木',time:'2015-5-6',place:'中心操场'},
							  {result:'电信vs环境',time:'2015-4-6',place:'韵苑操场'}]
						},
						{round:'第三轮',
					 	 list:[{result:'电信vs土木',time:'2015-5-6',place:'中心操场'},
							  {result:'电信vs环境',time:'2015-4-6',place:'韵苑操场'}]
						}
			 		]
			},
			{title:'B组',
			 matches:[
					 	{round:'第一轮',
					 	 list:[{result:'电信vs土木',time:'2015-5-6',place:'中心操场'},
							  {result:'电信vs环境',time:'2015-4-6',place:'韵苑操场'}]
						},
						{round:'第二轮',
					 	 list:[{result:'电信vs土木',time:'2015-5-6',place:'中心操场'},
							  {result:'电信vs环境',time:'2015-4-6',place:'韵苑操场'}]
						},
						{round:'第三轮',
					 	 list:[{result:'电信vs土木',time:'2015-5-6',place:'中心操场'},
							  {result:'电信vs环境',time:'2015-4-6',place:'韵苑操场'}]
						}
			 		]
			}
		],
	}
})

new Vue({
	el:'#matchNav',
	data:{
		matchNavList:[
			{name:'赛程',index:1},
			{name:'榜单',index:2},
			{name:'球队',index:3},
			{name:'球员',index:4},
		],
		nowIndex :1,
		raw:'match-nav-item',
		active:'match-nav-item-active',
	},
	methods:{
		shiftMenu:function(item){
			console.log(item.index);
			this.nowIndex = item.index;
			if (item.index==1) {
				displaySchedule();
			}else if (item.index==2) {
				displayScore();
			}else if(item.index==3){
				displayTeam();
			}else{
				displayPlayer();
			}
		}
	}
})


function displaySchedule(){

	schedule.style.display="block";
	team.style.display="none";
	player.style.display="none";
	score.style.display="none";
}
function displayScore(){

	schedule.style.display="none";
	team.style.display="none";
	player.style.display="none";
	score.style.display="block";
}
function displayTeam(){

	schedule.style.display="none";
	team.style.display="block";
	player.style.display="none";
	score.style.display="none";
}
function displayPlayer(){

	schedule.style.display="none";
	team.style.display="none";
	player.style.display="block";
	score.style.display="none";
}
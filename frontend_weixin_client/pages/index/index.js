var app = getApp();
Page({
  data: {  
    navbar: ['积分榜', '球员榜', '球队榜','赛程'],
    currentTab2:0,
    winHeight: "",//窗口高度
    currentTab: 0, //预设当前项的值
    scrollLeft: 0, //tab标题的滚动条位置
    hasFinal : 1,
    hasSemifinal:1,
    hasQuarterFinal:1,
    hasEighthFinal:1,

    scoreList:{
      final:[],
      semiFinal: [],
      quarterFinal: [],
      eighthFinal: [],
      groupA: [],
      groupB: [],
      groupC:[],
      groupD:[],
      groupE:[],
      groupF:[]},

    playerGoalList:[],
    playerYellowCardList: [],
    playerRedCardList: [],
    teamGoalList:[],
    teamRedCardsList: [],
    teamYellowCardsList:[],
    scheduleList:[],
    response:'',
    roundArray:['决    赛','半  决  赛','四分之一决赛','八分之一决赛','小组赛第三轮','小组赛第二轮','小组赛第一轮'],
    index:0,
    round : 'final',
  },
  //点击
  navbarTap: function (e) {
    this.setData({
      currentTab2: e.currentTarget.dataset.idx
    });
    if(this.data.currentTab2==3){
      var that = this;
      wx.request({
        header: { 'Content-Type': 'application/json' },
        url: 'https://967183679.hust12yards.cn/info/scheduleList',
        data: { 'championship_code': that.data.currentTab, 'round': that.data.round },
        method: "GET",
        success: function (res) {
          console.log(res);
          that.setData({
            scheduleList: res.data.scheduleList
          });
        },
        fail: function (res) {
        }
      });
    }
  },
  // 滚动切换标签样式
  switchTab: function (e) {
    this.setData({
      currentTab: e.detail.current
    });
    this.checkCor();
  },
  // 点击标题切换当前页时改变样式
  swichNav: function (e) {
    var cur = e.target.dataset.current;
    if (this.data.currentTaB == cur) { return false; }
    else {
      this.setData({
        currentTab: cur,
      });
      var that = this;
      wx.request({
        header:{'Content-Type':'application/json'},
        url: 'https://967183679.hust12yards.cn/info/result',
        data:{'championship_code':cur},
        method:"GET",
        success:function(res){
          console.log(res);
          that.setData({
            scoreList:res.data.scoreList,
            playerGoalList:res.data.playerGoalList,
            playerYellowCardList: res.data.playerYellowCardList,
            playerRedCardList: res.data.playerRedCardList,
            teamGoalList: res.data.teamGoalList,
            teamRedCardsList: res.data.teamRedCardsList,
            teamYellowCardsList: res.data.teamYellowCardsList,
            roundArray:res.data.roundArray,
          });
        },
        fail:function(res){
        }
      });
      wx.request({
        header: { 'Content-Type': 'application/json' },
        url: 'https://967183679.hust12yards.cn/info/scheduleList',
        data: { 'championship_code': that.data.currentTab, 'round': that.data.round },
        method: "GET",
        success: function (res) {
          console.log(res);
          that.setData({
            scheduleList: res.data.scheduleList
          });
        },
        fail: function (res) {
        }
      });
    }
  },
  //判断当前滚动超过一屏时，设置tab标题滚动条。
  checkCor: function () {
    if (this.data.currentTab > 4) {
      this.setData({
        scrollLeft: 300
      })
    } else {
      this.setData({
        scrollLeft: 0
      })
    }
  },
  bindPickerChange:function(e){
    var that = this;
    this.setData({
      index:e.detail.value
    });
    var index = e.detail.value;
    var round = 'first';
    if(this.data.roundArray[index]=='小组赛第一轮'){
      round = 'first';
    } else if (this.data.roundArray[index] == '小组赛第二轮'){
      round = 'second';
    } else if (this.data.roundArray[index] == '小组赛第三轮') {
      round = 'third';
    } else if (this.data.roundArray[index] == '小组赛第四轮') {
      round = 'fourth';
    } else if (this.data.roundArray[index] == '小组赛第五轮') {
      round = 'fifth';
    } else if (this.data.roundArray[index] == '小组赛第六轮') {
      round = 'sixth';
    } else if (this.data.roundArray[index] == '八分之一决赛') {
      round = 'eighthFinal';
    } else if (this.data.roundArray[index] == '四分之一决赛') {
      round = 'quarterFinal';
    } else if (this.data.roundArray[index] == '半  决  赛') {
      round = 'semiFinal';
    } else if (this.data.roundArray[index] == '决    赛') {
      round = 'final';
    }
    this.setData({
      round: round
    });
    wx.request({
      header: { 'Content-Type': 'application/json' },
      url: 'https://967183679.hust12yards.cn/info/scheduleList',
      data: { 'championship_code': that.data.currentTab,'round':round},
      method: "GET",
      success: function (res) {
        console.log(res);
        that.setData({
          scheduleList: res.data.scheduleList
        });
      },
      fail: function (res) {
      }
    });
  },
  onLoad: function () {
    var cur = 0;
    wx.request({
      header: { 'Content-Type': 'application/json' },
      url: 'https://967183679.hust12yards.cn/info/result',
      data: { 'championship_code': cur },
      method: "GET",
      success: function (res) {
        console.log(res);
        that.setData({
          scoreList: res.data.scoreList,
          playerGoalList: res.data.playerGoalList,
          playerYellowCardList: res.data.playerYellowCardList,
          playerRedCardList: res.data.playerRedCardList,
          teamGoalList: res.data.teamGoalList,
          teamRedCardsList: res.data.teamRedCardsList,
          teamYellowCardsList: res.data.teamYellowCardsList,
          roundArray:res.data.roundArray,
        });
      },
      fail: function (res) {
      }
    });
    var that = this;
    //  高度自适应
    wx.getSystemInfo({
      success: function (res) {
        var clientHeight = res.windowHeight,
          clientWidth = res.windowWidth,
          rpxR = 750 / clientWidth;
        var calc = clientHeight * rpxR - 180;
        console.log(calc)
        that.setData({
          winHeight: calc
        });
      }
    });
  },

})

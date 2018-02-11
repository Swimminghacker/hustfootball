var app = getApp()
Page({
  data: {
    rankList:[],
    rewardList:[],
    qaList:[],
    is_displayRankList:-1,
    is_displayRewardList:-1,
    is_displayQaList:-1,
  },
  displayRankList: function (e) {
    if(this.data.is_displayRankList == 1){
      this.setData({
        is_displayRankList: -1,
      })
    }else{
      this.setData({
        is_displayRankList: 1,
      })
    }  
  },
  displayRewardList:function(e){
    if (this.data.is_displayRewardList == 1) {
      this.setData({
        is_displayRewardList: -1,
      })
    } else {
      this.setData({
        is_displayRewardList: 1,
      })
    } 
  },
  displayQaList: function (e) {
    if (this.data.is_displayQaList == 1) {
      this.setData({
        is_displayQaList: -1,
      })
    } else {
      this.setData({
        is_displayQaList: 1,
      })
    }
  },
  onLoad: function () {
    wx.request({
      header: { 'Content-Type': 'application/json' },
      url: 'https://967183679.hust12yards.cn/info/moreInfo',
      data: {},
      method: "GET",
      success: function (res) {
        console.log(res);
        that.setData({
          rankList: res.data.rankList,
          rewardList: res.data.honorList,
          qaList: res.data.questionandanswerList,
          
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
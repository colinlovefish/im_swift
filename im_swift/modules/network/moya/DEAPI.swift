//
//  DEAPI.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/17.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import Foundation
import Moya

// web url link

let URL_HELP = "https://help.coinandcoin.io/en/"
//let URL_HELP = "http://10.1.0.147:8080/index.html"

enum API {
//    登录相关
    case loginRegion(parameters:[String:Any])
    case captcha(parameters:[String:Any])
    case login(parameters:[String:Any])
    case register(parameters:[String:Any])
    case passwordReset(parameters:[String:Any])
//    个人信息
    case accountinfo
    case balanceinfo(parameters:[String:Any])
//    获取交易顾问
    case advisorinfo(parameters:[String:Any])
//    获取邮件验证码
    case emailVerify(parameters:[String:Any])
//    获取手机验证码
    case phoneCodeVerify(parameters:[String:Any])
//    消息中心
    case messageCenter(parameters:[String:Any])
//    退出登录
    case logoutRequest
//    BTC配置
    case miniConfigure
//   BTC configure
    case tradeConfigure(parameters:[String:Any])
//   contract opentime
    case openTime(parameters:[String:Any])
//    OTC合约配置
    case otcConfigureReuqest(parameters:[String:Any])
//    首页Top3
    case rankTop(parameters:[String:Any])
//    首页 banner
    case banner
//    首页 notices
    case notices(parameters:[String:Any])
//    symbols 币兑列表
    case symbols(parameters:[String:Any])
//    下mini合约订单
    case miniOrder(parameters:[String:Any])
//    提交永续合约
    case otcOrder (parameters:[String:Any])
//    otc/orders/history?symbol=btc_usdt&page=1&per_page=60&status=2
//    历史订单 OTC
    case orderHistory(parameters:[String:Any])
//    mini合约历史订单
    case miniOrderHistory(parameters:[String:Any])
//    获取订单详情信息 -mini
    case orderDetailInfo(id:String)
//    获取永续合约订单详情 -OTC
    case otcOrderDetailInfo(id:String)
//    设置止盈止损  废弃
//    case otcLimit(id:Int,parametes:[String:Any])
//    设置 止损
    case otcStopPriceLoss(id:String ,price:String)
//    设置 止盈
    case otcStopPriceProfit(id:String ,price:String)
//    手动平仓
    case otcComplete(id:String)
//   post 设置隔夜
    case otcOverNight(id:String)
//  delete  取消隔夜
    case cancelOverNight(id:String)
//    获取KYC信息
    case profileKYC
//    kyc上传图片
    case uploadInfopage(data: Data)
//    申请认证
    case kyc1(parameters:[String:Any])
    case kyc2
    case kyc3(parameters:[String:Any])
//    手持证照
    case uploadHandheld(data: Data)
//    上传居住证明
    case uploadLivingProof(data: Data)
    
/*******出入金*******/
    //存款信息
    case depositRequest
    //数字货币地址信息
    case addressRequest
    //货币兑换信息
    case currenciesRequest
    //下单
    case coinExchangeAccept(id : String, parameters: Dictionary<String, Any>)
    // 用户订单列表
    case coinExchangeOrders(parameters: Dictionary<String, Any>)
    // 充值商家列表
    case coinExchangeBusinessDeposit
    // 提现商家列表
    case coinExchangeBusinessWithdraw
    //用户订单详情
    case coinExchangeOrdersAccord(id : String)
    //用户标记订单已付款
    case coinExchangeOrdersPay(id : String)
    //用户标记订单已完成
    case coinExchangeOrdersDone(id : String)
    // 用户标记订单锁单
    case coinExchangeOrersLock(id : String)
    //绑定account账户
    case accountBind(channel: String, parameters:[String:Any])
    //取消提现订单
    case cancelWithdrawOrder(id : String)
    //钱包log
    case walletLogRequest(parameters: Dictionary<String, Any>)
    //个人主页
    case profileInfo(id: String, parameters: Dictionary<String, Any>)
    //交易顾问详情
    case advisorProfileInfo(id: String)
    //点赞 代理人
    case advisorStarRequest(id: String)
    //推荐文章列表
    case recommendArticleList(parameters: Dictionary<String, Any>)
    //关注者文章列表
    case followingArticleList(parameters: Dictionary<String, Any>)
    //文章阅读量
    case articleCount(id: String)
    //关注代理人
    case followingAdvisorRequest(id: String)
    //取关代理人
    case unfollowingAdvisorRequest(id: String)
    //v2 获取用户账号信息
    case getAccountPayments
    //v2 提交用户账号信息
    case postAccountPayments(parameters: Dictionary<String, Any>)
    // v2 /account/payments/{id}/{column} 用户提交图片
    case postAccountPaymentsColumn(id: String, column: String, data: Data)
    //语言资源
    case languageResource
    //功能列表配置
    case configureFeatures
    //修改用户名
    case changeAccountInfo(parameters: Dictionary<String, Any>)
    //头像上传
    case accountAvatar(data: Data)
    //评论详情
    case profileArticleInfo(id: String,parameters: Dictionary<String, Any>)
    //评论跟评
    case commentReply(id: String, parameters: Dictionary<String, Any>)
    //提交评论
    case postCommentInfo(id: String, parameters: Dictionary<String, Any>)
    //提交跟评
    case postReplyInfo(id: String, parameters: Dictionary<String, Any>)
    //点赞  图文
    case articleStarRequest(id: String)
    //取消点赞 -图文
    case cancelArticleStarRequest(id: String)
    //文章评论点赞
    case articleCommentLikeRequest(id: String)
    //取消文章评论点赞
    case cancleArticleCommentLikeRequest(id: String)
    //获取文章评论详情
    case getCommentDetailInfoRequest(id: String)
    //获取文章跟评详情
    case getCommentReplyDetailInfoRequest(id: String)
    //删除文章评论
    case deleteCommentReplyRequest(id: String)
    //新手指导
    case userGuideDefine
    //新手引导其中一步结束
    case guideStepFinish(id: String)
    //现货交易
    case spotSymbols
    //现货转换
    case convertSymbols(parameters : Dictionary<String,Any>)
    //获取现货交易订单
    case convertOrders(parameters: Dictionary<String, Any>)
    //新版 接口类型：V2  -接口描述： 充值提现列表 商家类型: * deposit - 充值 * withdraw - 提现
    case coinExchangeBusiness(type : String)
    //获取交易排名
    case tradeStatistics
    //获取pending数据
    case tradeStatisticsPending
    //获取K线数据 mini
    case periodOfKLineData(parameters : Dictionary<String, Any>)
    //获取K线数据 OTC
    case periodOfOTCKLineData(parameters: Dictionary<String, Any>)
    //获取当前K线上的订单 mini
    case tradeMiniNotes(parameters: Dictionary<String, Any>)
    //获取当前K线上的订单 otc
    case tradeOtcNotes(parameters: Dictionary<String, Any>)
    //打开多钱包
    case openWalletMulti
    //关闭多钱包
    case closeMultipleWallet
    //defi项目列表
    case defiList(parameters: Dictionary<String, Any>)
    //defi问答区域
    case defiContent
    //defi募集详情
    case defiDetail(id: String)
    //defi收益明细
    case defiEarnings(id: String, parameters: Dictionary<String, Any>)
    //defi  提交订单
    case postDefiEarning(id: String, parameters: Dictionary<String, Any>)
    
}






//
//  DENetworkMethod.swift
//  coinandcoin
//
//  Created by yinghu on 2020/10/19.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import Foundation
import Moya

extension API:TargetType {
    var baseURL: URL {
        switch self {
        case .getAccountPayments,
             .postAccountPayments(_),
             .configureFeatures,
             .coinExchangeBusiness(_),
             .coinExchangeBusinessWithdraw,
             .coinExchangeOrders,
             .coinExchangeOrdersAccord(_),
             .coinExchangeAccept(_, _),
             .coinExchangeOrdersPay(_),
             .coinExchangeOrdersDone(_),
             .coinExchangeOrersLock(_),
             .cancelWithdrawOrder(_),
             .depositRequest,
             .postAccountPaymentsColumn(_, _, _):
            return URL.init(string: BASE_URL_V2)!
        default:
            return URL.init(string: BASE_URL)!
        }
    }
    var demoURL: URL {
        switch self {
        case .openTime:
            return URL.init(string: DEMO_URL)!
        default:
            return URL.init(string: DEMO_URL)!
        }
    }
    
    var debugURL: URL {
        switch self {
        case .getAccountPayments,
             .postAccountPayments(_),
             .configureFeatures,
             .coinExchangeBusiness(_),
             .coinExchangeBusinessWithdraw,
             .coinExchangeOrders,
             .coinExchangeAccept(_, _),
             .coinExchangeOrdersAccord(_),
             .coinExchangeOrdersDone(_),
             .coinExchangeOrersLock(_),
             .cancelWithdrawOrder(_),
             .depositRequest,
             .postAccountPaymentsColumn(_, _, _):
            return URL.init(string: PEODUCTION_BASE_URL_V2)!
        default:
            return URL.init(string: PEODUCTION_BASE_URL)!
        }

    }
    
    var debugDemoURL: URL {
        switch self {
        default:
            return URL.init(string: PEODUCTION_DEMO_URL)!
        }
    }
    
    
    var path: String {
        switch self {
        case .loginRegion:
            return "region"
        case .captcha:
            return "captcha"
        case .login:
            return "login"
        case .register:
            return "register"
        case .passwordReset:
            return "password/reset"
        case .accountinfo:
            return "account/info"
        case .changeAccountInfo:
            return "account/info"
        case .balanceinfo:
            return "account/balance"
        case .advisorinfo:
            return "advisor/exclusive/info"
        case .emailVerify:
            return "email/captcha/register"
        case .phoneCodeVerify:
            return "rnd/register"
        case .messageCenter:
            return "messages/notifications"
        case .logoutRequest:
            return "login"
        case .miniConfigure:
            return "market/btc_usdt@mini/config"
        case .tradeConfigure:
            return "trade/config"
        case .openTime:
            return "trade/openTime/tz/utc"
        case .otcConfigureReuqest:
            return "otc/config"
        case .rankTop:
            return "activity/deal/rank/top3"
        case .banner:
            return "index/banners"
        case .notices:
            return "index/notices"
        case .symbols:
            return "index/symbols"
        case .miniOrder:
            return "order"
        case .otcOrder:
            return "otc/orders"
        case .orderHistory:
            return "otc/orders/history"
        case .miniOrderHistory:
            return "order/history"
        case .orderDetailInfo(let id):
            return "order/\(id)"
        case .otcOrderDetailInfo(let id):
            return "otc/orders/\(id)"
        case .otcComplete(let id):
            return "otc/orders/\(id)/complete"
        case .otcOverNight(let id):
            return "otc/orders/\(id)/overnight"
        case .cancelOverNight(let id):
            return "otc/orders/\(id)/overnight"
        case .otcStopPriceLoss(let id, _):
            return "otc/orders/\(id)/stopPrice/loss"
        case .otcStopPriceProfit(let id, _):
            return "otc/orders/\(id)/stopPrice/profit"
        case .profileKYC:
            return "account/kyc"
        case .uploadInfopage:
            return "account/kyc/upload/info_page"
        case .uploadHandheld:
            return "account/kyc/upload/handheld"
        case .kyc1:
            return "account/kyc/1"
        case .kyc2:
            return "account/kyc/2"
        case .kyc3:
            return "account/kyc/3"
        case .uploadLivingProof:
            return "account/kyc/upload/living_proof"
        case .depositRequest:
            return "coin/exchange/business/deposit"
        case .addressRequest:
            return "account/recharge/address"
        case .currenciesRequest:
            return "coin/exchange/currencies"
            //下单
        case .coinExchangeAccept(let id, _):
            return "coin/exchange/business/\(id)/accept"
        case .coinExchangeOrders:
            return "coin/exchange/orders"
        case .coinExchangeBusinessDeposit:
            return "coin/exchange/business/deposit"
        case .coinExchangeBusinessWithdraw:
            return "coin/exchange/business/withdraw"
        case .coinExchangeOrdersAccord(let id):
            return "coin/exchange/orders/\(id)"
        case .coinExchangeOrdersPay(let id):
            return "coin/exchange/orders/\(id)/pay"
        case .coinExchangeOrdersDone(let id):
            return "coin/exchange/orders/\(id)/done"
        case .coinExchangeOrersLock(let id):
            return "coin/exchange/orders/\(id)/lock"
        case .accountBind(let channel, _):
            return "account/bind/\(channel)"
        case .cancelWithdrawOrder(let id):
            return "coin/exchange/orders/\(id)/cancel"
        case .walletLogRequest:
            return "account/wallet/log"
        case .profileInfo(let id,_):
            return "profile/info/\(id)/articles"
        case .advisorProfileInfo(let id):
            return "profile/info/\(id)"
        case .advisorStarRequest(let id):
            return "profile/info/\(id)/star"
        case .articleStarRequest(let id):
            return "profile/articles/\(id)/star"
        case .cancelArticleStarRequest(let id):
            return "profile/articles/\(id)/star"
        case .articleCommentLikeRequest(let id):
            return "profile/articles/comments/\(id)/star"
        case .cancleArticleCommentLikeRequest(let id):
            return "profile/articles/comments/\(id)/star"
        case .recommendArticleList:
            return "profile/articles/recommend"
        case .followingArticleList:
            return "profile/articles/following"
        case .articleCount(let id):
            return "profile/articles/\(id)/count"
        case .followingAdvisorRequest(let id):
            return "profile/info/\(id)/follow"
        case .unfollowingAdvisorRequest(let id):
            return "profile/info/\(id)/follow"
        case .getAccountPayments:
            return "account/payments"
        case .postAccountPayments:
            return "account/payments"
        case .postAccountPaymentsColumn(let id, let column, _):
            return "account/payments/image/\(id)/\(column)"
        case .languageResource:
            return "language"
        case .configureFeatures:
            return "config/features"
        case .accountAvatar:
            return "account/avatar"
        case .profileArticleInfo(let id, _):
            return "profile/articles/\(id)/comments"
        case .commentReply(let id, _):
            return "profile/articles/comments/\(id)/replies"
        case .postCommentInfo(let id, _):
            return "profile/articles/\(id)/comments"
        case .postReplyInfo(let id, _):
            return "profile/articles/comments/\(id)/replies"
        case .getCommentDetailInfoRequest(let id):
            return "profile/articles/\(id)"
        case .getCommentReplyDetailInfoRequest(let id):
            return "profile/articles/comments/\(id)"
        case .deleteCommentReplyRequest(let id):
            return "profile/articles/comments/\(id)"
        case .userGuideDefine:
            return "user/guide/defines"
        case .guideStepFinish(let id):
            return "user/guides/\(id)/finish"
        case .spotSymbols:
            return "spot/symbols"
        case .convertSymbols:
            return "spot/orders"
        case .convertOrders:
            return "spot/orders"
        case .coinExchangeBusiness(let type):
            return "coin/exchange/business/\(type)"
        case .tradeStatistics:
            return "trade/statistics/rank/today/btc_usdt/time"
        case .tradeStatisticsPending:
            return "trade/statistics/pending/btc_usdt/time"
        case .periodOfKLineData:
            return "kline"
        case .periodOfOTCKLineData:
            return "otc/kline"
        case .tradeMiniNotes:
            return "trade/mini/notes"
        case .tradeOtcNotes:
            return "trade/otc/notes"
        case .openWalletMulti:
            return "account/wallet/multi/open"
        case .closeMultipleWallet:
            return "account/wallet/multi/close"
        case .defiContent:
            return "defi/page"
        case .defiList:
            return "defi/projects"
        case .defiDetail(let id):
            return "defi/projects/\(id)"
        case .defiEarnings(let id, _):
            return "defi/projects/\(id)/earnings"
        case .postDefiEarning(let id, _):
            return "defi/projects/\(id)"
        }
        
    }

    
    var method: Moya.Method {
        switch self {
        case .captcha,
             .accountinfo,
             .balanceinfo,
             .advisorinfo,
             .miniConfigure,
             .tradeConfigure,
             .openTime,
             .otcConfigureReuqest,
             .rankTop,
             .banner,
             .notices,
             .symbols,
             .orderHistory,
             .miniOrderHistory,
             .orderDetailInfo,
             .otcOrderDetailInfo,
             .profileKYC,
             .depositRequest,
             .addressRequest,
             .currenciesRequest,
             .coinExchangeBusinessDeposit,
             .coinExchangeBusinessWithdraw,
             .coinExchangeOrders,
             .coinExchangeOrdersAccord,
             .walletLogRequest,
             .profileInfo,
             .advisorProfileInfo,
             .recommendArticleList,
             .followingArticleList,
             .getAccountPayments,
             .languageResource,
             .configureFeatures,
             .profileArticleInfo,
             .commentReply,
             .getCommentDetailInfoRequest,
             .getCommentReplyDetailInfoRequest,
             .userGuideDefine,
             .spotSymbols,
             .convertOrders,
             .coinExchangeBusiness,
             .tradeStatistics,
             .tradeStatisticsPending,
             .periodOfKLineData,
             .periodOfOTCKLineData,
             .tradeMiniNotes,
             .tradeOtcNotes,
             .defiList,
             .defiContent,
             .defiDetail,
             .defiEarnings,
             .messageCenter:
            return .get
            
        case .logoutRequest,
             .cancelArticleStarRequest,
             .unfollowingAdvisorRequest,
             .cancleArticleCommentLikeRequest,
             .deleteCommentReplyRequest,
             .cancelOverNight:
            return .delete
            
        case .changeAccountInfo:
            return .patch
            
        default:
            return .post
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var parameters: [String: Any]? {
        var params: [String: Any] = [:]
        switch self {
        case .otcStopPriceLoss(_, let price):
            params["stop_price"] = price
        case .otcStopPriceProfit(_, let price):
            params["stop_price"] = price
        case .coinExchangeAccept(_, let parameters):
            params = parameters
        case .accountBind(_, let parameters):
            params = parameters
        case .profileInfo(_, let parameters):
            params = parameters
        default: break
            
        }
        
        return params
    }
    
    var task: Task {
        switch self {
        //获取验证图片
        case let .captcha(parameters),
             let .balanceinfo(parameters),
             let .messageCenter(parameters),
             let .tradeConfigure(parameters),
             let .openTime(parameters),
             let .otcConfigureReuqest(parameters),
             let .rankTop(parameters),
             let .notices(parameters),
             let .symbols(parameters),
             let .orderHistory(parameters),
             let .miniOrderHistory(parameters),
             let .coinExchangeOrders(parameters),
             let .walletLogRequest(parameters),
             let .recommendArticleList(parameters),
             let .followingArticleList(parameters),
             let .profileInfo(_,parameters),
             let .profileArticleInfo(_,parameters),
             let .commentReply(_, parameters),
             let .convertOrders(parameters),
             let .periodOfKLineData(parameters),
             let .periodOfOTCKLineData(parameters),
             let .tradeMiniNotes(parameters),
             let .tradeOtcNotes(parameters),
             let .defiList(parameters),
             let .defiEarnings(_, parameters),
             let .advisorinfo(parameters):
            return .requestParameters(parameters:parameters, encoding: URLEncoding.default)
            
        case let .login(parameters),
             let .register(parameters),
             let .passwordReset(parameters),
             let .phoneCodeVerify(parameters),
             let .miniOrder(parameters),
             let .otcOrder(parameters),
             let .kyc1(parameters),
             let .kyc3(parameters),
             let .postAccountPayments(parameters),
             let .changeAccountInfo(parameters),
             let .postCommentInfo(_, parameters),
             let .postReplyInfo(_, parameters),
             let .convertSymbols(parameters),
             let .postDefiEarning(_, parameters),
             let .emailVerify(parameters):
            return .requestParameters(parameters:parameters, encoding: JSONEncoding.default)
        
        case  .otcOverNight(_),
              .cancelOverNight(_),
              .otcComplete(_),
              .profileKYC,
              .kyc2,
              .depositRequest,
              .coinExchangeBusinessWithdraw,
              .addressRequest,
              .currenciesRequest,
              .banner,
              .coinExchangeOrdersAccord(_),
              .cancelWithdrawOrder(_),
              .advisorProfileInfo(_),
              .advisorStarRequest(_),
              .articleStarRequest(_),
              .articleCommentLikeRequest(_),
              .cancelArticleStarRequest(_),
              .cancleArticleCommentLikeRequest(_),
              .articleCount(_),
              .orderDetailInfo(_),
              .unfollowingAdvisorRequest(_),
              .followingAdvisorRequest(_),
              .getAccountPayments,
              .languageResource,
              .configureFeatures,
              .accountinfo,
              .spotSymbols,
              .guideStepFinish(_),
              .getCommentDetailInfoRequest,
              .getCommentReplyDetailInfoRequest(_),
              .deleteCommentReplyRequest(_),
              .userGuideDefine,
              .coinExchangeBusiness(_),
              .tradeStatistics,
              .tradeStatisticsPending,
              .openWalletMulti,
              .closeMultipleWallet,
              .defiContent,
              .defiDetail(_),
              .otcOrderDetailInfo(_):
            return .requestPlain
             
        case .uploadHandheld(let data),
             .uploadLivingProof(let data),
             .postAccountPaymentsColumn(_, _, let data),
             .accountAvatar(let data),
             .uploadInfopage(let data):
            return .requestData(data as Data)
        
            
        default:
            if let parameters = parameters {
                return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            }
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        var token = UserDefaults.standard.object(forKey: APPTOKEN) as? String
        if (token != nil){
            token = "Bearer " + (token ?? "")
        } else {
            token = "Bearer "
        }
        let lan = UserDefaults.standard.object(forKey: "appLanguage") as? String ?? "en"
        
        switch self {
        case .uploadHandheld,
             .uploadLivingProof,
             .postAccountPaymentsColumn,
             .accountAvatar,
             .uploadInfopage:
            return ["Content-Type":"application/octet-stream","Client-Platform" : "ios","Accept":"application/json","Client-Version":CURRENTVERSION,"Accept-Language": lan,"Authorization":token ?? ""]
        default:
            return ["Content-Type":"application/json","Client-Platform" : "ios","Accept":"application/json","Client-Version":CURRENTVERSION,"Accept-Language": lan,"Authorization":token ?? ""]
        }
         
    }
    
}

//
//  DERouter.swift
//  coinandcoin
//
//  Created by yinghu on 4/6/20.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

class DERouter: NSObject {
    static let router = DERouter()
    
    func registerRouters () {
        login()
        setting()
        orderHistory()
        messageCenter()
        accountFllow()
        advisorProfile()
        inviteFrend()
        kycAuthentication()
        paymentManage()
        webview()
        orderHistoryManage()
        beginerMission()
        kycHelper()
        spotingOrders()
        defiManage()
        
    }
    
    func openUrl(url: String) {
        MGJRouter.openURL(url)
    }
    
    func loginPage() {
        MGJRouter.openURL(LOGIN_PATH)
    }
    
    func pushToViewController(controller : UIViewController) {
        if UIApplication.shared.keyWindow?.rootViewController?.isKind(of: DETabBarController.classForCoder()) == true {
            let nav = UIApplication.shared.keyWindow?.rootViewController as! DETabBarController
            nav.pushToViewController(controller: controller)
        }
    }
    
    func selectPageIndexController(index : Int) {
        if UIApplication.shared.keyWindow?.rootViewController?.isKind(of: DETabBarController.classForCoder()) == true {
            let tab = UIApplication.shared.keyWindow?.rootViewController as! DETabBarController
            if (tab.viewControllers?.count ?? 0) > index {
                tab.selectedIndex = index
            }
        }
    }
    
    func isLogin() -> Bool {
        return UserDefaults.standard.bool(forKey: ISLOGINKEY)
    }
    
    /*  废弃
     *  跳转评论详情--需传入 model DEProfileItem
     */
    
    func commentDetail()  {
        MGJRouter.registerURLPattern(COMMENT_DETAIL_PATH) { (routerParameters) ->() in
            if self.isLogin() == false {
                MGJRouter.openURL(LOGIN_PATH)
            }else {
                let commentid = routerParameters?["id"] as? String ?? ""
                let comment = DEArticleCommentController()
                comment.commentId = commentid
                comment.hidesBottomBarWhenPushed = true
                self.pushToViewController(controller: comment)
            }
        }
    }
    
    /*
     * 登录
     */
    func login() {
        MGJRouter.registerURLPattern(LOGIN_PATH) { (routerParameters) ->() in
            let login = DELoginController()
            login.hidesBottomBarWhenPushed = true
            self.pushToViewController(controller: login)
        }
    }
    
    /*
     *  KYC Helper
     */
    
    func kycHelper() {
        MGJRouter.registerURLPattern(KYC_HELPER_PATH) { (routerParameters) ->() in
            let helper = DEKycHelperController()
            let state = routerParameters?["state"] as? String ?? ""
            if state == "0" {
                helper.state = .kycHelperState_kyc1
            } else if state == "1" {
                helper.state = .kycHelperState_kyc2
            } else if state == "2" {
                helper.state = .kycHelperState_kyc3
            }
            helper.hidesBottomBarWhenPushed = true
            self.pushToViewController(controller: helper)
        }
    }
    
    /*
    * 设置
    */
    func setting() {
        MGJRouter.registerURLPattern(SETTING_PATH) { (routerParameters) ->() in
            let set = DESettingController()
            set.hidesBottomBarWhenPushed = true
            self.pushToViewController(controller: set)
        }
    }
    
    /*
    * 订单历史
    */
    func orderHistory() {
        MGJRouter.registerURLPattern(ORDERHISTORY_PATH) { (routerParameters) ->() in
            if self.isLogin() == false {
                MGJRouter.openURL(LOGIN_PATH)
            }else {
                let orderHistory = DEOrderHistoryController()
                let orderid = routerParameters?["orderid"]
                let isFromOTC = routerParameters?["fromOtc"] as? Bool ?? false
                if orderid != nil {
                    orderHistory.orderId = orderid as? String ?? ""
                    if isFromOTC == true {
                        orderHistory.state = .switchViewStateOTC
                    } else {
                        orderHistory.state = .switchViewStateMini
                    }
                    orderHistory.hidesBottomBarWhenPushed = true
                    self.pushToViewController(controller: orderHistory)
                }
            }
        }
    }
    
    
    
    /*
    * 历史订单管理
    */
    func orderHistoryManage() {
        MGJRouter.registerURLPattern(ORDERHISTORY_MANAGE_PATH) { (routerParameters) ->() in
            if self.isLogin() == false {
                MGJRouter.openURL(LOGIN_PATH)
            }else {
                let orderHistory = DEOrderHistoryManageController()
                orderHistory.hidesBottomBarWhenPushed = true
                self.pushToViewController(controller: orderHistory)
            }
        }
    }
      
    
    /*
    * 消息中心
    */
    func messageCenter() {
        MGJRouter.registerURLPattern(MESSAGE_CENTER_PATH) { (routerParameters) ->() in
            if self.isLogin() == false {
                MGJRouter.openURL(LOGIN_PATH)
            }else {
                let center = DEMessageCenterController()
                center.hidesBottomBarWhenPushed = true
                self.pushToViewController(controller: center)
            }
        }
    }
    
    /*
     * 账户流水
     */
    func accountFllow() {
        MGJRouter.registerURLPattern(ACCOUNT_FLOW_PATH) { (routerParameters) ->() in
            if self.isLogin() == false {
                MGJRouter.openURL(LOGIN_PATH)
            }else {
                let fllow = DEAccountFllowController()
                fllow.hidesBottomBarWhenPushed = true
                self.pushToViewController(controller: fllow)
            }
        }
    }
    
    /*
     * 代理人主页
     */
    func advisorProfile() {
        MGJRouter.registerURLPattern(ADVISOR_PROFILE_PATH) { (routerParameters) ->() in
            let vc = DEAdvisorProfileController()
            let userid = routerParameters?["userid"] as? String ?? ""
            if userid.count > 0 {
                vc.userId = userid
                vc.hidesBottomBarWhenPushed = true
                self.pushToViewController(controller: vc)
            }
        }
    }
    
    /*
    * 邀请好友
    */
    func inviteFrend() {
        MGJRouter.registerURLPattern(INVITE_FRENDS_PATH) { (routerParameters) ->() in
            if self.isLogin() == false {
                MGJRouter.openURL(LOGIN_PATH)
            }else {
                
                let vc = DEInviteFrendController()
                let userid = routerParameters?["refferCode"] as? String ?? ""
                if userid.count > 0 {
                    vc.refferCode = userid
                    vc.hidesBottomBarWhenPushed = true
                    self.pushToViewController(controller: vc)
                }
            }
        }
    }
    
    
    /*
     * KYC认证
     */
    func kycAuthentication() {
        MGJRouter.registerURLPattern(KYC_PATH) { (routerParameters) ->() in
            if self.isLogin() == false {
                MGJRouter.openURL(LOGIN_PATH)
            }else {
                
                let vc = DEKycController()
                vc.hidesBottomBarWhenPushed = true
                self.pushToViewController(controller: vc)
                
            }
        }
    }
    
    
    /*
     * 支付通道管理
     */
    func paymentManage() {
        MGJRouter.registerURLPattern(PAYMENT_MANAGE_PATH) { (routerParameters) ->() in
            if self.isLogin() == false {
                MGJRouter.openURL(LOGIN_PATH)
            }else {
                let vc = DEPaymentManageController()
                vc.hidesBottomBarWhenPushed = true
                self.pushToViewController(controller: vc)
            }
        }
    }
    
    
    /*
     * 支付通道管理
     */
    func webview() {
        MGJRouter.registerURLPattern(WEBVIEW_PATH) { (routerParameters) ->() in
            let vc = DEWKWebViewController()
            let url = routerParameters?["url"]
            if url != nil {
                vc.url = url as! String
            }
            vc.hidesBottomBarWhenPushed = true
            self.pushToViewController(controller: vc)
        }
    }
    
    /**
     *  新手引导
     */
    
    func beginerMission() {
        
        MGJRouter.registerURLPattern(BEGINER_MISSION_PATH) { (routerParameters) ->() in
            if DERouter.router.isLogin() == false {
                MGJRouter.openURL(LOGIN_PATH)
            } else {
                let beginer = DEBeginerMissionController()
                beginer.hidesBottomBarWhenPushed = true
                self.pushToViewController(controller: beginer)
            }
        }
    }
    
    /**
     *  现货交易
     */
    
    func spotingOrders() {
        
        MGJRouter.registerURLPattern(SPOT_TRADING_ORDERS_PATH) { (routerParameters) ->() in
            if DERouter.router.isLogin() == false {
                MGJRouter.openURL(LOGIN_PATH)
            } else {
                let order = DESpotTradingOrersController()
                order.hidesBottomBarWhenPushed = true
                self.pushToViewController(controller: order)
            }
        }
    }
    
    
    /**
     *  defi管理列表
     */
    func defiManage() {
        MGJRouter.registerURLPattern(DEFI_PATH) { (routerParameters) ->() in
            let defi = DEDefiViewController()
            defi.hidesBottomBarWhenPushed = true
            self.pushToViewController(controller: defi)
        }
    }
    
    
}

//
//  macro.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/9.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

// 屏幕的宽
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

// 屏幕的高
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

//获取状态栏高度
let STATUS_HEIGHT = UIApplication.shared.statusBarFrame.size.height

//判断iPhone4
let IPHONE4_DEV:Bool! = (UIScreen.main.bounds.size.height == 480) ? true : false

//判断iPhone5/5c/5s
let IPHONE5_DEV:Bool! = (UIScreen.main.bounds.size.height == 568) ? true : false

//判断iPhone6/6s
let IPHONE6s_DEV:Bool! = (UIScreen.main.bounds.size.height == 667) ? true : false

//判断iPhone6p
let IPHONE6p_DEV:Bool! = (UIScreen.main.bounds.size.height > 667) ? true : false


//判断iPhoneX
func isiPhoneX() ->Bool {
    let screenHeight = UIScreen.main.nativeBounds.size.height;
    if screenHeight == 2436 || screenHeight == 1792 || screenHeight == 2688 || screenHeight == 1624 {
        return true
    }
    return false
}
let IPHONEX_DEV:Bool! = isiPhoneX()

let NAVIGATION_HEGIH = IPHONEX_DEV ? CGFloat(88) : CGFloat(64)
//let NAVIGATION_HEGIH = 0
//let NAVIGATION_HEGIH = IPHONEX_DEV ? 140.0 : 64.0
//判断iPad
let IPAD_DEV:Bool! = (UIDevice.current.userInterfaceIdiom == .pad) ? true : false

//tabbar高度
let TABBAR_HEIGHT = IPHONEX_DEV ? 83.0 : 49.0

let HOME_INDICATOR_HEIGHT = IPHONEX_DEV ? 34.0 : 0

let STATUSBAR_HEIGHT = UIApplication.shared.statusBarFrame.height 





//图片占位图名称
let IMAGE_PLACEHOLDER = "image_placehoder"
let DEFAULT_USER_LOGO = "default_user_advatar"

//Font

func font_Helvetica(size:CGFloat) ->UIFont{
    return UIFont.init(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size)
}

func font_HelveticaBold(size:CGFloat) ->UIFont{
    return UIFont.init(name: "Helvetica Bold", size: size) ?? UIFont.systemFont(ofSize: size)
}

func font_PingFangSC(size:CGFloat) ->UIFont{
    return UIFont.init(name: "PingFangSC", size: size) ?? UIFont.systemFont(ofSize: size)
}


/******弹框弹出时间********/
let ANIMATION_POP_INTERVAL = 0.2
/******弹框弹出delay********/
let ANIMATION_POP_DELAY = 0.01


/******APP Token********/
let APPTOKEN = "token"
/******用户信息********/
let USERINFOMATIONKEY = "deuserinfomation"
/******登录成功通知********/
let LOGINSUCCESSFUL = "loginsuccessful"
/******退出登录通知********/
let LOGOUTSUCCESSFUL = "logoutsuccessful"
/******当前时区设置********/
let TIMEZONESETTINGKEY = "tomezonesetting"
/******当前语言设置********/
let LANGUAGESETTINGKEY = "languagesetting"
/******是否一键交易********/
let ONKEYFORTRADEKEY = "onekeyfortrade"

/******是否设置手机模式 浅色模式********/
let VISIONMODEKEY = "lightmodelkey"

/******trade配置********/
let CONTRACTCONFIGURE = "contractConfigure"
/******OTC配置********/
let CONTRACTOTCCONFIGURE = "contractOTCConfigure"
/******用户信息更新********/
let USERINFO_UPDATE_NOTIFACAION = "userinfo_update_notifacation"
/******是否登录判断********/
let ISLOGINKEY = "islogin"
/******用户钱包信息********/
let USERACOUNTINFOKEY = "useraccountkey"
/******是否是DEMO状态 BOOL值********/
let DEMO_STATUS_KEY = "useraccountkey_demo"

/***语言切换***/
let LANGUAGE_CHANGED_KEY = "language_changed_key"

/***debug模式***/
let DEBUGMODEL_KEY = "debugmodel"

/*语言时间戳*/
let LANGUAGE_TS_KEY = "language_ts_key"

let APPWAKEUP_KEY = "appwakeup"

let SOCKETCONNECTERROR_KEY = "sockectConnectErrorKey"

let IS_DEMO_STATUS_KEY = "isDemoStatusKey"

let BEGINER_GUIDE_KYC = "377d-e904-0a8d-9395"
let BEGINER_GUIDE_CONTRACT = "b392-827b-09c6-a712"
let BEGINER_GUIDE_CHARGE = "8eaa-8a8a-f1bf-ac01"

let MINI_CURRENT_PRICE_KEY = "mini_current_price_key"
let OTC_CURRENT_PRICE_KEY = "otc_current_price_key"
let CURRENTVERSION = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
let ISLOGIN = UserDefaults.standard.bool(forKey: ISLOGINKEY)
//多钱包开启或者关闭通知
let MULTIPLE_WALLET_STATUS = "multipleWalletsStatus"


let infoDictionary = Bundle.main.infoDictionary
let appDisplayName:AnyObject? = infoDictionary?["CFBundleDisplayName"] as AnyObject? //程序名称
let majorVersion :AnyObject? = infoDictionary? ["CFBundleShortVersionString"] as AnyObject?//主程序版本号
let minorVersion :AnyObject? = infoDictionary? ["CFBundleVersion"] as AnyObject?//版本号（内部标示）
//设备信息
let iosVersion : NSString = UIDevice.current.systemVersion as NSString //ios版本
let identifierNumber = UIDevice.current.identifierForVendor //设备udid
let systemName = UIDevice.current.systemName //设备名称
let model = UIDevice.current.model //设备型号
let localizedModel = UIDevice.current.localizedModel //设备区域化型号


//    闭盘倒计时 提示
let MAX_SHOW_CLOSE_MARKET_COUNTDOWN_SECONDS : Double = 60 * 30;
let BMTextField_HEIGHT : CGFloat = 80

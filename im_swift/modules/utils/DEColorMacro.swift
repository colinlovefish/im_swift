//
//  DEColorMacro.swift
//  coinandcoin
//
//  Created by yinghu on 2020/8/10.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import Foundation

let isOpenLightMode : Bool = true


let TEXT_BLUE = UIColor.init(hex: "#0A84FF")
let LIGHT_GREEN =  UIColor.init(hex: "#06CF81")
let BG_ORANGE = UIColor.init(hex: "#F3961C")
let SHADOW_BLUE = UIColor.init(hex: "#0A84FF", alpha:0.6)
let YELLOW = UIColor.init(hex: "#F3961C")
let LIGHT_GRAY = UIColor.init(hex: "#D8D8D8")


func tabbarBlueColor() -> UIColor {
    if isOpenLightMode == false {
        return UIColor.init(hex: "#38405F")!
    }
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#9DA2B7")!
    } else {
        return UIColor.init(hex: "#38405F")!
    }
}

func arrawWhiteColor() -> UIColor {
    if isOpenLightMode == false {
        return UIColor.init(hex: "#FFFFFF", alpha: 0.2)!
    }
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#333333", alpha: 0.2)!
    } else {
        return UIColor.init(hex: "#FFFFFF", alpha: 0.2)!
    }
}

 func darkGreenColor() -> UIColor {
    if isOpenLightMode == false {
        return UIColor.init(hex: "#43B149")!
    }
    
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#00B55F")!
    } else {
        return UIColor.init(hex: "#43B149")!
    }
}

func darkGreenAlphaColor(alpha: CGFloat) -> UIColor {
    if isOpenLightMode == false {
        return UIColor.init(hex: "#43B149",alpha: alpha)!
    }
    
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#00B55F",alpha: alpha)!
    } else {
        return UIColor.init(hex: "#43B149", alpha: alpha)!
    }
}



func darkRedColor() -> UIColor {
    if isOpenLightMode == false {
        return UIColor.init(hex: "#E8382F")!
    }
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#DE543E")!
    } else {
        return UIColor.init(hex: "#E8382F")!
    }
}

func darkRedAlphaColor(alpha: CGFloat) -> UIColor {
    if isOpenLightMode == false {
        return Color(hex: "#E8382F", alpha: alpha)!
    }
    if getDisplayMode() == .modeStatusLight {
        return Color(hex: "#DE543E", alpha: alpha)!
    } else {
        return Color(hex: "#E8382F", alpha: alpha)!
    }
}

//分割线颜色
//let LINE_WHITE = DEModeManager.shareInstance.getAppMode() == .modeStatusLight ? LIGHT_MODE_LINE : NIGHT_MODE_LINE
//let LIGHT_MODE_LINE = UIColor.init(hex: "#FFFFFF", alpha:0.12)
//let NIGHT_MODE_LINE = UIColor.init(hex: "#E3E3E3")

func lineWhiteColor() -> UIColor {
    if isOpenLightMode == false {
           return UIColor.init(hex: "#FFFFFF", alpha:0.12)!
       }
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#E3E3E3")!
    } else {
        return UIColor.init(hex: "#FFFFFF", alpha:0.12)!
    }
}

func alphaWhiteColor() -> UIColor {
    if isOpenLightMode == false {
           return UIColor.init(hex: "#FFFFFF", alpha:0.1)!
       }
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#E3E3E3")!
    } else {
        return UIColor.init(hex: "#FFFFFF", alpha:0.1)!
    }
}

func alphaDarkWhiteColor() -> UIColor {
    if isOpenLightMode == false {
           return UIColor.init(hex: "#FFFFFF", alpha:0.2)!
       }
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#333333")!
    } else {
        return UIColor.init(hex: "#FFFFFF", alpha:0.2)!
    }
}

//字体颜色，主要字体
//let CONTENT_TEXT_WHITE = DEModeManager.shareInstance.getAppMode() == .modeStatusLight ? LIGHT_MODE_CONTENT_MAIN_TEXT : DARK_MODE_CONTENT_MAIN_TEXT
//let LIGHT_MODE_CONTENT_MAIN_TEXT = UIColor.init(hex: "#333333")
//let DARK_MODE_CONTENT_MAIN_TEXT = UIColor.white

func contentTextWhiteColor() -> UIColor {
    if isOpenLightMode == false {
        return UIColor.white
    }
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#333333")!
    } else {
        return UIColor.white
    }
}

func homeToolIconColor() -> UIColor {
    if isOpenLightMode == false {
           return UIColor.white
       }
       if getDisplayMode() == .modeStatusLight {
           return UIColor.init(hex: "#4469F8")!
       } else {
           return UIColor.white
       }
}


//背景色
//let DARK_BLUE = DEModeManager.shareInstance.getAppMode() == .modeStatusLight ? LIGHT_MODE_BGCOLOR : DARK_MODE_BGCOLOR
//let LIGHT_MODE_BGCOLOR = UIColor.init(hex: "#F0F1F2")
//let DARK_MODE_BGCOLOR = UIColor.init(hex: "#191E31")

func darkBlueColor() -> UIColor {
    if isOpenLightMode == false {
        return UIColor.init(hex: "#191E31")!
    }
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#F0F1F2")!
    } else {
        return UIColor.init(hex: "#191E31")!
    }
}

func getNavigationBarBackgroundColor() -> UIColor {
    if isOpenLightMode == false {
        return UIColor.init(hex: "#191E31")!
    }
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#FFFFFF")!
    } else {
        return UIColor.init(hex: "#191E31")!
    }
}

//内容填充区域背景色
//let light_BLUE = DEModeManager.shareInstance.getAppMode() == .modeStatusLight ? LIGHT_MODE_CONTENT_COLOR : DARK_MODE_CONTENT_COLOR
//let LIGHT_MODE_CONTENT_COLOR = UIColor.init(hex: "#FFFFFF")
let DARK_MODE_CONTENT_COLOR = UIColor.init(hex: "#242C43")!

func lightBlueColor() -> UIColor {
    if isOpenLightMode == false {
         return UIColor.init(hex: "#242C43")!
    }
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#FFFFFF")!
    } else {
        return UIColor.init(hex: "#242C43")!
    }
}


func homePageToolColor() -> UIColor {
    if isOpenLightMode == false {
         return UIColor.init(hex: "#242C43")!
    }
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#0A84FF" ,alpha: 0.1)!
    } else {
        return UIColor.init(hex: "#242C43")!
    }
}

//字体颜色
//let TEXT_WHITE =  DEModeManager.shareInstance.getAppMode() == .modeStatusLight ? LIGHT_MODE_TEXT_CONTENT_COLOR : DARK_MODE_TEXT_CONTENT_COLOR
//let LIGHT_MODE_TEXT_CONTENT_COLOR = UIColor.init(hex: "#757575")
//let DARK_MODE_TEXT_CONTENT_COLOR = UIColor.init(hex: "#FFFFFF", alpha:0.6)

func textWhiteColor() -> UIColor {
    if isOpenLightMode == false {
        return UIColor.init(hex: "#FFFFFF", alpha:0.6)!
    }
    if getDisplayMode() == .modeStatusLight {
        return UIColor.init(hex: "#757575")!
    } else {
        return UIColor.init(hex: "#FFFFFF", alpha:0.6)!
    }
}


//获取首页tabbar图标
func getTabbarHome() -> String {
    if isOpenLightMode == false {
        return "_home"
    }
    if getDisplayMode() == .modeStatusLight {
//        return "light_mode_home"
        return "_home"
    } else {
        return "_home"
    }
}

func getTabbarExchage() -> String {
    if isOpenLightMode == false {
        return "_exchange"
    }
    if getDisplayMode() == .modeStatusLight {
//        return "light_mode_exchange"
        return "_exchange"
    } else {
        return "_exchange"
    }
}

func getTabbarMini() -> String {
    if isOpenLightMode == false {
        return "_mini"
    }
    if getDisplayMode() == .modeStatusLight {
//        return "light_mode_mini"
        return "_mini"
    } else {
        return "_mini"
    }
}

func getTabbarOtc() -> String {
    if isOpenLightMode == false {
        return "_perpetual"
    }
    if getDisplayMode() == .modeStatusLight {
//        return "light_mode_perpetual"
        return "_perpetual"
    } else {
        return "_perpetual"
    }
}

func getTabbarProfile() -> String {
    if isOpenLightMode == false {
        return "_profile"
    }
    if getDisplayMode() == .modeStatusLight {
//        return "light_mode_profile"
        return "_profile"
    } else {
        return "_profile"
    }
}

func getHomePageLogo() -> String {
        if isOpenLightMode == false {
            return "coin&Coin"
        }
        if getDisplayMode() == .modeStatusLight {
            return "light_mode_coin&Coin"
        } else {
            return "coin&Coin"
        }
}

func getDisplayMode() -> modeStatus {
    let tDict = UserDefaults.standard.object(forKey: VISIONMODEKEY)
    if tDict == nil {
        return DEModeManager.shareInstance.getAppMode()
    } else {
        let t = tDict as? NSDictionary ?? [:]
        if (t["type"] as? String ?? "") == "1" {
            return .modeStatusLight
        } else if (t["type"] as? String ?? "") == "2" {
            return .modeStatusDark
        }
        return DEModeManager.shareInstance.getAppMode()
    }
}




//func getLightVisionMode() -> Dictionary<String>  {
//    let param : Dictionary<String> = UserDefaults.standard.bool(forKey: VISIONMODEKEY)
//
//    return param
//}

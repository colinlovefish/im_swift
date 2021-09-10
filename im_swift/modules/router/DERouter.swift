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
    
        
    }
    
    func openUrl(url: String) {
        MGJRouter.openURL(url)
    }
    
  
    func pushToViewController(controller : UIViewController) {
        if UIApplication.shared.keyWindow?.rootViewController?.isKind(of: CTTabBarViewController.classForCoder()) == true {
            let nav = UIApplication.shared.keyWindow?.rootViewController as! CTTabBarViewController
            nav.pushToViewController(controller: controller)
        }
    }
    
    func selectPageIndexController(index : Int) {
        if UIApplication.shared.keyWindow?.rootViewController?.isKind(of: CTTabBarViewController.classForCoder()) == true {
            let tab = UIApplication.shared.keyWindow?.rootViewController as! CTTabBarViewController
            if (tab.viewControllers?.count ?? 0) > index {
                tab.selectedIndex = index
            }
        }
    }
    

    
    
}

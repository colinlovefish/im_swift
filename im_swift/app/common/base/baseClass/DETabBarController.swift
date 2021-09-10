//
//  DETabBarController.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/6.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

class DETabBarController: UITabBarController {
    
    
    lazy var publicViewModel = DEPublickViewModel()
    
    lazy var homePage = DEHomePageController()
    lazy var exchangePage = DEExchangeController()
    lazy var miniPage = DEMiniContractController()
    lazy var longPage = DELongContractController()
    lazy var  personalPage = DEPersinalCenterController()
    
    fileprivate var downLoader = DownLoader()
    
    lazy var configureList = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(false, forKey: DEMO_STATUS_KEY)
        self.publicViewModel.configureFeatureRequest()
        LaunchScreenAnimation()
        
//        DEModeManager.shareInstance.getAppMode()
      
        self.view.backgroundColor = darkBlueColor()
        let bg = UIView.init(frame: CGRect.init(x: 0, y: self.tabBar.bounds.origin.y, width: SCREEN_WIDTH, height: CGFloat(TABBAR_HEIGHT)))
        bg.backgroundColor = darkBlueColor()
        self.tabBar.insertSubview(bg, at: 0)
        
        
        
        let homeNavi = naviViewController(childerVC: homePage, title: "", normalImg: getTabbarHome(), selectedImg: "_home_selected")
        
        
        exchangePage.leftBarHidden(isHidden: true)
        let exchangeNavi = naviViewController(childerVC: exchangePage, title: "", normalImg: getTabbarExchage(), selectedImg: "_exchange_selected")
        
        
        
        miniPage.registerBeigerGuideNotification()
        miniPage.leftBarHidden(isHidden: true)
        let miniNavi = naviViewController(childerVC: miniPage, title: "", normalImg: getTabbarMini(), selectedImg: "_mini_selected")
        
        
        
        longPage.leftBarHidden(isHidden: true)
        let longNavi = naviViewController(childerVC: longPage, title: "", normalImg: getTabbarOtc(), selectedImg: "_perpetual_selected")
        
        
        
        personalPage.leftBarHidden(isHidden: true)
        
        let personalNavi = naviViewController(childerVC: personalPage, title: "", normalImg: getTabbarProfile(), selectedImg: "_profile_selected")
        
        self.configureList.add(homeNavi)
        self.configureList.add(longNavi)
        self.configureList.add(personalNavi)
        
        self.viewControllers = self.configureList as? [UIViewController]
        
        _ = self.publicViewModel.configureSubjct.subscribe(onNext: { (x) in
            self.configureList.removeAllObjects()
            let model = x as? configureModel ?? configureModel()
            
            let currntTs = UserDefaults.standard.object(forKey: LANGUAGE_TS_KEY) as? Double ?? 0
            if (currntTs != model.language_ts) {
                let urlString = model.language_url
                let isDemo = UserDefaults.standard.bool(forKey: DEMO_STATUS_KEY)
                if isDemo == false && urlString != nil{
                    self.downLoader.downLoader(url: URL(string: urlString ?? "")!)
                    UserDefaults.standard.set(model.language_ts, forKey: LANGUAGE_TS_KEY)
                }
            }
            
            self.personalPage.config = model
            self.configureList.add(homeNavi)
            if model.deposit == true {
                self.configureList.add(exchangeNavi)
            }
            if model.mini_contract == true {
                self.configureList.add(miniNavi)
            }
            if model.otc_contract == true {
                self.configureList.add(longNavi)
            }
            
            self.configureList.add(personalNavi)
            
            self.viewControllers = self.configureList as? [UIViewController]
        }, onError: { (error) in
            
        }, onCompleted: { }) { }
        
    }
    
    private func LaunchScreenAnimation() {
        guard let lanchScreen = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController() else {
            return
        }
        self.view.addSubview(lanchScreen.view)
        if let imageView = lanchScreen.view.viewWithTag(10051) as? UIImageView {
            UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: .pi)
                imageView.transform = .identity
                imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                lanchScreen.view.alpha = 0
            }) { (finished) in
                lanchScreen.view.removeFromSuperview()
            }
        }
        
    }
    
    func naviViewController(childerVC:UIViewController,title: String?,normalImg:String,selectedImg:String) -> DEBaseNavigationController {
        let norImg = UIImage(named:normalImg as String)
        let selImg = UIImage(named:selectedImg as String)
        let tabItem = MyTabBarItem(image: norImg,selectedImage: selImg)
        UITabBar.appearance().unselectedItemTintColor = tabbarBlueColor()
        let naVc = DEBaseNavigationController()
        naVc.tabBarItem = tabItem
        naVc.addChild(childerVC)
        return naVc
    }
    
    //添加子控制器
    func addChildViewController(childerVC:UIViewController,title: String?,normalImg:String,selectedImg:String)  {
        let norImg = UIImage(named:normalImg as String)
        let selImg = UIImage(named:selectedImg as String)
        let tabItem = MyTabBarItem(image: norImg,selectedImage: selImg)
        UITabBar.appearance().unselectedItemTintColor = tabbarBlueColor()
        let naVc = DEBaseNavigationController()
        naVc.tabBarItem = tabItem
        naVc.addChild(childerVC)
        self.addChild(naVc)
    }
    
    
    func pushToViewController(controller : UIViewController) {
        let curNav = self.viewControllers?[self.selectedIndex] as! UINavigationController
        curNav.pushViewController(controller, animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  CTTabBarViewController.swift
//  im_swift
//
//  Created by yinghu on 2021/9/10.
//

import UIKit

class CTTabBarViewController: UITabBarController {

    lazy var configureList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let chats = CTChatsController();
        let contacts = CTContactsController()
        let discover = CTDiscoverController()
        let me = CTMeController()
        
        let chatsNavi = naviViewController(childerVC: chats, title: "", normalImg: getTabbarHome(), selectedImg: "_home_selected")
        
        
//        exchangePage.leftBarHidden(isHidden: true)
        let contactsNavi = naviViewController(childerVC: contacts, title: "", normalImg: getTabbarExchage(), selectedImg: "_exchange_selected")
        
        
        
    
        let discoverNavi = naviViewController(childerVC: discover, title: "", normalImg: getTabbarMini(), selectedImg: "_mini_selected")
        
        
        
        
        let meNavi = naviViewController(childerVC: me, title: "", normalImg: getTabbarOtc(), selectedImg: "_perpetual_selected")
        
        
        
        
    
        self.configureList.add(chatsNavi)
        self.configureList.add(contactsNavi)
        self.configureList.add(discoverNavi)
        self.configureList.add(me)
        
        self.viewControllers = self.configureList as? [UIViewController]
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

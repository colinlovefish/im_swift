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
        
        let chatsNavi = naviViewController(childerVC: chats, title: "聊天", normalImg: getTabbarChat(), selectedImg: "tab_chat_select")
        
        
        let contactsNavi = naviViewController(childerVC: contacts, title: "通讯录", normalImg: getTabbarContact(), selectedImg: "tab_contact_selected")
        
        
        let discoverNavi = naviViewController(childerVC: discover, title: "发现", normalImg: getTabbarDiscover(), selectedImg: "tab_discover_selected")
        
        
        let meNavi = naviViewController(childerVC: me, title: "我", normalImg: getTabbarMe(), selectedImg: "tab_user_selected")
        
        
        
        self.configureList.add(chatsNavi)
        self.configureList.add(contactsNavi)
        self.configureList.add(discoverNavi)
        self.configureList.add(meNavi)
        
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

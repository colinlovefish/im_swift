//
//  DEBaseController.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/6.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class DEBaseController: UIViewController {
    
    var leftItem : UIBarButtonItem!
    lazy var leftBtn = UIButton.init(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationConfigure()
        
        self.de_addSubviews()
        self.de_bindViewViewModel()
        
        // Do any additional setup after loading the view.
    }
    
    func navigationConfigure() {
        self.navigationController?.navigationBar.barTintColor = getNavigationBarBackgroundColor()
        self.navigationController?.navigationBar.tintColor = contentTextWhiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: contentTextWhiteColor(),NSAttributedString.Key.font:UIFont.systemFont(ofSize:19)]
        self.navigationController?.navigationBar.isTranslucent = false
        self.extendedLayoutIncludesOpaqueBars = true
        self.view.backgroundColor = darkBlueColor()
        
        leftBtn.frame = CGRect.init(x:0,y:0, width:20,height: 20)
        leftBtn.tintColor = contentTextWhiteColor()
        leftBtn.setImage(UIImage.init(named: "navigtion_back"), for: .normal)
        leftBtn.addTarget(self, action: #selector(navigationBack), for: .touchUpInside)
        leftBtn.imageView?.contentMode = .scaleAspectFit
        leftBtn.imageView?.tintColor = contentTextWhiteColor()
        
        let leftView = UIView()
        leftView.frame = CGRect.init(x: 0, y: 0, width: 20, height: 20)
        leftView.addSubview(leftBtn)
        leftItem = UIBarButtonItem.init(customView: leftView)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
       // 获取当前控制器
    func getCurrentViewcontroller() -> UIViewController?{
        let rootController = UIApplication.shared.keyWindow?.rootViewController
        if let tabController = rootController as? UITabBarController   {
            if let navController = tabController.selectedViewController as? UINavigationController{
                return navController.children.last
            }else{
                return tabController
            }
        }else if let navController = rootController as? UINavigationController {
            return navController.children.last
        }else{
            return rootController
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if getDisplayMode() == .modeStatusLight {
            if #available(iOS 13.0, *) {
                return .darkContent
            } else {
                // Fallback on earlier versions
                return .default
            }
        }
        return .lightContent
    }
    
    func leftBarHidden(isHidden : Bool) {
    
        leftBtn.isHidden = isHidden
    }
    
    @objc func navigationBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.de_getNewData()
        self.de_layoutNavigation()
    }
    
    
    func loginPage() {
        if UserDefaults.standard.bool(forKey: ISLOGINKEY)  == false {
            MGJRouter.openURL(LOGIN_PATH)
            return
        }
    }

    /**
     添加控件
     */
    func de_addSubviews() {}
    
    /**
    绑定
    */
    func de_bindViewViewModel() {}
    
    /**
    设置navigation
    */
    func de_layoutNavigation() {}
    
    /**
    初次获取数据
    */
    func de_getNewData() {}
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



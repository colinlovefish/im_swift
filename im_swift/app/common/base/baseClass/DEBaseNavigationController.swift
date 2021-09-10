//
//  DEBaseNavigationController.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/6.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

class DEBaseNavigationController: UINavigationController ,UINavigationBarDelegate, UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.backgroundColor = getNavigationBarBackgroundColor()
        self.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer!.isEnabled = true
        
        // Do any additional setup after loading the view.
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

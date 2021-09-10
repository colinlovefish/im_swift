//
//  MyTabBarItem.swift
//  coinandcoin
//
//  Created by yinghu on 2020/4/22.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

class MyTabBarItem: UITabBarItem {
    override var title: String? {
           get { return nil }
           set { super.title = title }
       }

       override var imageInsets: UIEdgeInsets {
           get { return UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0) }
           set { super.imageInsets = imageInsets }
       }

       convenience init(image: UIImage? , selectedImage: UIImage?) {
           self.init()

           self.image = image
    
           self.selectedImage = image
       }

       override init() {
           super.init()
       }

       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}

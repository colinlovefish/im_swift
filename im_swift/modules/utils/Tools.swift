//
//  Tools.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/23.
//  Copyright © 2020 deepcoin. All rights reserved.
//

//import Foundation
import UIKit

class Tools: NSObject {
    //当前选中的项目
    var selectedIndex: Int = 0
    
    func readLocalJsonFileWithName(name: String) -> NSDictionary {
        let path = Bundle.main.path(forResource: name, ofType: "json")
        let url = URL(fileURLWithPath: path!)
        // 带throws的方法需要抛异常
        do {
            /*
             * try 和 try! 的区别
             * try 发生异常会跳到catch代码中
             * try! 发生异常程序会直接crash
             */
            let data = try Data(contentsOf: url)
            let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            let jsonDict = jsonData as! NSDictionary
            
            return jsonDict
            
            
        } catch let error as Error? {
            print("读取本地数据出现错误!",error ?? "error")
        }
        
        return NSDictionary.init()
        
    }
}


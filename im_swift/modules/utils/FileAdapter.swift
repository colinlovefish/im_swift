//
//  FileAdapter.swift
//  coinandcoin
//
//  Created by yinghu on 2020/7/18.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

class FileAdapter: NSObject {
    static let shareInstance = FileAdapter()
//    var selectedIndex : Int = 0
    var currentType : selectType?
    
    func loadJsonFileWithState(state: selectType, isDefault: Bool, selectedItem: String ) -> Array<Any> {
        let list = loadJsonFileWithState(state: state)
        if isDefault == true {
            let temp = NSMutableArray()
            for i in 0 ..< list.count where list[i] is Dictionary<String, Any> {
                let mutDict = NSMutableDictionary()
                let tem = list[i] as? Dictionary<String, Any> ?? [:]
                mutDict.addEntries(from: tem)
                let valueStr = tem["value"] as? String ?? ""
                if valueStr.lowercased() == selectedItem.lowercased() {
                    currentType = state
                    mutDict.addEntries(from: ["isDefault": true])
                } else {
                    mutDict.addEntries(from: ["isDefault" : false])
                }
                temp.add(mutDict)
            }
            return temp as Array
        } else {
            return list
        }
        
    }
    
    
    func loadJsonFileWithState(state: selectType, isDefault: Bool, index: Int) -> Array<Any>{
        let list = loadJsonFileWithState(state: state)
        
        if isDefault == true {
            let temp = NSMutableArray()
            if index < list.count {
                for i in 0 ..< list.count where list[i] is Dictionary<String, Any> {
                    let mutDict = NSMutableDictionary()
                    mutDict.addEntries(from: list[i] as! Dictionary<String, Any>)
                    if i == index {
                        currentType = state
                        mutDict.addEntries(from: ["isDefault": true])
                    } else {
                        mutDict.addEntries(from: ["isDefault" : false])
                    }
                    temp.add(mutDict)
                }
            }
            return temp as Array
        } else {
            return list
        }
    }

    
    func loadJsonFileWithState(state : selectType) -> Array<Any>{
        
        switch state {
        case .s_tomezone:
            let list = loadJsonFile(fileName: "timezone")
            return list
        case .s_language:
            let list = loadJsonFile(fileName: "language_select")
            return list
        case .s_vision_mode:
            let list = loadJsonFile(fileName: "vision")
            return list
        case .s_klineIndicator_channel:
            let list = loadJsonFile(fileName: "kline_indicator_channel")
            return list
        case .s_klineIndicator_chart:
            let list = loadJsonFile(fileName: "kline_indicator_chart")
            return list
        case .s_region:
            let path = Bundle.main.path(forResource: "regions", ofType: "json")!
            let url = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: url)
                let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                let jsonDict = jsonData as! NSDictionary
                return jsonDict["flags"] as? Array<Dictionary<String, Any>> ?? []
            }catch let error as Error? {
                debugPrint("read json file error",error ?? "error")
            }
        case .s_spotTrading:
            let list = loadJsonFile(fileName: "spot_trading")
            return list
            
        default:
            let list = loadJsonFile(fileName: "spot_trading")
            return list
        }
        return[]
    }
    
    func loadJsonFile(fileName: String) -> Array<Dictionary<String, Any>>{
        let tool  = Tools()
        let dict : NSDictionary = tool.readLocalJsonFileWithName(name:fileName)
        let array = dict["list"] as! Array<Dictionary<String, Any>>
        return array
    }
    
    
}

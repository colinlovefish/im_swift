//
//  DERegionSelectView.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/16.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit
//import SVGKit

protocol regionSelectDelegate :NSObjectProtocol {
    func regionSelect(param : NSDictionary, index: Int)
    func currencySelected(item : DECurrencyRateItem, index: Int)
    func currencyCoinSelected(item: DECoinItem, index: Int)
    
}

enum selectType: Int {
    case s_region = 0
    case s_tomezone
    case s_language
    case s_rate
    case s_rate_coin
    case s_spotTrading
    case s_coin //出入金 coin
    case s_timeInterval_mini
    case s_timeInterval_otc
    case s_klineIndicator_channel
    case s_klineIndicator_chart
    case s_vision_mode

}

class DERegionSelectView: DEBaseView{
    let menuHeaderIdentifier = "DEMenuHeaderCell"
    let listIdentifier = "DERegionListCell"
    let zoneIdentifier = "DETimezoneSelectCell"
    lazy var dataSouce = NSMutableArray()
    weak var delegate : regionSelectDelegate?
    var rateList : Array<Any>?
    var type = selectType.s_region
    var content : UIView!
    var bgView : UIView!
    var tableView : UITableView!
    var headView : UIView!
    var selectedIndex : Int?
    var selectedItem : String?
    let CELL_HEIGHT = 60
    override func de_setupViews() {
        setupUI()
    }
    
    func selectedIndex(index: Int) {
        selectedIndex = index
    }
    
    
    @objc func show() {
        UIApplication.shared.keyWindow?.addSubview(self)
        self.dataSouce.removeAllObjects()
        if rateList != nil && (rateList?.count ?? 0) > 0{
            parseRateList()
        } else {
            if selectedItem != nil && (selectedItem?.count ?? 0) > 0 {
                let list = FileAdapter.shareInstance.loadJsonFileWithState(state: type, isDefault: true, selectedItem: selectedItem!)
                self.dataSouce = NSMutableArray.init(array: list)
            } else if selectedIndex != nil {
                let list = FileAdapter.shareInstance.loadJsonFileWithState(state: type, isDefault: true, index: selectedIndex!)
                self.dataSouce = NSMutableArray.init(array: list)
            }else {
                let list = FileAdapter.shareInstance.loadJsonFileWithState(state: type, isDefault: false, index: 0)
                self.dataSouce = NSMutableArray.init(array: list)
            }
        }
        
        self.tableView.reloadData()
        UIView.animate(withDuration: ANIMATION_POP_INTERVAL, delay: ANIMATION_POP_DELAY, options: .curveEaseIn, animations: {
            self.bgView.backgroundColor = UIColor.init(hex: "#000000",alpha: 0.5)
            if CGFloat(self.dataSouce.count * self.CELL_HEIGHT) > CGFloat(SCREEN_HEIGHT / 2) {
                self.content.center.y -= (SCREEN_HEIGHT / 2) - CGFloat(NAVIGATION_HEGIH)  + CGFloat(TABBAR_HEIGHT)
            } else {
                self.content.center.y -= CGFloat(self.dataSouce.count * self.CELL_HEIGHT) + CGFloat(TABBAR_HEIGHT)
            }
        }, completion: nil)
        
    }
    
    @objc func hide() {
        UIView.animate(withDuration: ANIMATION_POP_INTERVAL, delay: ANIMATION_POP_DELAY, options: .curveEaseOut, animations: {
             self.bgView.backgroundColor = UIColor.init(hex: "#000000",alpha: 0.1)
            self.content.center.y = SCREEN_HEIGHT - CGFloat(NAVIGATION_HEGIH) + ((SCREEN_HEIGHT /  2 + CGFloat(TABBAR_HEIGHT)) / 2)
        }, completion: { (true) in
            self.removeFromSuperview()
        })
    }
    
    func parseRateList() {
        for i in 0 ..< rateList!.count {
            let item = rateList![i]
            if item is DECurrencyRateItem {
                (item as! DECurrencyRateItem).isDefault = ((item as! DECurrencyRateItem).currency_name == selectedItem)
                self.dataSouce.add(item)
            } else if item is DECoinItem {
                (item as! DECoinItem).isDefault = ((item as! DECoinItem).name == selectedItem)
                self.dataSouce.add(item)
            } else {
                let temp = NSMutableDictionary()
                let dict = item as? Dictionary<String, Any> ?? [:]
                if dict.count != 0 {
                    temp.addEntries(from: dict)
                }
                temp["isDefault"] = (i == selectedIndex)
               
                self.dataSouce.add(temp)
            }
            
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}



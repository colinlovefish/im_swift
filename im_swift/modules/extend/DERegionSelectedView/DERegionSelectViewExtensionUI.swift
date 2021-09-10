//
//  DERegionSelectViewExtensionUI.swift
//  coinandcoin
//
//  Created by yinghu on 2020/7/13.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

extension DERegionSelectView {
    func setupUI() {
        
        self.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        
        drawContentView()
        
        drawHeaderView()
        //        tableView
        
        drawTableView()
    }
    
    func drawContentView() {
        //        透明背景
        bgView = UIView()
        bgView.backgroundColor = UIColor.init(hex: "#000000", alpha: 0.6)
        bgView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(hide))
        bgView.addGestureRecognizer(tap)
        bgView.isUserInteractionEnabled = true
        self.addSubview(bgView)
        
        content = UIView()
        content.frame = CGRect.init(x: 0, y: SCREEN_HEIGHT - CGFloat(NAVIGATION_HEGIH) , width: SCREEN_WIDTH, height: (SCREEN_HEIGHT /  2 + CGFloat(TABBAR_HEIGHT)))
        
        self.addSubview(content)
    }
    
    func drawHeaderView() {
        headView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 60))
        headView.backgroundColor = darkBlueColor()
        
        let iconView = UIView()
        iconView.backgroundColor = lightBlueColor()
        iconView.layer.cornerRadius = 3
        iconView.layer.masksToBounds = true
        headView.addSubview(iconView)
        let headtap = UITapGestureRecognizer.init(target: self, action: #selector(hide))
        iconView.addGestureRecognizer(headtap)
        
        iconView.snp.makeConstraints { (make) in
            make.top.equalTo(headView).offset(10)
            make.centerX.equalTo(headView)
            make.width.equalTo(44)
            make.height.equalTo(6)
        }
        
        content.addSubview(headView)

    }
    
    
    func drawTableView() {
        
        self.tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.backgroundColor = darkBlueColor()
        self.tableView.bounces = false
        self.tableView.register(UINib.init(nibName: "DERegionListCell", bundle: nil), forCellReuseIdentifier: listIdentifier)
        self.tableView.register(UINib.init(nibName: "DETimezoneSelectCell", bundle: nil), forCellReuseIdentifier: zoneIdentifier)
        
        content.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(headView.snp.bottom)
            make.leading.trailing.bottom.equalTo(self.content)
        }
    }
}

//
//  DENormalTableView.swift
//  coinandcoin
//
//  Created by yinghu on 2020/8/24.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

struct cellItem {
    var identifier: String
    var nib: Bool
    var name: String
}

class DENormalTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = darkBlueColor()
        self.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    

    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension UITableView {
    public func cellNibRegister(nibName: String, identifier: String) {
        self.register(UINib.init(nibName: nibName, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    public func cellRegister(cell: AnyClass, identifier: String) {
        self.register(cell, forCellReuseIdentifier: identifier)
    }
}

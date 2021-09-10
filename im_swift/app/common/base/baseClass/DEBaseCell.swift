//
//  DEBaseCell.swift
//  coinandcoin
//
//  Created by yinghu on 2020/10/21.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

class DEBaseCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.contentView.backgroundColor = darkBlueColor()
    }
    
    func bindData<T>(_ item: inout T) {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

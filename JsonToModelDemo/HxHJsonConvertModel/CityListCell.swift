//
//  CityListCell.swift
//  HxHJsonConvertModel
//
//  Created by 张强 on 2016/11/11.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

import UIKit

class CityListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pinyinLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

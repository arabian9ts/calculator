//
//  CustomCell.swift
//  calculator
//
//  Created by arabian9ts on 2017/06/22.
//  Copyright © 2017年 arabian9ts. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var symbol: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setLabel(_ str: String) {
        symbol.text = str
    }

}

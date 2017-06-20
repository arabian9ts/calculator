//
//  CalcCell.swift
//  calculator
//
//  Created by arabian9ts on 2017/06/19.
//  Copyright © 2017年 arabian9ts. All rights reserved.
//

import UIKit

class CalcCell: UICollectionViewCell {
    
//    var val: UILabel?
    @IBOutlet weak var symbol: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ symbol: String) {
        self.symbol.text = symbol
    }
}

//
//  CalcCell.swift
//  calculator
//
//  Created by arabian9ts on 2017/06/19.
//  Copyright © 2017年 arabian9ts. All rights reserved.
//

import UIKit

class CalcCell: UICollectionViewCell {
    
    var val: UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // UILabelを生成.
        val = UILabel(frame: CGRect(x:0, y:0, width:frame.width, height:frame.height))
        
        val?.text = "nil"
        val?.textAlignment = NSTextAlignment.center
        
        // Cellに追加.
        if let subview: UILabel = val {
            self.contentView.addSubview(subview)
        }
        else{
            print("subview is nil\n")
        }
        
    }
    
}

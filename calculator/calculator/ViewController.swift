//
//  ViewController.swift
//  calculator
//
//  Created by arabian9ts on 2017/06/14.
//  Copyright © 2017年 arabian9ts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var ans: UILabel!
    @IBOutlet weak var cellview: UICollectionView!
    
    let cellstr: [String] = [
        "AC", "+/-", "%", "÷",
        "7", "8", "9", "×",
        "4", "5", "6", "-",
        "1", "2", "3", "+",
        "00", "0", ".", "="]
    
    let colors: [UIColor] = [
        UIColor.black,
        UIColor.blue,
        UIColor.brown,
        UIColor.clear,
        UIColor.cyan
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ans.backgroundColor = UIColor.black
        let layout = UICollectionViewFlowLayout()
        
        let celltop = ans.bounds.maxY
        let rect = UIScreen.main.bounds
        
        let width = rect.maxX / 4
        let height = (rect.maxY - celltop) / 5
        
        print(width)
        
        
        layout.itemSize = CGSize(width: width, height: width)
        
        
        layout.sectionInset = UIEdgeInsets(top: (height - width) * 4, left: 0, bottom: 0, right: 0);
        
        layout.headerReferenceSize = CGSize(width: 0, height: 0)
        
        cellview.register(CalcCell.self, forCellWithReuseIdentifier: "cell")
        
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        
        cellview.collectionViewLayout = layout
        
//        self.view.addSubview(cellview)
//        self.view.addSubview(ans)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /** called when the cell is selected */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
    }
    
    /** return number of cells */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }
    
    /// 横のスペース
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0.0
        
    }
    
    /// 縦のスペース
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0.0
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        
        if let ccll = cell as? CalcCell {
            ccll.val?.text = cellstr[indexPath.row]
        }
        
        cell.backgroundColor = colors[indexPath.row % colors.count]
        
        return cell;
    }
}


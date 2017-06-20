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
        UIColor.green,
        UIColor.blue,
        UIColor.brown,
        UIColor.clear,
        UIColor.cyan
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // set label's background
        ans.backgroundColor = UIColor.black
        
        // layout has collectionview
        let layout = UICollectionViewFlowLayout()
        
        // placing parameters
        let rect = UIScreen.main.bounds
        let header: CGFloat = 30;
        let size = rect.maxX / 4
        
        // set cell placement
        layout.itemSize = CGSize(width: size, height: size)
        layout.sectionInset = UIEdgeInsets(top: header, left: 0, bottom: 0, right: 0);
        
        // cell space set to zeros
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
 
        // apply layout
        //cellview.register(CalcCell.self, forCellWithReuseIdentifier: "cell")
        cellview.collectionViewLayout = layout
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /** called when the cell is selected */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print(collectionView.bounds.maxY)
    }
    
    /** return number of cells */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }
    
    /** space width */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0.0
        
    }
    
    /** space height */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0.0
        
    }

    /** cell setting */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        
        if let ccll = cell as? CalcCell {
//            ccll.val?.text = cellstr[indexPath.row]
            ccll.setup(cellstr[indexPath.row])
        }
        
        cell.backgroundColor = colors[indexPath.row % colors.count]
        
        return cell;
    }
}


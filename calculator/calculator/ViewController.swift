//
//  ViewController.swift
//  calculator
//
//  Created by arabian9ts on 2017/06/14.
//  Copyright © 2017年 arabian9ts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        
//        layout.itemSize = CGSize(wifth: 90, height: 90)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /** called when the cell is selected */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    /** return number of cells */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 19;
    }
    
    /** set val in the cells */
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//    }


}


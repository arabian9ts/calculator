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
    
    var first: Double! = 0.0
    var second: Double! = 0.0
    var last_symbol: String! = ""
    
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
        ans.textColor = UIColor.white
        ans.text = "0"
        
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
        
        // regist xib and set layout on cellview
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        cellview.register(nib, forCellWithReuseIdentifier: "custom")
        cellview.collectionViewLayout = layout
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func format(_ number: Double) -> String {
        var formed: String = ""
        
        if number - Double(Int(number)) == 0{
            formed = String(Int(number))
        }
        else{
            formed = String(number)
        }
        
        return formed
    }
    
    func reset() -> Void {
        second = 0.0
        ans.text = format(first)
    }
    
    func calculate(_ command: String) -> Double {
        switch command {
        case "+":
            return first + second
        case "-":
            return first - second
        case "×":
            return first * second
        case "÷":
            return first / second
        default:
            return second
        }
    }
    
    /** called when the cell is selected */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch cellstr[indexPath.row] {
            
        case "+", "-", "×", "÷":
            first = calculate(last_symbol)
            reset()
            last_symbol = cellstr[indexPath.row]
            print("first is \(first)")
            
        case "=":
            ans.text = String(0)
            first = 0.0
            second = 0.0
            last_symbol = ""
            
        default:
            let linked: Double! = Double(format(second) + cellstr[indexPath.row])
            ans.text = format(linked)
            second = linked
        }
        
    }
    
    /** return number of cells */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }

    /** cell setting */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "custom", for: indexPath) as! CustomCell
        
        cell.setLabel(cellstr[indexPath.row])
        
        cell.backgroundColor = colors[indexPath.row % colors.count]
        
        return cell;
    }
}


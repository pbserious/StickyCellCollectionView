//
//  ViewController.swift
//  StickyCellCollectionView
//
//  Created by Rattee Wariyawutthiwat on 4/4/2560 BE.
//  Copyright © 2560 Rattee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let count = 30
    @IBOutlet weak var collectionView:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let layout = collectionView.collectionViewLayout as? StickyCellFlowLayout {
            layout.stickyIndexPath = []
            for index in 0..<count {
                if index % 4 == 0 {
                    layout.stickyIndexPath.append(IndexPath(row: index, section: 0))
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomGreen:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomBlue:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        if indexPath.row % 4 == 0 {
            cell.backgroundColor = getRandomColor()
        } else {
            cell.backgroundColor = UIColor.red
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    /*override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 40)
    }*/
}


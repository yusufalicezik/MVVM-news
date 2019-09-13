//
//  MainViewController.swift
//  MVVM-Weather
//
//  Created by Yusuf ali cezik on 13.09.2019.
//  Copyright © 2019 Yusuf Ali Cezik. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    

 

}
extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? WeatherCollectionViewCell else {return UICollectionViewCell()}
        cell.parentView.layer.cornerRadius = 16
        cell.parentView.layer.masksToBounds = true

        return cell
    }
    
    
}
extension MainViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.view.frame
        return CGSize(width: size.width, height: self.collectionView.frame.height)
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(bitPattern: 0)
    }
}
extension MainViewController : UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let indx =  self.collectionView.indexPathsForVisibleItems
        for i in indx{
            let index = i.row
            print(index)
        }
    }
   
}


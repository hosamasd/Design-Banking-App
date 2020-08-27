//
//  FriendsCollectionVC.swift
//  Design Banking App
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class FriendsCollectionVC: BaseCollectionVCS {
    
    fileprivate let cellId = "cellId"
    let imgs = ["img2" , "img2", "img3" , "img1"]

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return imgs.count
       }
       
     override  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! FriendCollectionViewCell
           if indexPath.row == 0{
               cell.addView.isHidden = false
           } else {
               cell.addView.isHidden = true
           }
           cell.imageView.image = UIImage(named: imgs[indexPath.row])
           return cell
       }
       
      override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 100, height: 100)
       }
       
      override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           
           let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, +50, 0, 0)
           cell.layer.transform = rotationTransform
           cell.alpha = 0
           UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
               cell.layer.transform = CATransform3DIdentity
               cell.alpha = 1.0
           }, completion: nil)
           
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 20
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 20
       }
    
    override func setupCollection() {
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        collectionView.backgroundColor = CustomColors.appBackground
        collectionView.register(FriendCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    
}

//
//  CustomCardsCollectionVC.swift
//  Design Banking App
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class CustomCardsCollectionVC: BaseCollectionVCS {
    
    let data:[CustomCards] = [
             CustomCards(img: "img4", cardBackground: CustomColors.appPurple, cardNumber: "• • • • 0202", amount: "$12,000"),
             CustomCards(img: "img5", cardBackground: CustomColors.appRed, cardNumber: "• • • • 0605", amount: "$23,000"),
         ]
    
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return data.count
       }
       
     override  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCardCollectionViewCell", for: indexPath) as! CustomCardCollectionViewCell
           cell.data = data[indexPath.row]
           return cell
       }
       
     override  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           
           let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, +50, 0, 0)
           cell.layer.transform = rotationTransform
           cell.alpha = 0
           UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
               cell.layer.transform = CATransform3DIdentity
               cell.alpha = 1.0
           }, completion: nil)
           
       }
       
      override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 210, height: 310)
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 25
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 25
       }
    
    override func setupCollection() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
                         layout.scrollDirection = .horizontal
                     }
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        collectionView.backgroundColor = CustomColors.appBackground
        collectionView.register(CustomCardCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCardCollectionViewCell")
    }
}

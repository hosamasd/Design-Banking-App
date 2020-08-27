//
//  HomeCollectionVC.swift
//  Design Banking App
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class HomeCollectionVC: BaseCollectionVCS {
    
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddCardCollectionViewCell", for: indexPath) as! AddCardCollectionViewCell
            return cell
        }
        if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardsCollectionViewCell", for: indexPath) as! CardsCollectionViewCell
            return cell
        }
        if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardDetailsCollectionViewCell", for: indexPath) as! CardDetailsCollectionViewCell
            return cell
        }
        if indexPath.row == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsCollectionViewCell", for: indexPath) as! FriendsCollectionViewCell
            return cell
        }
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.frame.width, height: 80)
        }
        if indexPath.row == 1 {
            return CGSize(width: collectionView.frame.width, height: 350)
        }
        if indexPath.row == 2 {
            return CGSize(width: collectionView.frame.width, height: 140)
        }
        if indexPath.row == 3 {
            return CGSize(width: collectionView.frame.width, height: 160)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func setupCollection() {
      
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset.top = 60
        collectionView.backgroundColor = CustomColors.appBackground
        collectionView.register(AddCardCollectionViewCell.self, forCellWithReuseIdentifier: "AddCardCollectionViewCell")
        collectionView.register(CardsCollectionViewCell.self, forCellWithReuseIdentifier: "CardsCollectionViewCell")
        collectionView.register(CardDetailsCollectionViewCell.self, forCellWithReuseIdentifier: "CardDetailsCollectionViewCell")
        collectionView.register(FriendsCollectionViewCell.self, forCellWithReuseIdentifier: "FriendsCollectionViewCell")
    }
}

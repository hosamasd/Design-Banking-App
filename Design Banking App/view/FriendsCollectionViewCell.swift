//
//  FriendsCollectionViewCell.swift
//  Design Banking App
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class FriendsCollectionViewCell: BaseCollectionCell {
    
    
    lazy var titleLabel = UILabel(text: "Friends", font:  UIFont(name: "Avenir-Medium", size: 24), textColor: .white)
    
    lazy var friendsCollectionVC:FriendsCollectionVC = {
        let cv = FriendsCollectionVC()
        
        return cv
    }()
    
    override func setupViews() {
        addSubViews(views: titleLabel,friendsCollectionVC.view)
        
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 10, left: 30, bottom: 0, right: 0))

        friendsCollectionVC.view.fillSuperview(padding: .init(top: 0, left: 50, bottom: 18, right: 0))
        
        self.titleLabel.center.x += 50
        self.titleLabel.alpha = 0
        
        setUpAnimation()
    }
    
    func setUpAnimation(){
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            
            self.titleLabel.alpha = 1
            self.titleLabel.center.x -= 50
            
        }, completion: nil)
        
    }
}

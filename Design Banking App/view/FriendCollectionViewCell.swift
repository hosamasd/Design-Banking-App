//
//  FriendCollectionViewCell.swift
//  Design Banking App
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//


import UIKit

class FriendCollectionViewCell: BaseCollectionCell {
    
    lazy var imageView:UIImageView = {
        let img = UIImageView(image: UIImage(named: "img3"))
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false

        return img
    }()
    
    lazy var addView:UIView = {
        let v = UIView(backgroundColor: CustomColors.stoneGray)
        v.layer.cornerRadius = 18
        v.translatesAutoresizingMaskIntoConstraints = false

        return v
    }()
    
    lazy var addImage:UIImageView = {
        let img = UIImageView(image:  UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate))
        img.tintColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    override func setupViews() {
        addSubViews(views: imageView,addView,addImage)
        
        imageView.fillSuperview()
        addView.fillSuperview()
        
        NSLayoutConstraint.activate([
            addImage.centerYAnchor.constraint(equalTo: addView.centerYAnchor),
            addImage.centerXAnchor.constraint(equalTo: addView.centerXAnchor),
        ])
    }
}

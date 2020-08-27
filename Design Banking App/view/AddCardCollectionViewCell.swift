//
//  AddCardCollectionViewCell.swift
//  Design Banking App
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class AddCardCollectionViewCell: BaseCollectionCell {
    
    lazy var userImage:UIImageView = {
        let img = UIImageView(image: UIImage(named: "img1"))
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 15
        return img
    }()
    
     lazy var userDescription:UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string:"Xian Zhou\n" , attributes:[NSAttributedString.Key.font: UIFont(name: "Avenir-Heavy", size: 20)!])
        attributedText.append(NSAttributedString(string: "zhou@hddcbank" , attributes:
            [NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 15)!, NSAttributedString.Key.foregroundColor: CustomColors.linkBlue]))
        l.attributedText = attributedText
        return l
    }()
    
     lazy var addCardButton:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .white
        btn.setTitle("  Add card", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 16)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = CustomColors.stoneGray
        btn.layer.cornerRadius = 15
        return btn
    }()
    
    override func setupViews() {
        
    }
}

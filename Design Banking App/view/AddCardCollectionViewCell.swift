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
        img.constrainWidth(constant: 60)
        img.constrainHeight(constant: 60)
        img.translatesAutoresizingMaskIntoConstraints=false
        return img
    }()
    
     lazy var userDescription:UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string:"Xian Zhou\n" , attributes:[NSAttributedString.Key.font: UIFont(name: "Avenir-Heavy", size: 20)!])
        attributedText.append(NSAttributedString(string: "zhou@hddcbank" , attributes:
            [NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 15)!, NSAttributedString.Key.foregroundColor:CustomColors.linkBlue]))//
        l.attributedText = attributedText
        return l
    }()
    
     lazy var addCardButton:UIButton = {
        let btn = UIButton()
//        btn.isHide(true)
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.setImage(UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .white
        btn.setTitle("  Add card  ", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 16)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = CustomColors.stoneGray
        btn.layer.cornerRadius = 15
//        btn.constrainWidth(constant: 140)
        btn.constrainHeight(constant: 60)
        return btn
    }()
    
    override func setupViews() {
        addSubViews(views: userImage,userDescription,addCardButton)
        
        userImage.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 0, left: 30, bottom: 0, right: 0))
        userDescription.anchor(top: nil, leading: userImage.trailingAnchor , bottom: nil, trailing: addCardButton.leadingAnchor ,padding: .init(top: 0, left: 15, bottom: 0, right: -20))
        addCardButton.anchor(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 30))

        NSLayoutConstraint.activate([
                   userImage.centerYAnchor.constraint(equalTo: centerYAnchor),
                   userDescription.centerYAnchor.constraint(equalTo: centerYAnchor),
                   addCardButton.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])

        
        self.userImage.alpha = 0
               self.userImage.center.x += 50

               self.userDescription.alpha = 0
               self.userDescription.center.x += 50

               self.addCardButton.alpha = 0
               self.addCardButton.center.x += 50
               
               setUpAnimation()
    }
    
    func setUpAnimation(){
           UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
               self.userImage.alpha = 1
               self.userImage.center.x -= 50
           }, completion: nil)
           
           UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
               self.userDescription.alpha = 1
               self.userDescription.center.x -= 50
           }, completion: nil)
           
           UIView.animate(withDuration: 1, delay: 0.4, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
               self.addCardButton.alpha = 1
               self.addCardButton.center.x -= 50
           }, completion: nil)
       }
}

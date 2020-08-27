//
//  CustomCardCollectionViewCell.swift
//  Design Banking App
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class CustomCardCollectionViewCell: BaseCollectionCell {
    
    var data:CustomCards?{
        didSet {
            manageData()
        }
    }
    
    lazy var cardView:UIView = {
        let v = UIView(backgroundColor: .red)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        v.layer.cornerRadius = 30
//        v.constrainWidth(constant: 160)
//        v.constrainHeight(constant: 70)
        return v
    }()
    
    lazy var expView:UIView = {
        let v = UIView(backgroundColor: .white)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 20
        v.constrainWidth(constant: 160)
        v.constrainHeight(constant: 70)
        return v
    }()
    
    lazy var cardLogoImage:UIImageView = {
        let img = UIImageView(image: UIImage(named: "img4"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.constrainWidth(constant: 40)
        img.constrainHeight(constant: 40)
        return img
    }()
    
    lazy var expLabel:UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string:"Month / year\n" , attributes:[NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 12)!])
        attributedText.append(NSAttributedString(string: "06 / 20" , attributes:
            [NSAttributedString.Key.font: UIFont(name: "Avenir-Heavy", size: 16)!, NSAttributedString.Key.foregroundColor: CustomColors.appBackground]))
        l.attributedText = attributedText
        return l
    }()
    
    lazy var amountLabel = UILabel(text: "", font: UIFont(name: "Futura-Medium", size: 35), textColor: .white)
    
    lazy var accountNumberLabel = UILabel(text: "", font: UIFont(name: "Avenir-Heavy", size: 17), textColor: .white)
    
    override func setupViews() {
        [amountLabel,accountNumberLabel,expLabel].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        addSubViews(views: cardView)
        
        cardView.fillSuperview()
        
        cardView.addSubViews(views: expView,accountNumberLabel,amountLabel)
        expView.addSubViews(views: cardLogoImage,expLabel)
        
        expView.anchor(top: cardView.topAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 30, left: 0, bottom: 0, right: 00))
        cardLogoImage.anchor(top: nil, leading: expView.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 0, left: 15, bottom: 0, right: 00))
        expLabel.anchor(top: nil, leading: cardLogoImage.trailingAnchor, bottom: nil, trailing: expView.trailingAnchor,padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        accountNumberLabel.anchor(top: nil, leading: cardView.leadingAnchor, bottom: amountLabel.topAnchor, trailing: nil,padding: .init(top: 0, left: 30, bottom: 5, right: 0))
        amountLabel.anchor(top: nil, leading: cardView.leadingAnchor, bottom: cardView.bottomAnchor, trailing: nil,padding: .init(top: 0, left: 30, bottom: 60, right: 0))
        
        NSLayoutConstraint.activate([
            expView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            cardLogoImage.centerYAnchor.constraint(equalTo: expView.centerYAnchor),
            expLabel.centerYAnchor.constraint(equalTo: expView.centerYAnchor),
        ])
    }
    
    func manageData(){
        guard let data = data else {return}
        cardView.backgroundColor = data.cardBackground
        cardLogoImage.image = UIImage(named: data.img)
        accountNumberLabel.text = data.cardNumber
        amountLabel.text = data.amount
    }
    
}

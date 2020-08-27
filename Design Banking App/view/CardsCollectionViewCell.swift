//
//  CardsCollectionViewCell.swift
//  Design Banking App
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class CardsCollectionViewCell: BaseCollectionCell {
    
    lazy var titleLabel = UILabel(text: "Card details", font:  UIFont(name: "Avenir-Medium", size: 24), textColor: .white)
    
    lazy var stackView:UIStackView = {
        let sv = getStack(views: incomeView,expenseView, spacing: 10, distribution: .fillEqually, axis: .horizontal)
        sv.constrainHeight(constant: 60)
        return sv
    }()
    
    lazy var incomeView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.addSubViews(views: incomeImage,incomeLabel)
        return v
    }()
    
    lazy var incomeImage:UIImageView = {
        let img = UIImageView(image: UIImage(named: "arrowDown"))
        img.translatesAutoresizingMaskIntoConstraints = false
        
        img.layer.cornerRadius = 15
        img.contentMode = .scaleAspectFill
        img.backgroundColor = CustomColors.stoneGray
        img.constrainWidth(constant: 60)
        img.constrainHeight(constant: 60)
        img.clipsToBounds = true
        return img
    }()
    
    lazy var incomeLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        
        l.textColor = .lightGray
        l.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string:"Income\n" , attributes:[NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 12)!])
        attributedText.append(NSAttributedString(string: "$5,600" , attributes:
            [NSAttributedString.Key.font: UIFont(name: "Avenir-Heavy", size: 19)!, NSAttributedString.Key.foregroundColor: UIColor.white]))
        l.attributedText = attributedText
        return l
    }()
    
    lazy var expenseView:UIView = {
        let v = UIView()
        v.addSubViews(views: expenseImage,expenseLabel)
        
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var expenseImage:UIImageView = {
        let img = UIImageView(image: UIImage(named: "arrowUp"))
        img.translatesAutoresizingMaskIntoConstraints = false
        
        img.layer.cornerRadius = 15
        img.contentMode = .scaleAspectFill
        img.backgroundColor = CustomColors.stoneGray
        img.clipsToBounds = true
        img.constrainWidth(constant: 60)
        img.constrainHeight(constant: 60)
        return img
    }()
    
    lazy var expenseLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .lightGray
        l.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string:"Expense\n" , attributes:[NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 12)!])
        attributedText.append(NSAttributedString(string: "$1,200" , attributes:
            [NSAttributedString.Key.font: UIFont(name: "Avenir-Heavy", size: 19)!, NSAttributedString.Key.foregroundColor: UIColor.white]))
        l.attributedText = attributedText
        return l
    }()
    
    
    override func setupViews() {
        addSubViews(views: titleLabel,stackView)
        
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 10, left: 30, bottom: 0, right: 0))
        stackView.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 20, left: 30, bottom: 0, right: 30))
        incomeImage.anchor(top: nil, leading: incomeView.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 20, left: 30, bottom: 0, right: 30))
        incomeLabel.anchor(top: nil, leading: incomeImage.trailingAnchor, bottom: nil, trailing: incomeView.trailingAnchor,padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        incomeImage.anchor(top: nil, leading: expenseView.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 20, left: 0, bottom: 0, right: 30))
        incomeLabel.anchor(top: nil, leading: expenseImage.trailingAnchor, bottom: nil, trailing: expenseView.trailingAnchor,padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        
        NSLayoutConstraint.activate([
            incomeImage.centerYAnchor.constraint(equalTo: incomeView.centerYAnchor),
            incomeLabel.centerYAnchor.constraint(equalTo: incomeView.centerYAnchor),
            expenseImage.centerYAnchor.constraint(equalTo: expenseView.centerYAnchor),
            expenseLabel.centerYAnchor.constraint(equalTo: expenseView.centerYAnchor)
        ])
        
        
        self.titleLabel.alpha = 0
        self.titleLabel.center.x += 50
        
        self.incomeImage.alpha = 0
        self.incomeImage.center.x += 50
        self.incomeLabel.alpha = 0
        self.incomeLabel.center.x += 80
        
        self.expenseImage.alpha = 0
        self.expenseImage.center.x += 50
        self.expenseLabel.alpha = 0
        self.expenseLabel.center.x += 80
        
        setUpAnimation()
    }
    
    func setUpAnimation(){
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            
            self.titleLabel.alpha = 1
            self.titleLabel.center.x -= 50
            
            self.incomeImage.alpha = 1
            self.incomeImage.center.x -= 50
            self.incomeLabel.alpha = 1
            self.incomeLabel.center.x -= 80
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.expenseImage.alpha = 1
            self.expenseImage.center.x -= 50
            self.expenseLabel.alpha = 1
            self.expenseLabel.center.x -= 80
        }, completion: nil)
        
    }
}

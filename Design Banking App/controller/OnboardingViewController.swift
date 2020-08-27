//
//  ViewController.swift
//  Design Banking App
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    lazy var coloredLogoImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "coloredLogo")
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.constrainHeight(constant: 450)
        img.constrainWidth(constant: 450)
        return img
    }()
    
    lazy var stoneImage:UIImageView = {
        let img = UIImageView(image: UIImage(named: "bottomStone"))
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        img.constrainHeight(constant: 200)
        img.constrainWidth(constant: 200)
        return img
    }()
    
    lazy var logoImage:UIImageView = {
        let img = UIImageView(image:  UIImage(named: "logo"))
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.constrainHeight(constant: 70)
        img.constrainWidth(constant: 70)
        return img
    }()
    
    lazy var bankingLabel = UILabel(text: "banking", font: UIFont(name: "AvenirNext-Medium", size: 35), textColor: .white)
    
    lazy var descriptionLabel = UILabel(text: "Get your daily banking process with in your mobile easily and safely.", font:  UIFont(name: "AvenirNext-Medium", size: 20), textColor: .white, textAlignment: .left, numberOfLines: 0)
    
    lazy var getStartedBtn:UIButton = {
        let btn = UIButton()
        btn.layer.borderColor = CustomColors.stoneGray.cgColor
        btn.layer.borderWidth = 1.5
        btn.layer.cornerRadius = 20
        btn.setImage(UIImage(named: "arrow")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .white
        btn.addTarget(self, action: #selector(getStartedBtnPressed), for: .touchUpInside)
        btn.constrainHeight(constant: 65)
        btn.constrainWidth(constant: 65)
        return btn
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        makeSomeChanges()
    }
    
    func setupViews()  {
        view.backgroundColor = CustomColors.appBackground
        
        view.addSubViews(views: coloredLogoImage,stoneImage,logoImage,bankingLabel,descriptionLabel,getStartedBtn)
        
        coloredLogoImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 0, left: 100, bottom: 0, right: 0))
        stoneImage.anchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 15, right: 130))
        logoImage.anchor(top: nil, leading: view.leadingAnchor, bottom: bankingLabel.topAnchor, trailing: nil,padding: .init(top: 0, left: 50, bottom: 20, right: 0))
        bankingLabel.anchor(top: nil, leading: view.leadingAnchor, bottom: descriptionLabel.topAnchor, trailing: nil,padding: .init(top: 0, left: 50, bottom: 15, right: 0))
        descriptionLabel.anchor(top: nil, leading: view.leadingAnchor, bottom: getStartedBtn.topAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 50, bottom: 20, right: 50))
        getStartedBtn.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: nil,padding: .init(top: 0, left: 50, bottom: 20, right: 0))
        
    }
    
    func makeSomeChanges()  {
        [coloredLogoImage,stoneImage,logoImage,descriptionLabel,bankingLabel,getStartedBtn].forEach({$0.alpha = 0})
        self.coloredLogoImage.transform = self.coloredLogoImage.transform.rotated(by: .pi / 3)
        
        self.stoneImage.transform = .init(scaleX: 0.5, y: 0.5)
        
        logoImage.transform = logoImage.transform.rotated(by: -.pi / 3)
        
        descriptionLabel.center.y += 50
        
        bankingLabel.center.y += 50
        
        
        setUpAnimations()
    }
    
    func setUpAnimations(){
        
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.coloredLogoImage.alpha = 1
            self.coloredLogoImage.center.x -= 300
            self.coloredLogoImage.transform = self.coloredLogoImage.transform.rotated(by: -.pi / 3)
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.stoneImage.alpha = 1
            self.stoneImage.transform = .identity
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.8, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.logoImage.alpha = 1
            self.logoImage.center.y -= 50
            self.logoImage.transform = self.logoImage.transform.rotated(by: +.pi / 3)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.6, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.bankingLabel.alpha = 1
            self.bankingLabel.center.y -= 50
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.64, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.descriptionLabel.alpha = 1
            self.descriptionLabel.center.y -= 50
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.7, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.getStartedBtn.alpha = 1
        }, completion: nil)
    }
    
    
    
    @objc func getStartedBtnPressed(){
        
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.coloredLogoImage.alpha = 0
            self.coloredLogoImage.center.x -= 400
            self.coloredLogoImage.transform = self.coloredLogoImage.transform.rotated(by: -.pi / 3)
        }, completion: nil)
        
                   let VC = HomeViewController()
                   let navVC = UINavigationController(rootViewController: VC)
                   navVC.modalPresentationStyle = .custom
                   navVC.transitioningDelegate = self
                   self.present(navVC, animated: true, completion: nil)
    }
    
}

extension OnboardingViewController: UIViewControllerTransitioningDelegate{
    
}


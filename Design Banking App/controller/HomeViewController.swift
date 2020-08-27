//
//  HomeViewController.swift
//  Design Banking App
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//


import UIKit

class HomeViewController: UIViewController {

    lazy var homeCollectionVC:HomeCollectionVC = {
        let cv = HomeCollectionVC()
        return cv
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setUpNavigationBar()
    }
    
    func setupViews()  {
        view.backgroundColor = CustomColors.appBackground
        view.addSubview(homeCollectionVC.view)
        homeCollectionVC.view.fillSuperview()
    }
    
    func setUpNavigationBar(){
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor = CustomColors.appBackground
    }
    
}

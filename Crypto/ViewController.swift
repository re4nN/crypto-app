//
//  ViewController.swift
//  Crypto
//
//  Created by Ryan Rouxinol on 21/08/24.
//

import UIKit


class ViewController: UIViewController {
    private let wishlistNotifications = WishlistNotifications()
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.bgDarkModeAsset
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var cryptoIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoApp")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        wishlistNotifications.checkForPermission()
    }
    
    private func setupView(){
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        view.addSubview(backgroundView)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cryptoIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            cryptoIcon.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            cryptoIcon.heightAnchor.constraint(equalToConstant: 45),
            cryptoIcon.widthAnchor.constraint(equalToConstant: 180),
        ])
         }
}


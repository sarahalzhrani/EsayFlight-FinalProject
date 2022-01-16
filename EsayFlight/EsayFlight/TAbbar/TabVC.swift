//
//  TabVC.swift
//  EsayFlight
//
//  Created by sara al zhrani on 24/04/1443 AH.
//


import UIKit

class TabBarVC : UITabBarController {
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        rootViewController.navigationItem.title = title
        return navController
    }
    func setupVCs() {
        
        viewControllers = [
            
            
            createNavController(for:Home(), title: NSLocalizedString("Home", comment: "Esay Flight"), image: UIImage(systemName: "house")!),
            createNavController(for:MapController(), title: NSLocalizedString("Maps", comment: ""), image: UIImage(systemName: "location")!),
            createNavController(for:ViewController(), title: NSLocalizedString("Sitting", comment: ""), image: UIImage(systemName: "gearshape")!),
        ]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemGray6
        tabBar.tintColor = .label
        tabBarItem.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        
        setupVCs()
        view.isUserInteractionEnabled = true
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 70
        tabBar.frame.origin.y = view.frame.height - 70
    }
    
    

}


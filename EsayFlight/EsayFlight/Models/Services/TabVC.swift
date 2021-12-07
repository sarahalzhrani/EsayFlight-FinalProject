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
//        navController.navigationBar.prefersLargeTitles = true
//        rootViewController.navigationItem.title = title
        return navController
    }
    func setupVCs() {
        
        viewControllers = [
            
            
            createNavController(for:Home(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for:Location (), title: NSLocalizedString("Maps", comment: ""), image: UIImage(systemName: "location")!),
            createNavController(for:profiel(), title: NSLocalizedString("profile", comment: ""), image: UIImage(systemName: "person")!),
            createNavController(for:Advertisement(), title: NSLocalizedString("Advertisement", comment: ""), image: UIImage(systemName: "seal")!),
//            createNavController(for:ProfileVC(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!),
        ]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemGray6
        tabBar.tintColor = .label
        setupVCs()
        view.isUserInteractionEnabled = true
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
            swipeLeft.direction = .right
            self.view.addGestureRecognizer(swipeLeft)
    }
    
    
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
       if gesture.direction == .right{
           present(
               UINavigationController(rootViewController: FreeWIfi()),
               animated: true,
               completion: nil
           )
       }
}
}

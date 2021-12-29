//
//  ViewController.swift
//  EsayFlight
//
//  Created by sara al zhrani on 25/05/1443 AH.
//

import UIKit

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewuser(){
        let vc = WelcomeViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    }
    
}

class Core {
    
    static let shared = Core()
    func isNewuser()-> Bool {
        
        return !UserDefaults.standard.bool(forKey: "isNewuser")
    }
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: "isNewuser")
    }
    
}

//
//  FreeWIfi.swift
//  EsayFlight
//
//  Created by sara al zhrani on 24/04/1443 AH.
//

import UIKit

class FreeWIfi: UIViewController{
    
    var imageView: UIImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "123456")
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = .systemGray6
        
        view.addSubview(imageView)
      
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    
    
    
}

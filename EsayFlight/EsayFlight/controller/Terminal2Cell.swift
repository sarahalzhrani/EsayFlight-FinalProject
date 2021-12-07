//
//  Terminal2Cell.swift
//  EsayFlight
//
//  Created by sara al zhrani on 23/04/1443 AH.
//

import UIKit

class Terminal2Cell : UICollectionViewCell{
    
    static let identifier = "Terminal2Cell"
    

    
    var imageView1: UIImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "")
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView1)
       
        imageView1.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView1.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView1.heightAnchor.constraint(equalToConstant: 160).isActive = true
        imageView1.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}



//
//  Terminal1Cell.swift
//  EsayFlight
//
//  Created by sara al zhrani on 23/04/1443 AH.
//

import UIKit

class Terminal1Cell : UICollectionViewCell{
    
    static let identifier = "Terminal1Cell"
    

    
    var imageView: UIImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "")
      imageView.layer.masksToBounds = true
      imageView.layer.cornerRadius = 12
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    
    let resturantNameble: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.addSubview(resturantNameble)
        
        
        
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 15).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.widthAnchor.constraint(equalToConstant:90).isActive = true
        
        resturantNameble.topAnchor.constraint(equalTo: self.topAnchor,constant: 110).isActive = true
        resturantNameble.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
   
       
   
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
}


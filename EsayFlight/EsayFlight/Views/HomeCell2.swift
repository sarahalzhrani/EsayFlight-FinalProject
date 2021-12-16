//
//  HomeCell2.swift
//  EsayFlight
//
//  Created by sara al zhrani on 05/05/1443 AH.
//
import UIKit

class HomeCell2 : UICollectionViewCell{
    
    static let identifier = "HomeCell2"
    
    
    
  
    
    var imageView2: UIImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "")
//      imageView.contentMode = .scaleAspectFit
        
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView2)
        
        imageView2.topAnchor.constraint(equalTo: self.topAnchor,constant: 10).isActive = true
        imageView2.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 50).isActive = true
        imageView2.heightAnchor.constraint(equalToConstant: 190).isActive = true
        imageView2.widthAnchor.constraint(equalToConstant: 200).isActive = true

   
    
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}

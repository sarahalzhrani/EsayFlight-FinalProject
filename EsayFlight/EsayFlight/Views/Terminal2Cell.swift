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
        imageView.layer.masksToBounds = true
      imageView.layer.cornerRadius = 12
      return imageView
    }()
    
    
    let resturantNameble1: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textColor = .black
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView1)
        self.addSubview(resturantNameble1)
       
        
        
        
        
        imageView1.topAnchor.constraint(equalTo: self.topAnchor,constant: 15).isActive = true
        imageView1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        imageView1.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView1.widthAnchor.constraint(equalToConstant:90).isActive = true
        
        resturantNameble1.topAnchor.constraint(equalTo: self.topAnchor,constant: 110).isActive = true
        resturantNameble1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
//        imageView1.topAnchor.constraint(equalTo: self.topAnchor,constant: 15).isActive = true
//        imageView1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
//        imageView1.heightAnchor.constraint(equalToConstant: 90).isActive = true
//        imageView1.widthAnchor.constraint(equalToConstant:90).isActive = true
//
//        resturantNameble1.topAnchor.constraint(equalTo: self.topAnchor,constant: 110).isActive = true
//        resturantNameble1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
   
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}



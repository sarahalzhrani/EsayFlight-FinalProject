//
//  HomeCell.swift
//  EsayFlight
//
//  Created by sara al zhrani on 19/04/1443 AH.
//

import UIKit

class HomeCell : UICollectionViewCell{
    
    static let identifier = "HomeCell"
    
    
    
    let namelable: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageView: UIImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "")
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.addSubview(namelable)
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 10).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: 10).isActive = true

        namelable.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        namelable.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        namelable.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 15).isActive = true
//        namelable.heightAnchor.constraint(equalToConstant: 15).isActive = true
//        namelable.widthAnchor.constraint(equalToConstant: 30).isActive = true

   
    
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}

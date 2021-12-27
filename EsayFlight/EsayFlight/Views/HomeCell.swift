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
//      imageView.layer.cornerRadius = 12
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    let namelable2: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.addSubview(namelable)
        self.addSubview(namelable2)


        imageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 15).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.widthAnchor.constraint(equalToConstant:90).isActive = true
        
        namelable.topAnchor.constraint(equalTo: self.topAnchor,constant: 110).isActive = true
        namelable.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
   
        namelable2.topAnchor.constraint(equalTo: namelable.bottomAnchor,constant: 2).isActive = true
        namelable2.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}

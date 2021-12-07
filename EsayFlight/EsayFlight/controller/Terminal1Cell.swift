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
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
       
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        imageView.frame = CGRect(x: 1,
//                    y: 10 ,
//                    width: 160,
//                    height: 160)
////        myLabel.frame = CGRect(x: 5,
////                    y: contentView.frame.size.height-50 ,
////                    width: contentView.frame.size.width-10,
////                    height: 50)
//      }
    
}


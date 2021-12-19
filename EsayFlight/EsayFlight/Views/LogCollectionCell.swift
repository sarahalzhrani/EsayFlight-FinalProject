//
//  LogCollectionCell.swift
//  EsayFlight
//
//  Created by sara al zhrani on 07/05/1443 AH.
//

import UIKit

class LOgCEllCell: UICollectionViewCell {

    static let identifier = "LOgCEllCell"
    
    
    let imagecell = UIImageView()
    var line = UIView()
//    var view1 = UIView()
    
    let CitylabelA: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .gray
        label.font = label.font.withSize(16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let timelabelA: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .gray
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    


    let fightnumberlabelA: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .gray
        label.font = label.font.withSize(16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let image1A: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "air")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let image2A: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "clock")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let tOlabelA: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("To", comment:"")
        label.textColor = .gray
//        UIColor(red: 47/255, green: 79/255, blue: 79/250, alpha: 2)
        label.font = label.font.withSize(25)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(CitylabelA)
        self.addSubview(timelabelA)
        self.addSubview(fightnumberlabelA)
        self.addSubview(image1A)
        self.addSubview(image2A)
        self.addSubview(tOlabelA)
        self.addSubview(imagecell)
        self.addSubview(line)
        
        self.backgroundColor = .white
        imagecell.image = UIImage(named: "air1")
        imagecell.layer.masksToBounds = true
        imagecell.contentMode = .scaleAspectFit

           NSLayoutConstraint.activate([imagecell.leftAnchor.constraint(equalTo: leftAnchor),
           imagecell.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
           imagecell.heightAnchor.constraint(equalToConstant: 80),
           imagecell.widthAnchor.constraint(equalTo: imagecell.heightAnchor,multiplier: 100/100)])
           imagecell.translatesAutoresizingMaskIntoConstraints = false

        line = UIView(frame: CGRect(x: 30, y: 120, width: 350, height:1))
        line.backgroundColor = .white
        line.layer.cornerRadius = 10
       
     
       
        
        
        timelabelA.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        timelabelA.topAnchor.constraint(equalTo: self.topAnchor,constant: 90).isActive = true
        timelabelA.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 220).isActive = true
        timelabelA.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true

        CitylabelA.topAnchor.constraint(equalTo: tOlabelA.bottomAnchor,constant: 10).isActive = true
        CitylabelA.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 90).isActive = true
        CitylabelA.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16).isActive = true

        

        
        fightnumberlabelA.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        fightnumberlabelA.topAnchor.constraint(equalTo:  self.topAnchor,constant: 90).isActive = true
        fightnumberlabelA.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 110).isActive = true
        fightnumberlabelA.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true
                
        
        
        image1A.topAnchor.constraint(equalTo: self.topAnchor,constant: 90).isActive = true
        image1A.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 85).isActive = true
        image1A.heightAnchor.constraint(equalToConstant: 15).isActive = true
        image1A.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        image2A.topAnchor.constraint(equalTo: self.topAnchor,constant: 90).isActive = true
        image2A.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 200).isActive = true
        image2A.heightAnchor.constraint(equalToConstant: 15).isActive = true
        image2A.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        tOlabelA.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tOlabelA.topAnchor.constraint(equalTo:  self.topAnchor,constant: 15).isActive = true
        tOlabelA.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:90).isActive = true
        tOlabelA.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true

        self.layer.cornerRadius = 25.0
        self.layer.borderWidth = 25
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
       
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}



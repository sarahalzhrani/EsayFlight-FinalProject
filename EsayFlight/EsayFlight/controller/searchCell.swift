//
//  searchCell.swift
//  EsayFlight
//
//  Created by sara al zhrani on 20/04/1443 AH.
//
import UIKit

class CustomCell: UICollectionViewCell {

    static let identifier = "CustomCell"
    

    let searchlabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .gray
        label.font = label.font.withSize(16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let contentlabel: UILabel = {
        let label = UILabel()
        label.text = "Enter Your Details:"
        label.textColor = .black
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .white

        self.addSubview(searchlabel)
        self.addSubview(contentlabel)
             
        

        searchlabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        searchlabel.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        searchlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16).isActive = true
        searchlabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16).isActive = true

        
        contentlabel.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        contentlabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 35).isActive = true
        contentlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        contentlabel.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true
        
        

    
        
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

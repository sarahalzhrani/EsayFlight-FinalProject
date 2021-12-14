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
        label.text = NSLocalizedString("Enter Your Details:", comment:"")
        label.textColor = .black
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberlabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Flight Number:", comment:"")
        label.textColor = .black
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fightnumberlabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .gray
        label.font = label.font.withSize(16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let conectnumberlabel1: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Mobile Number:", comment:"")
        label.textColor = .black
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let conectnumberlabel: UILabel = {
        let label = UILabel()
        label.text = "0553245"
        label.textColor = .gray
        label.font = label.font.withSize(16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .white
        self.addSubview(contentlabel)
        self.addSubview(searchlabel)
        self.addSubview(numberlabel)
        self.addSubview(fightnumberlabel)
        self.addSubview(conectnumberlabel1)
        self.addSubview(conectnumberlabel)
        contentlabel.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        contentlabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 10).isActive = true
        contentlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        contentlabel.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true

        searchlabel.topAnchor.constraint(equalTo: contentlabel.bottomAnchor,constant: 10).isActive = true
        searchlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16).isActive = true
        searchlabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16).isActive = true

        
        
        
        numberlabel.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        numberlabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 90).isActive = true
        numberlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        numberlabel.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true
        
        fightnumberlabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        fightnumberlabel.topAnchor.constraint(equalTo:  self.topAnchor,constant: 130).isActive = true
        fightnumberlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        fightnumberlabel.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true
                
        
        
        conectnumberlabel1.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        conectnumberlabel1.topAnchor.constraint(equalTo: self.topAnchor,constant: 90).isActive = true
        conectnumberlabel1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 250).isActive = true
        conectnumberlabel1.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true
        
        conectnumberlabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        conectnumberlabel.topAnchor.constraint(equalTo:  self.topAnchor,constant: 120).isActive = true
        conectnumberlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 250).isActive = true
        conectnumberlabel.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true
        
        
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

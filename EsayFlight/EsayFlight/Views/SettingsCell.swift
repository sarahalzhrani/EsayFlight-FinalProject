//
//  SettingsCell.swift
//  EsayFlight
//
//  Created by sara al zhrani on 06/06/1443 AH.
//


import UIKit
import SwiftUI

class SettingsCell: UITableViewCell {
    var sectionType: sectionType? {
        didSet {
            guard let sectionType = sectionType else {return}

            textLabel?.text = sectionType.description
            switchControl.isHidden = !sectionType.containsSwitch
        }
    }
    
    lazy var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.isUserInteractionEnabled = true
        switchControl.onTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.addTarget(self, action: #selector(handleswitchAction), for: .valueChanged)
        return switchControl
        
    }()
    
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(switchControl)
        switchControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        switchControl.rightAnchor.constraint(equalTo: rightAnchor,constant: -12).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleswitchAction(sender: UISwitch) {
        if (sender.isOn == true){
               print("on")
           }
           else{
               print("off")
           }
      
    }
}


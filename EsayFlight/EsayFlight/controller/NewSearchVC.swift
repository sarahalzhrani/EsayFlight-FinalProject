//
//  NewSearchVC.swift
//  EsayFlight
//
//  Created by sara al zhrani on 20/04/1443 AH.
//

import UIKit

class NewSearchVC: UIViewController, UITextFieldDelegate {
    
    var data: Search?
    
    lazy var contentTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Add details.."
        tf.delegate = self
        return tf
    }()
    
    
    lazy var contentTF2: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Add your Flight Number.."
        tf.delegate = self
        return tf
    }()
    
    
    
    lazy var contentTF3: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Add your Phone Number.."
        tf.delegate = self
        return tf
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit your searching"
        view.backgroundColor = .white
       
        view.backgroundColor = .white
        view.addSubview(contentTF)
        view.addSubview(contentTF2)
        view.addSubview(contentTF3)
        NSLayoutConstraint.activate([
            contentTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            contentTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            contentTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16),
            contentTF.heightAnchor.constraint(equalToConstant: 100),
            
            
            
            contentTF2.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            contentTF2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            contentTF2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16),
            contentTF2.heightAnchor.constraint(equalToConstant: 100),
            
            contentTF3.topAnchor.constraint(equalTo: view.topAnchor, constant: 260),
            contentTF3.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            contentTF3.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16),
            contentTF3.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        
        
        
        
        contentTF.text = data?.content
        contentTF2.text = data?.flightnumber
        contentTF3.text = data?.contactNumber
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        contentTF.resignFirstResponder()
        data?.content = contentTF.text ?? ""
        
        contentTF2.resignFirstResponder()
        data?.flightnumber = contentTF2.text ?? ""
        
        contentTF3.resignFirstResponder()
        data?.contactNumber = contentTF3.text ?? ""
        
        guard let note = data else { return true }
        SearchService.shared.updateOrAddNewSearch(note: note)
        return true
    }
}

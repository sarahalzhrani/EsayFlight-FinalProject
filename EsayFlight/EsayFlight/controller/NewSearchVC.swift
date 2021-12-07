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
        tf.placeholder = "Add some note.."
        tf.delegate = self
        return tf
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit your searching"
        view.backgroundColor = .white
       
        view.backgroundColor = .white
        view.addSubview(contentTF)
        NSLayoutConstraint.activate([
            contentTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            contentTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            contentTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16),
            contentTF.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        
        
        
        
        contentTF.text = data?.content
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        contentTF.resignFirstResponder()
        data?.content = contentTF.text ?? ""
        guard let note = data else { return true }
        SearchService.shared.updateOrAddNewSearch(note: note)
        return true
    }
}

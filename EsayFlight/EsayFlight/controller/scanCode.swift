//
//  scanCode.swift
//  EsayFlight
//
//  Created by sara al zhrani on 07/05/1443 AH.
//

import UIKit

class ScanCode: UIViewController {
    
    
    
    var image1: UIImageView = {
      let imageView = UIImageView()
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image1.image = generateQRCode(from: "sara")
        view.backgroundColor = .white
        view.addSubview(image1)
        NSLayoutConstraint.activate([
            image1.topAnchor.constraint(equalTo: view.topAnchor,constant: 200),
            image1.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 90),
            image1.heightAnchor.constraint(equalToConstant: 200),
            image1.widthAnchor.constraint(equalToConstant: 200),
        ])
        
    }
    func generateQRCode(from string: String) -> UIImage? {
            let data = string.data(using: String.Encoding.ascii)
            if let filter = CIFilter(name: "CIQRCodeGenerator") {
                filter.setValue(data, forKey: "inputMessage")
                let transform = CGAffineTransform(scaleX: 3, y: 3)
                if let output = filter.outputImage?.transformed(by: transform) {
                    return UIImage(ciImage: output)
                }
            }
            return nil
        }
    
    
    
}

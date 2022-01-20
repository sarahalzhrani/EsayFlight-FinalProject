//
//  scanCode.swift
//  EsayFlight
//
//  Created by sara al zhrani on 07/05/1443 AH.
//
//
import UIKit

class ScanCode: UIViewController {



    var image1: UIImageView = {
      let imageView = UIImageView()
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    let extradetails: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = NSLocalizedString("If you do not have a reservation just scan the Qr code 😄:", comment: "")
        label.textAlignment = .left
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        image1.image = generateQRCode(from: "https://www.saudia.com/?cid=&gclid=Cj0KCQiA2NaNBhDvARIsAEw55hg2Jb-fby0NNjpf4TB-v6PTbV3wHDOrrhY7hKmeA0Rgy-hRMnlxHPIaAkY8EALw_wcB")
        view.backgroundColor = .white
        view.addSubview(image1)
        view.addSubview(extradetails)
        NSLayoutConstraint.activate([
            image1.topAnchor.constraint(equalTo: view.topAnchor,constant: 200),
            image1.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 90),
            image1.heightAnchor.constraint(equalToConstant: 200),
            image1.widthAnchor.constraint(equalToConstant: 200),
            extradetails.topAnchor.constraint(equalTo: image1.bottomAnchor,constant: 20),
            extradetails.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80),
            extradetails.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -70),
            extradetails.heightAnchor.constraint(equalToConstant: 200),
//            extradetails.widthAnchor.constraint(equalToConstant: 400),
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


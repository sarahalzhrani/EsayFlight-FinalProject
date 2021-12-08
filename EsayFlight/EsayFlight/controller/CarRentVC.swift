//
//  FreeWIfi.swift
//  EsayFlight
//
//  Created by sara al zhrani on 24/04/1443 AH.
//

import UIKit

class CarRent: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    lazy var collectionView1: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing =  12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    
    func setupCollectionConstraints() {
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        collectionView1.heightAnchor.constraint(equalToConstant: 550).isActive = true
        collectionView1.widthAnchor.constraint(equalToConstant: 320).isActive = true
        collectionView1.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 60).isActive = true
        collectionView1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 140)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array3.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView1.dequeueReusableCell(withReuseIdentifier: CarRentCell.identifier, for: indexPath) as! CarRentCell
          let data = array3[indexPath.row]
        cell.imageView3.image = data.image2
        cell.CarNameble.text = data.name2
        
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 25
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 7
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        
        return cell
        
    }
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView1)
        setupCollectionConstraints()
         collectionView1.delegate = self
         collectionView1.dataSource = self
        view.backgroundColor = .white
     collectionView1.register(CarRentCell.self, forCellWithReuseIdentifier: CarRentCell.identifier)
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 60, width: view.frame.size.width, height: 60))
        view.addSubview(navBar)
        let navItem = UINavigationItem(title: "Rent car Office")
        let doneItem = UIBarButtonItem(title:"Back", style: .plain, target: self, action: #selector(baccck))
        navItem.leftBarButtonItem = doneItem

        navBar.setItems([navItem], animated: false)
        
        
    }
    
    
    
    @objc func baccck() {

        let vc = TabBarVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = array3[indexPath.row]
        
        
    }
    
    
}



class CarRentCell : UICollectionViewCell{
    
    static let identifier = "CarRentCell"
    

    
    var imageView3: UIImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "")
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    
    let CarNameble: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textColor = .black
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView3)
        self.addSubview(CarNameble)
       
        imageView3.topAnchor.constraint(equalTo: self.topAnchor,constant: 15).isActive = true
        imageView3.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        imageView3.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView3.widthAnchor.constraint(equalToConstant:90).isActive = true
        
        CarNameble.topAnchor.constraint(equalTo: self.topAnchor,constant: 110).isActive = true
        CarNameble.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
   
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

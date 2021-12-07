//
//  Home.swift
//  EsayFlight
//
//  Created by sara al zhrani on 18/04/1443 AH.
//

import UIKit

class Home : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var blackSquare: UIView!
    let scrollView = UIScrollView(frame: UIScreen.main.bounds)
    
    var RentCarBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("RentCar", comment: ""), for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor.systemMint, for: UIControl.State.normal)
        btn.layer.cornerRadius = 15
        btn.layer.borderColor = UIColor.systemMint.cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(RentBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    var newSBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("Airport News", comment: ""), for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor.systemMint, for: UIControl.State.normal)
        btn.layer.cornerRadius = 15
        btn.layer.borderColor = UIColor.systemMint.cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(NewsBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    
    
    var CallUsBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("callus", comment: ""), for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor.systemMint, for: UIControl.State.normal)
        btn.layer.cornerRadius = 15
        btn.layer.borderColor = UIColor.systemMint.cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(connectBtnPressed), for: .touchUpInside)
        return btn
    }()
       
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view = self.scrollView
        self.scrollView.contentSize = CGSize(width:0, height: 1000)
        blackSquare = UIView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 1000))
        blackSquare.backgroundColor = .white
        blackSquare.layer.cornerRadius = 55
        view.addSubview(blackSquare)
        scrollView.addSubview(collectionView)
        scrollView.addSubview(RentCarBtn)
        scrollView.addSubview(newSBtn)
        scrollView.addSubview(CallUsBtn)
    
        
        RentCarBtn.topAnchor.constraint(equalTo: view.topAnchor,constant: 400).isActive = true
        RentCarBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        RentCarBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
        RentCarBtn.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        
        CallUsBtn.topAnchor.constraint(equalTo: RentCarBtn.bottomAnchor,constant: 20).isActive = true
        CallUsBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        CallUsBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
        CallUsBtn.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        
        newSBtn.topAnchor.constraint(equalTo: CallUsBtn.bottomAnchor,constant: 20).isActive = true
        newSBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        newSBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
        newSBtn.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
      
      
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        setupCollectionConstraints()
        
        
        view.isUserInteractionEnabled = true
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    
    }
    
    
    @objc func RentBtnPressed() {

    }
    
    @objc func NewsBtnPressed() {

    }
    
    @objc func connectBtnPressed() {

    }
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            present(
                UINavigationController(rootViewController: Location()),
                animated: true,
                completion: nil
            )}}
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing =  12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    func setupCollectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.heightAnchor.constraint(equalToConstant: 340).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 340).isActive = true
//        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return details.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        let data = details[indexPath.row]
        cell.namelable.text = data.name
        cell.imageView.image = data.image
        
        cell.backgroundColor = .systemMint
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 160)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = details[indexPath.row]
        
        if indexPath.row == 0 {
            let navigationController = UINavigationController(
                rootViewController: serchForFlight()
            )
            navigationController.navigationBar.prefersLargeTitles = true
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        }else if indexPath.row == 1 {
            
            let navigationController = UINavigationController(
                rootViewController:AskForHelp()
            )
            
            navigationController.navigationBar.prefersLargeTitles = true
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        } else if indexPath.row == 2 {
            
            let navigationController = UINavigationController(
                rootViewController: Terminal1()
            )
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.navigationBar.prefersLargeTitles = true
            present(navigationController, animated: true, completion: nil)
        }  else if indexPath.row == 3 {
            let navigationController = UINavigationController(
                rootViewController: serchForluggage()
            )
            navigationController.navigationBar.prefersLargeTitles = true
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        }
    }
    
    
}



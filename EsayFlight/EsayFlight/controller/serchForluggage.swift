//
//  serchForluggage.swift
//  EsayFlight
//
//  Created by sara al zhrani on 19/04/1443 AH.
//

import UIKit


class serchForluggage : UIViewController {
    var blackSquare: UIView!
    
    var inform = [
        Search(id: UUID().uuidString, content: "", flightnumber: "", contactNumber: "")
    ]

    
    var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Home", comment: ""), style: .plain, target: self, action: #selector(handleCancel))
        blackSquare = UIView(frame: CGRect(x: 0, y: 80, width: 390, height: 800))
        blackSquare.backgroundColor = .white
        blackSquare.layer.cornerRadius = 55
        view.addSubview(blackSquare)
        setupCollectionView()
        
        SearchService.shared.listenToSearch { newData in
            self.inform = newData
            self.collectionView.reloadData()
        }
        
        title = NSLocalizedString("Lost Luggauge", comment:"")
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewserch)
        )
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 200)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray6
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        collectionView.alwaysBounceVertical = true
        self.view.addSubview(collectionView)

        
    }
    
    @objc func addNewserch() {
        let note = Search(id: UUID().uuidString, content: "", flightnumber: "", contactNumber:  "")
        SearchService.shared.updateOrAddNewSearch(note: note)
       
    }
    
}

extension serchForluggage: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inform.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        
        let data = inform[indexPath.row]
        cell.searchlabel.text = data.content
        cell.fightnumberlabel.text = data.flightnumber
        cell.conectnumberlabel.text = data.contactNumber
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let note1 = inform[indexPath.row]
        
        let searchVC = NewSearchVC()
        searchVC.data = note1
        
        navigationController?.pushViewController(
            searchVC,
            animated: true
        )
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}

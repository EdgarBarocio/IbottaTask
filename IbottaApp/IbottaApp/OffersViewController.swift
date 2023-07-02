//
//  ViewController.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import UIKit

class OffersViewController: UIViewController {

    var offersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Latest offers!"
        
        buildCollectionView()
    }


}

extension OffersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    private func buildCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        let width = UIScreen.main.bounds.size.width
        //calculation of cell size
        layout.itemSize = CGSize(width: ((width / 2) - 32), height: 200)
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        
        self.offersCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        self.offersCollectionView.dataSource = self
        self.offersCollectionView.delegate = self
        self.offersCollectionView.register(OfferCollectionViewCell.self, forCellWithReuseIdentifier: "OfferCell")
        self.offersCollectionView.backgroundColor = UIColor.white
        self.offersCollectionView.collectionViewLayout = layout
        view.addSubview(self.offersCollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath)
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let details = OfferDetailsView()
        
        self.navigationController?.pushViewController(details, animated: true)
    }
}


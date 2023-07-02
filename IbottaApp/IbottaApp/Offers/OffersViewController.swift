//
//  ViewController.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import UIKit

class OffersViewController: UIViewController {

    var offersCollectionView: UICollectionView!
    private var viewModel: OffersViewModel = OffersViewModel()
    
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
        self.offersCollectionView = viewModel.buildCollectionView()
        self.offersCollectionView.dataSource = self
        self.offersCollectionView.delegate = self
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


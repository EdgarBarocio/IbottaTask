//
//  ViewController.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import UIKit

class OffersViewController: UIViewController {

    private var offersCollectionView: UICollectionView!
    private var offersData:[OffersModel]?
    private var viewModel: OffersViewModel = OffersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Latest offers!"
        
        fetchData()
        buildCollectionView()
    }
}

extension OffersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    private func buildCollectionView() {
        self.offersCollectionView = viewModel.buildCollectionView()
        self.offersCollectionView.dataSource = self
        self.offersCollectionView.delegate = self
        view.addSubview(self.offersCollectionView)
        self.offersCollectionView.reloadData()
    }
    
    private func fetchData() {
        self.offersData = viewModel.fetchOffersData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offersData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as! OfferCollectionViewCell
        
        let cellViewModel = OffersCollectionViewCellViewModel(url: offersData?[indexPath.row].url,
                                                              name: offersData?[indexPath.row].name,
                                                              value: offersData?[indexPath.row].currentValue,
                                                              isFavorite: offersData?[indexPath.row].isFavorite)
        
        myCell.configure(cellViewModel)
        
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let details = OfferDetailsView()
        
        self.navigationController?.pushViewController(details, animated: true)
    }
}


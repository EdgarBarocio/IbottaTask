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
        let offerDetailViewModel = OfferDetailsViewModel( offerID: offersData?[indexPath.row].id,
                                                          offerName: offersData?[indexPath.row].name,
                                                          offerValue: offersData?[indexPath.row].currentValue,
                                                          offerDetals: offersData?[indexPath.row].description,
                                                          offerTerms: offersData?[indexPath.row].terms,
                                                          offerURL: offersData?[indexPath.row].url,
                                                          favorite: offersData?[indexPath.row].isFavorite)
        offerDetailViewModel.delegate = self
        details.updateInformation(offerDetailViewModel)
        
        self.navigationController?.pushViewController(details, animated: true)
    }
}

extension OffersViewController: FavoriteUpdateProtocol {
    func updateOfferState(updatedOffer: OfferDetailsViewModel) {
        if let index = self.offersData?.firstIndex(where: {$0.id == updatedOffer.offerID}) {
            let updated = OffersModel(id: updatedOffer.offerID,
                                      url: updatedOffer.offerURL,
                                      name: updatedOffer.offerName,
                                      description: updatedOffer.offerDetails,
                                      terms: updatedOffer.offerTerms,
                                      currentValue: updatedOffer.offerValue,
                                      isFavorite: updatedOffer.favorite)
            self.offersData?[index] = updated
            self.offersCollectionView.reloadData()
        }
    }
    
}


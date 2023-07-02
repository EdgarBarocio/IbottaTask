//
//  ViewController.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import UIKit

/**
    Landing page, class that displays a collection of offers the Saver can view, and select one for more details
 */
class OffersViewController: UIViewController {

    // Private variables of the OffersViewController
    private var offersCollectionView: UICollectionView!
    private var offersData:[OffersModel]?
    private var viewModel: OffersViewModel = OffersViewModel()
    
    /**
        Override function of viewDidLoad to show the navigation bar and set a title.
        Calls private functions to build UI and present data
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Latest offers!"
        
        fetchData()
        buildCollectionView()
    }
}

// MARK: - Extension to implement to create the main CollectionView  and implement data source and delegates
extension OffersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    /**
        Private function that asks the OffersViewModel for the Collection view to show all data.
     */
    private func buildCollectionView() {
        self.offersCollectionView = viewModel.buildCollectionView()
        self.offersCollectionView.dataSource = self
        self.offersCollectionView.delegate = self
        view.addSubview(self.offersCollectionView)
    }
    
    /**
        Private function that asks the OffersViewModel for the full Offers data. Saves the result on the private offersData variable.
     */
    private func fetchData() {
        self.offersData = viewModel.fetchOffersData()
    }
    
    /**
        Collection view function that set the number of elements to display, based on the number of offers stored in offersData
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offersData?.count ?? 0
    }
    
    /**
        Collection view function that creates the Cells showing each offer for the Saver.
        Creates an OffersCollectionViewCellViewModel with the corresponding offer, configures the cell and returns a OffersCollectionViewCell for display
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCollectionViewCell.cellIdentifier, for: indexPath) as! OfferCollectionViewCell
        
        let cellViewModel = OffersCollectionViewCellViewModel(url: offersData?[indexPath.row].url,
                                                              name: offersData?[indexPath.row].name,
                                                              value: offersData?[indexPath.row].currentValue,
                                                              isFavorite: offersData?[indexPath.row].isFavorite)
        
        myCell.configure(cellViewModel)
        
        return myCell
    }
    
    /**
        Collection view function that present the detail page of a selected offer.
        Creates an OfferDetailsView and an OfferDetailsViewModel with the selected offer. Updates the details view and sets this class as the ViewModel Delegate
        to handle the Favorites update.
        Pushes the OfferDetailsView on the Navigation Stack.
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let details = OfferDetailsView()
        var offerDetailViewModel = OfferDetailsViewModel( offerID: offersData?[indexPath.row].id,
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

// MARK: - Extension to implement FavoriteUpdateProtocol
extension OffersViewController: FavoriteUpdateProtocol {
    
    /**
        Protocol implementation that updates the selected Offer with the result of the activation or de-actinvation
        of the favorite toggle
     
     - Parameters:
        - updatedOffer: OfferDetailsViewModel containind the updated favorite flag
     */
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


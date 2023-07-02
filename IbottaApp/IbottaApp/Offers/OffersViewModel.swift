//
//  OffersViewModel.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 7/1/23.
//

import Foundation
import UIKit

/**
    View model for the OffersViewControl.
    Fetches the json file to convert to displayable data
    Builds the collection view for data display
 */
struct OffersViewModel {
    
    // Worker object to fetch and encode Offers.json
    private let parser = DataParsingWorker()
    private var offers: [OffersModel]?
    
    /**
    Function to convert local Offers.json file into data to display on OffersViewController
     
     - Returns:Array of OffersModel, result of json decoding.
     */
    mutating func fetchOffersData() -> [OffersModel]? {
        
        guard let result = parser.parseJSONFromFile() else { return nil }
        self.offers = result
        
        return self.offers
    }
    
    /**
    Function that builds the UICollectionView to be used on the OffersViewController to display all offers
     
     - Returns:UICollectionView to display Offers
     */
    func buildCollectionView() -> UICollectionView {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        let width = UIScreen.main.bounds.size.width
        //calculation of cell size
        layout.itemSize = CGSize(width: ((width / 2)-24), height: 200)
        layout.minimumInteritemSpacing = 8.0
        layout.minimumLineSpacing = 24.0
        
        let collectionView = UICollectionView(frame:UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView.register(OfferCollectionViewCell.self,
                                 forCellWithReuseIdentifier: OfferCollectionViewCell.cellIdentifier)
        collectionView.backgroundColor = .white
        
        return collectionView
    }
}

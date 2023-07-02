//
//  OffersViewModel.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 7/1/23.
//

import Foundation
import UIKit

class OffersViewModel {
    
    private let parser = DataParsingWorker()
    
    func fetchOffersData() {
        
        guard let results = parser.parseJSONFromFile() else { return }
        
        print(results)
    }
    
    func buildCollectionView() -> UICollectionView {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        let width = UIScreen.main.bounds.size.width
        //calculation of cell size
        layout.itemSize = CGSize(width: ((width / 2) - 32), height: 200)
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        
        let collectionView = UICollectionView(frame:UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView.register(OfferCollectionViewCell.self,
                                 forCellWithReuseIdentifier: OfferCollectionViewCell.cellIdentifier)
        collectionView.backgroundColor = .white
        
        return collectionView
    }
    
    
}

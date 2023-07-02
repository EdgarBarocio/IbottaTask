//
//  OffersViewModel.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 7/1/23.
//

import Foundation

class OffersViewModel {
    
    private let parser = DataParsingWorker()
    
    func fetchOffersData() {
        
        guard let results = parser.parseJSONFromFile() else { return }
        
        print(results)
    }
}

//
//  DataParsingWorker.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import Foundation

/**
    Worker class. A helper to read the Offers.json file to decode into an OffersModel
 */
class DataParsingWorker {
    
    /**
    Function that reads the Offers.json file, serializes it usion JSONDecoder and creates an array of OffersModel
     
     - Returns: Optional OffersModel array.
     */
    func parseJSONFromFile() -> [OffersModel]? {
        
        if let url = Bundle.main.url(forResource: "Offers", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([OffersModel].self, from: data)
                
                return decoded
            } catch {
                print(error)
            }
        }
        
        return nil
    }
}

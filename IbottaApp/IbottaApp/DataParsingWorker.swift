//
//  DataParsingWorker.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import Foundation

class DataParsingWorker {
    
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

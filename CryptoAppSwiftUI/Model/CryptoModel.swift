//
//  CryptoModel.swift
//  CryptoAppSwiftUI
//
//  Created by Mustafa Çiçek on 24.08.2022.
//

import Foundation


struct CryptoModel: Hashable , Identifiable {
    
    let id = UUID()
    let currency: String
    let price: String
    
    // The id will be automatically assigned
    // by the struct when decoding their contents.
    // just for json to model keys
    private enum CodingKeys: String, CodingKey {
        case curreny = "currency"
        case price = "price"
        
    }
    
}

extension CryptoModel: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        currency = try values.decode(String.self, forKey: .curreny)
        price = try values.decode(String.self, forKey: .price)
        
     
    }
}

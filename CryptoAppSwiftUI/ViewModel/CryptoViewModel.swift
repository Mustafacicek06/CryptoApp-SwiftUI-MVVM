//
//  CryptoViewModel.swift
//  CryptoAppSwiftUI
//
//  Created by Mustafa Çiçek on 25.08.2022.
//
import Foundation

class CryptoListViewModel: ObservableObject {
    let cryptoService = CryptoService()
    
    func downloadCrypto(url: URL){
        cryptoService.downloadCurrencies(url: url) { result in
            switch(result){
                case 
            }
        }
    }
}

import Foundation

struct CryptoViewModel {
    let model: CryptoModel
    
    var id: UUID? {
        model.id
    }
    
    var currency: String {
        model.currency
    }
    
    var price: String {
        model.price
    }
}

//
//  CryptoViewModel.swift
//  CryptoAppSwiftUI
//
//  Created by Mustafa Çiçek on 25.08.2022.
//
import Foundation
// gozlemlenebilir
class CryptoListViewModel: ObservableObject {
    
    // published edip baska bir yerden subscrib olup dinleyebiliriz
    @Published var cryptoList = [CryptoViewModel]()
    
    let cryptoService = CryptoService()
    
    func donwloadCryptoAsync(url: URL) async {
        do {
        let crpyots = try await cryptoService.downloadCurrenciesAsync(url: url)
            // published after that UI changed and than we will need that main thread
            DispatchQueue.main.async {
                self.cryptoList = crpyots.map(CryptoViewModel.init)
            }
        } catch {
            print("ViewModel downloadCryptoAsync error")
        }
    }
    
    
    
    
    
    
    /*
    func downloadCrypto(url: URL){
        cryptoService.downloadCurrencies(url: url) { result in
            switch(result){
            case .failure(let error):
                print(error)
            case .success(let cryptos):
                if let cryptos = cryptos {
                    // pbulished after that UI changed and than we will need that main thread
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)

                    }
                }
   
            }
        }
    }
    */
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

//
//  ContentView.swift
//  CryptoAppSwiftUI
//
//  Created by Mustafa Çiçek on 24.08.2022.
//

import SwiftUI

struct MainView: View {
    
    
    // gozlemlenen obje
    @ObservedObject var cryptoListViewModel: CryptoListViewModel
    
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    var body: some View {
        NavigationView {
            
            // directly id(UUID) from model does not useable
            List(cryptoListViewModel.cryptoList, id: \.id) { element in
                VStack{
                    Text(element.currency).font(.title3).foregroundColor(.blue).frame(maxWidth: .infinity, alignment: Alignment.leading)
                    Text(element.price).frame(maxWidth: .infinity,  alignment: .leading)
                }
              
                
            }.navigationTitle("Crypto SwiftUI")
        }.task {
            // make some jobs after ui drawing
            let myApiKey = "ae00a59a93623c9005482d4d573310e67e4b1434"
                   let baseUrl =  URL(string: "https://api.nomics.com/v1/currencies/ticker?key=\(myApiKey)")
            if let baseUrl = baseUrl {
               await  cryptoListViewModel.donwloadCryptoAsync(url: baseUrl)
            }
        }
        
        
        
        /*
         onAppear cannot return async
        .onAppear {
            // make some jobs after ui drawing
            let myApiKey = "ae00a59a93623c9005482d4d573310e67e4b1434"
                   let baseUrl =  URL(string: "https://api.nomics.com/v1/currencies/ticker?key=\(myApiKey)")
            if let baseUrl = baseUrl {
                 cryptoListViewModel.downloadCrypto(url: baseUrl)
            }
        }
      */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  CryptoService.swift
//  CryptoAppSwiftUI
//
//  Created by Mustafa Çiçek on 24.08.2022.
//

import Foundation


class CryptoService {
    // ı dont handle errors that class  -> async throws
    func downloadCurrenciesAsync(url: URL) async throws -> [CryptoModel] {
        // ı am not use repsonse so
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        let currencies = try? JSONDecoder().decode([CryptoModel].self, from: data)
        
        return currencies ?? []
    }
    
    /*
    func downloadCurrencies(url: URL, completion: @escaping (Result<[CryptoModel]?,BaseError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            
            guard let data = data, error == nil else{
                return completion(.failure(.noData))
            }
            // decode() first paramertre Decodable or Encodable ask me
            // my CryptoModel already Decodable therefore Cryptomodel.self
            guard let currencies = try? JSONDecoder().decode([CryptoModel].self, from: data) else {
                return completion(.failure(.dataParseError))
                
            }
            
            completion(.success(currencies))
            
        }.resume()
     */
    }
    



enum BaseError: Error {
    case badUrl
    case noData
    case dataParseError
}

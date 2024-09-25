//
//  CurrencyUpdate.swift
//  CryptoCrazySUI
//
//  Created by Erberk Yaman on 25.09.2024.
//

import Foundation

class CurrencyUpdate {
    
    
    func checkCurrenciesAsync(url: URL) async throws -> [CryptoCurrency] {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        
        return currencies ?? []
    }
    
    /*
    func checkCurrencies(url: URL, completion: @escaping (Result<[CryptoCurrency]?,checkErrors>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badURL))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.dataParseError))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(.noData))
            }
            
            completion(.success(currencies))
        }.resume()
     
    } */
}

/*
 enum checkErrors : Error {
 case badURL
 case noData
 case dataParseError
 }
 */

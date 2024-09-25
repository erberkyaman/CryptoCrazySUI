//
//  CryptoViewModel.swift
//  CryptoCrazySUI
//
//  Created by Erberk Yaman on 25.09.2024.
//

import Foundation

@MainActor
class CryptoListViewModel: ObservableObject {
 
    @Published var cryptoList = [CryptoViewModel]()

    let webservice = CurrencyUpdate()
    
    func checkCryptosAsync(url: URL) async {
        do {
            let cryptos = try await webservice.checkCurrenciesAsync(url: url)
            self.cryptoList = cryptos.map(CryptoViewModel.init)
        } catch {
            print(error)
        }
    }
    
    /*
    func checkCryptos(url: URL) {
        
        webservice.checkCurrencies(url: url) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let cryptos):
                if let cryptos = cryptos {
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                }
            }
        }
    }
     */
}

struct CryptoViewModel {
    
    let crypto : CryptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    
    var price : String {
        crypto.price
    }
}

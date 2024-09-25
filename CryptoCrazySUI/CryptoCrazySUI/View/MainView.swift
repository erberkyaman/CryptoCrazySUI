//
//  ContentView.swift
//  CryptoCrazySUI
//
//  Created by Erberk Yaman on 25.09.2024.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
        NavigationView {
            
            List(cryptoListViewModel.cryptoList, id:\.id) { crypto in
                VStack {
                    Text(crypto.currency)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(crypto.price)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }.navigationTitle("Crypto Crazy v2")
            }.toolbar(content: {
                Button(action: {
                    Task.init{
                    await cryptoListViewModel.checkCryptosAsync(url: URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
                    }
                }, label: {
                    Text("Refresh")
                })
            }).task {
                await cryptoListViewModel.checkCryptosAsync(url: URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
            }
            
            /*.onAppear{
                
                cryptoListViewModel.checkCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
            } */
        }
    }
}

#Preview {
    MainView()
}

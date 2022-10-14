//
//  PokemonViewModel.swift
//  PokedexV2
//
//  Created by JonathanA on 12/10/22.
//

import Foundation


class PokemonViewModel: ObservableObject {
    @Published var pokemon: [PokemonModel] = []
    
    func getPokemos() {
        let httpRequestHandler = HTTPRequestHandler()
        let pokemonPageRequest = PokemonPageRequest()
        httpRequestHandler.requestData(requestData: pokemonPageRequest) {[weak self] result in
            switch (result){
            case .success(let pokemon):
                DispatchQueue.main.async {
                    self?.pokemon = pokemon
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}

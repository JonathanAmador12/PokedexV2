//
//  PokemonViewModel.swift
//  PokedexV2
//
//  Created by JonathanA on 12/10/22.
//

import Foundation


class PokemonViewModel: ObservableObject {
    @Published var pokemon: [PokemonModel] = []
    var limit: Int = 21
    var offset: Int = 0
    
    func getPokemon() {
        let httpRequestHandler = HTTPRequestHandler()
        let pokemonPageRequest = PokemonPageRequest(limit: limit, offset: offset)
        httpRequestHandler.requestData(requestData: pokemonPageRequest) {[weak self] result in
            switch (result){
            case .success(let pokemon):
                DispatchQueue.main.async {
                    for pokemon in pokemon {
                        self?.pokemon.append(pokemon)
                    }
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }
    
    func loadMoreData(name: String) {
        if pokemon.last?.name == name {
            offset = limit + offset
            getPokemon()
        }
    }
}

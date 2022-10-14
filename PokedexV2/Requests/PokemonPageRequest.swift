//
//  PokemonPageRequest.swift
//  PokedexV2
//
//  Created by JonathanA on 12/10/22.
//

import Foundation

struct PokemonPageRequest: HTTPRequestData {
    typealias Response = [PokemonModel]
    
    var url: String{
        return "http://192.168.1.88:3000/pokemon"
    }
}
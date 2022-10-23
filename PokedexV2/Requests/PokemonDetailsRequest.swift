//
//  PokemonDetailsRequest.swift
//  PokedexV2
//
//  Created by JonathanA on 19/10/22.
//

import Foundation

struct PokemonDetailsRequest: HTTPRequestData {
    typealias Response = PokemonModel
    var id: Int
    var url: String{
        return "http://192.168.1.88:3000/pokemon/\(id)"
    }
}

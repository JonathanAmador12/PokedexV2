//
//  PokemonPageRequest.swift
//  PokedexV2
//
//  Created by JonathanA on 12/10/22.
//

import Foundation

struct PokemonPageRequest: HTTPRequestData {
    typealias Response = [PokemonBaseModel]
    var limit: Int
    var offset: Int
    
    var url: String{
        return "http://192.168.1.88:3000/pokemon"
    }
    var queryParams: [String : String]{
        return [
            "limit":String(limit),
            "offset":String(offset)
        ]
    }
}

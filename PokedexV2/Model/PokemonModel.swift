//
//  PokemonModel.swift
//  PokedexV2
//
//  Created by JonathanA on 12/10/22.
//

import Foundation

struct PokemonModel: Identifiable, Decodable, Hashable {
    var id: Int
    var name: String
    var imageUrl: String
    var types: [String]
    var stats: [Stat]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl = "image_url"
        case types
        case stats
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        imageUrl = try values.decode(String.self, forKey: .imageUrl)
        types = try values.decode([String].self, forKey: .types)
        stats = try values.decode([Stat].self, forKey: .stats)
    }
}

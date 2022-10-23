//
//  PokemonBasicModel.swift
//  PokedexV2
//
//  Created by JonathanA on 19/10/22.
//

import Foundation
struct PokemonBaseModel: Identifiable, Decodable, Hashable {
    var id: Int
    var name: String
    var imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
    }
}

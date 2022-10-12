//
//  APIError.swift
//  PokedexV2
//
//  Created by JonathanA on 09/10/22.
//

import Foundation

enum ApiError: Error {
    case badDecoding
    case badUrl
    case unauthorized
    case badRequest
}

//
//  HTTPRequestData.swift
//  PokedexV2
//
//  Created by JonathanA on 09/10/22.
//

import Foundation

// Protocol that defines request's structure
protocol HTTPRequestData {
    associatedtype Response: Decodable
    
    var method: HttpMethod {
        get
    }
    var url: String {
        get
    }
    var queryParams: [String:String]{
        get
    }
    var headers: [String:String]{
        get
    }
    
    func getURLRequest() throws -> URLRequest
}

// Give it default values to properties through an extension
extension HTTPRequestData{
    var method: HttpMethod{
        .get
    }
    var queryParams: [String:String]{
        [:]
    }
    var headers: [String:String]{
        [:]
    }
    
}

// Give default implementation to the function through an extension
extension HTTPRequestData{
    func getURLRequest() throws -> URLRequest {
        guard var urlComponets = URLComponents(string: url) else{
            throw ApiError.badUrl
        }
        var queryItems: [URLQueryItem] = []
        for (key, value) in queryParams{
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        urlComponets.queryItems = queryItems
        guard let url = urlComponets.url else{
            throw ApiError.badUrl
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        for (key,value) in headers{
            request.setValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}

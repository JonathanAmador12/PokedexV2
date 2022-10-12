//
//  HTTPRequestHandler.swift
//  PokedexV2
//
//  Created by JonathanA on 10/10/22.
//

import Foundation

struct HTTPRequestHandler {
    func requestData<RequestData: HTTPRequestData>(requestData: RequestData, handler: @escaping (Result<RequestData.Response,ApiError>)->Void) {
        var result: Result<RequestData.Response,ApiError>
        var urlRequest: URLRequest
        do{
            urlRequest = try requestData.getURLRequest()
        }catch{
            print(error)
            result = .failure(.badUrl)
            handler(result)
            return
        }

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            var result: Result<RequestData.Response, ApiError>

            if let response = response as? HTTPURLResponse{
                if response.statusCode == 400{
                    result = .failure(.badRequest)
                    handler(result)
                    return
                }else if response.statusCode == 401{
                    result = .failure(.unauthorized)
                    handler(result)
                    return
                }
            }

            if let data = data {
                do{
                    let decodeData = try JSONDecoder().decode(RequestData.Response.self, from: data)
                    result = .success(decodeData)
                    
                }
                catch{
                    print(error)
                    result = .failure(.badDecoding)
                    
                }
                handler(result)

            }
        }
        .resume()
    }
}

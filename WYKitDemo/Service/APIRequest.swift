//
//  ApiService.swift
//  MilkShopping
//
//  Created by Will on 2022/9/5.
//

import Foundation

let milkShopUrl = "https://api.airtable.com/v0/appSe3Pl4lBGfobem/Drinks"

enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}

protocol APIRequest {
    associatedtype Response
    
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var request: URLRequest { get }
    var httpBody: Data? { get }
    var httpMethod: HTTPMethod { get }
}

extension APIRequest {
    var queryItems: [URLQueryItem]? { nil }
    var httpBody: Data? { nil }
    var httpMethod: HTTPMethod { .get }
}

extension APIRequest where Response: Decodable {
    func send(completion: @escaping (Result<Response, Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, _, error in
            do {
                if let data = data {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decoded = try decoder.decode(Response.self, from: data)
                    completion(.success(decoded))
                } else if let error = error {
                    completion(.failure(error))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

extension APIRequest {
    var request: URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.airtable.com"
        components.path = "/v0/appSe3Pl4lBGfobem" + path
        components.queryItems = queryItems
        var request = URLRequest(url: components.url!)
        request.httpMethod = httpMethod.rawValue
        if let httpBody = httpBody {
            request.httpBody = httpBody
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        return request
    }
}

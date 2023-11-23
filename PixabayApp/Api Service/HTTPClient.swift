//
//  HTTPClient.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 22/11/23.
//

import RxSwift

public protocol HTTPClient {
    typealias Handler = Single<Data>
    
    func get(with request: URLRequest) -> Handler
}

extension HTTPClient {
    func get(from url: URL) -> Handler {
        get(from: url, method: .GET)
    }
    
    func get(from url: URL, method: HTTPMethod) -> Handler {
        get(from: url, method: method, headers: nil, body: nil)
    }
    
    func get(from url: URL, method: HTTPMethod, headers: [String: String]?, body: [String: String]? = nil) -> Handler {
        let request = buildRequest(from: url, method: method, headers: headers, bodyDictionary: body)
        return get(with: request)
    }
}

private extension HTTPClient {
    func buildRequest(from url: URL, method: HTTPMethod = .GET, headers: [String: String]? = nil, bodyDictionary: [String: String]? = nil) -> URLRequest {
        let request = URLRequest.builder(url: url, method: method, headers: headers, bodyMap: bodyDictionary)

         return request
     }
}

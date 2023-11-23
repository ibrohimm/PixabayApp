//
//  URLComponents+Extension.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import Foundation

extension URLComponents {
    mutating func setQueryParameters(_ parameters: [String: Any]?) {
        if let parameters = parameters, !parameters.isEmpty {
            queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                queryItems!.append(queryItem)
            }
        }
    }
}

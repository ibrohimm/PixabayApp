//
//  URLSessionHTTPClient.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 22/11/23.
//

import Foundation
import RxSwift

public final class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    private enum APIError: Error {
        case dataError
        case httpError
    }
    
    public func get(with request: URLRequest) -> Handler {
        return Handler.create { [weak self] single in
            let task = self?.session.dataTask(with: request) { data, response, error in
                if let error = error {
                    single(.failure(error))
                    return
                }
                
                guard let data = data,
                      let response = response as? HTTPURLResponse else {
                    single(.failure(APIError.dataError))
                    return
                }
                
                switch response.statusCode {
                case 200..<300:
                    single(.success(data))
                default:
                    let error = APIError.httpError
                    single(.failure(error))
                }
            }
            
            task?.resume()
            return Disposables.create { task?.cancel() }
        }
    }
}

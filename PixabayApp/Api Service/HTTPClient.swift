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

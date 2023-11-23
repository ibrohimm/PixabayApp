//
//  HomeRepository.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import RxSwift

protocol HomeRepository {
    func loadImages() -> Single<[ImageModel]>
}

final class RemoteHomeRepository: HomeRepository {
    
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    // MARK: -
    
    func loadImages() -> Single<[ImageModel]> {
        let params = [
            "key": KeychainManager.standard.getAPIKey() ?? "",
            "q": "",
            "image_type": "photo",
            "per_page": "100"
        ]
        
        var component = URLComponents(string: Endpoint.baseURL)
        component?.setQueryParameters(params)
        
        guard let url = component?.url else { return .just([]) }
        
        return client.get(from: url, method: .GET, headers: nil)
            .map { data in
                return try HomeMapper.map(data)
            }
    }
    
}

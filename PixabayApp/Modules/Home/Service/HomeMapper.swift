//
//  HomeMapper.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import Foundation

final class HomeMapper {
    
    private struct Root: Decodable {
        let hits: [RemoteImageItem]
    }
    
    static func map(_ data: Data) throws -> [ImageModel] {
        guard let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw APIError.parseError
        }
        
        return root.hits.toModels()
    }
}

private extension Array where Element == RemoteImageItem {
    func toModels() -> [ImageModel] {
        return map { ImageModel(id: $0.id, webformatURL: $0.webformatURL ?? "", largeImageURL: $0.largeImageURL ?? "", user: $0.user ?? "", downloads: $0.downloads, comments: $0.comments, likes: $0.likes, tags: $0.tags ?? "", views: $0.views)
        }
    }
}

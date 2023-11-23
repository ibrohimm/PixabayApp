//
//  RemoteImageItem.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import Foundation

struct RemoteImageItem: Decodable {
    let id: Int
    let webformatURL: String?
    let largeImageURL: String?
    let user: String?
    let downloads: Int
    let comments: Int
    let likes: Int
    let tags: String?
    let views: Int
}

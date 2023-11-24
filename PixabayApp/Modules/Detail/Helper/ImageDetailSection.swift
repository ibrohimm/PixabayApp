//
//  ImageDetailSection.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import Foundation

enum ImageDetailSection {
    case section1(data: Section1Data)
    case section2(data: Section2Data)
}

struct Section1Data {
    let imageSize: String
    let imageType: String
    let imageTags: String
    let image: String
    
    init(imageModel: ImageModel) {
        self.imageSize = "\(imageModel.imageWidth) x \(imageModel.imageHeight)"
        self.imageType = imageModel.type
        self.imageTags = imageModel.tags
        self.image = imageModel.largeImageURL
    }
}

struct Section2Data {
    let userName: String
    let views: String
    let likes: String
    let comments: String
    let favorites: String
    let downloads: String
    
    init(imageModel: ImageModel) {
        self.userName = imageModel.user
        self.views = "\(imageModel.views)"
        self.likes = "\(imageModel.likes)"
        self.comments = "\(imageModel.comments)"
        self.favorites = "0"
        self.downloads = "\(imageModel.downloads)"
    }
    
}

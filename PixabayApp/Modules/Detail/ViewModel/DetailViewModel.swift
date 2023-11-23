//
//  DetailViewModel.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import RxSwift

final class DetailViewModel {
    
    // MARK: - Properties
    
    private let coordinator: DetailCoordinator
    private let imageModel: ImageModel
    
    let sections: Observable<[ImageDetailSection]>
    
    // MARK: - Init
    
    init(coordinator: DetailCoordinator, imageModel: ImageModel) {
        self.coordinator = coordinator
        self.imageModel = imageModel
        
        let section1Data = Section1Data(imageModel: imageModel)
        let section2Data = Section2Data(imageModel: imageModel)
        
        sections = Observable.just([
            .section1(data: section1Data),
            .section2(data: section2Data)
        ])
    }
    
    // MARK: -
    
}

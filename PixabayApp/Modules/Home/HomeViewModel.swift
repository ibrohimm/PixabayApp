//
//  HomeViewModel.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Properties
    
    private let coordinator: HomeCoordinator
    private let service: HomeService
    
    // MARK: - Init
    
    init(service: HomeService, coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        self.service = service
    }
    
    // MARK: - Helper
    
}

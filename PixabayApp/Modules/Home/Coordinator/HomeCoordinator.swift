//
//  HomeCoordinator.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import UIKit

class HomeCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let service = HomeServiceImpl()
        let viewModel = HomeViewModel(service: service, coordinator: self)
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        viewController.viewModel = viewModel
        navigationController.viewControllers = [viewController]
    }

    // MARK: -
    
    func openDetailPage() {
        print("Open Detail Page")
    }
}

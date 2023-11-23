//
//  HomeCoordinator.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import UIKit

final class HomeCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let client = URLSessionHTTPClient()
        let homeRepository = RemoteHomeRepository(client: client)
        let viewModel = HomeViewModel(homeRepository: homeRepository, coordinator: self)
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        viewController.viewModel = viewModel
        navigationController.viewControllers = [viewController]
    }

    // MARK: -
    
    func openDetailPage() {
        print("Open Detail Page")
    }
}

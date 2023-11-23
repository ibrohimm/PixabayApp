//
//  DetailCoordinator.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import UIKit

final class DetailCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = DetailViewModel(coordinator: self)
        let viewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }

    // MARK: -
    
}

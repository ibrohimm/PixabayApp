//
//  DetailCoordinator.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import UIKit

final class DetailCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let imageModel: ImageModel
    
    init(navigationController: UINavigationController, model: ImageModel) {
        self.navigationController = navigationController
        self.imageModel = model
    }
    
    func start() {
        let viewModel = DetailViewModel(coordinator: self, imageModel: imageModel)
        let viewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }

    // MARK: -
    
}

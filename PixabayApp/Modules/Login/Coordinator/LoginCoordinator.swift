//
//  LoginCoordinator.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 22/11/23.
//

import UIKit

class LoginCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let service = LoginServiceImpl()
        let viewModel = LoginViewModel(service: service, coordinator: self)
        let viewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }

    // Additional methods for coordinating other view controllers
}

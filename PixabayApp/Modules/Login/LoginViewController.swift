//
//  LoginViewController.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 22/11/23.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!
    
    private let disposeBag = DisposeBag()
    var viewModel: LoginViewModel!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    // MARK: - Helper
    
    private func bindViewModel() {
        emailTextField.rx.text.orEmpty.bind(to: viewModel.emailText).disposed(by: disposeBag)
        passwordTextField.rx.text.orEmpty.bind(to: viewModel.passwordText).disposed(by: disposeBag)
        
        viewModel.errorMessage.subscribe(onNext: { [weak self] message in
            self?.showErrorAlert(with: message)
        }).disposed(by: disposeBag)
        
        loginButton.rx.tap.bind(to: viewModel.loginTapped).disposed(by: disposeBag)
    }
}

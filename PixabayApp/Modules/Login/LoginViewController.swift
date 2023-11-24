//
//  LoginViewController.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 22/11/23.
//

import UIKit
import RxSwift
import RxCocoa

final class LoginViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!
    @IBOutlet private var emailErrorLabel: ErrorLabel!
    @IBOutlet private var passwordErrorLabel: ErrorLabel!
    
    private let disposeBag = DisposeBag()
    var viewModel: LoginViewModel!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    // MARK: - Helper
    
    private func bindViewModel() {
        emailTextField.rx.text.orEmpty
            .bind(to: viewModel.emailText)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty
            .bind(to: viewModel.passwordText)
            .disposed(by: disposeBag)
        
        viewModel.emailErrorDriver
            .drive(onNext: { [weak self] errorMessage in
                self?.emailErrorLabel.showErrorMessage(errorMessage)
            })
            .disposed(by: disposeBag)
        
        viewModel.passwordErrorDriver
            .drive(onNext: { [weak self] errorMessage in
                self?.passwordErrorLabel.showErrorMessage(errorMessage)
            })
            .disposed(by: disposeBag)
        
        emailTextField.rx.text.orEmpty
            .subscribe(onNext: { [weak self] _ in
                self?.emailErrorLabel.clearError()
            })
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty
            .subscribe(onNext: { [weak self] _ in
                self?.passwordErrorLabel.clearError()
            })
            .disposed(by: disposeBag)
        
        loginButton.rx.tap.bind(to: viewModel.loginTapped).disposed(by: disposeBag)
    }
}

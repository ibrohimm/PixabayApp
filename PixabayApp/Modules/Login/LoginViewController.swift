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
    var viewModel: LoginViewModel?
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emailValid = emailTextField.rx.text.orEmpty.map { $0.isValidEmail() }
        let passwordValid = passwordTextField.rx.text.orEmpty.map { $0.isValidPassword() }
        
        Observable.combineLatest(emailValid, passwordValid) { $0 && $1 }
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.login()
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: Actions
    
    @IBAction func createAccountAction(_ sender: Any) {
        
    }
    
    // MARK: - Helper
    
    private func login() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
    }
}

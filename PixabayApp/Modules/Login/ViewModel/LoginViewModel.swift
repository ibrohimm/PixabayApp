//
//  LoginViewModel.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 22/11/23.
//

import Foundation
import RxSwift
import RxCocoa

final class LoginViewModel {
    
    // MARK: - Properties
    
    private let coordinator: LoginCoordinator
    private let service: LoginService
    private let disposeBag = DisposeBag()
    
    let emailText = BehaviorRelay<String>(value: "")
    let passwordText = BehaviorRelay<String>(value: "")
    let loginTapped = PublishSubject<Void>()
    
    // Use BehaviorRelay to hold error messages
    private let emailError = BehaviorRelay<String?>(value: nil)
    private let passwordError = BehaviorRelay<String?>(value: nil)
    
    // Expose Driver properties for UI binding
    var emailErrorDriver: Driver<String?> {
        return emailError.asDriver()
    }
    
    var passwordErrorDriver: Driver<String?> {
        return passwordError.asDriver()
    }
    
    // MARK: - Init
    
    init(service: LoginService, coordinator: LoginCoordinator) {
        self.coordinator = coordinator
        self.service = service
        
        loginTapped.subscribe(onNext: { [weak self] in
            self?.attemptLogin()
        }).disposed(by: disposeBag)
    }
    
    // MARK: - Helper
    
    private func attemptLogin() {
        let emailResult = Validator.validateEmail(emailText.value)
        let passwordResult = Validator.validatePassword(passwordText.value)
        
        if case .invalid(let emailMessage) = emailResult {
            emailError.accept(emailMessage)
            return
        }
        
        if case .invalid(let passwordMessage) = passwordResult {
            passwordError.accept(passwordMessage)
            return
        }
        
        login(email: emailText.value, password: passwordText.value)
    }
    
    private func login(email: String, password: String) {
        service.login(email: email, password: password)
            .subscribe(onSuccess: { user in
                self.coordinator.openHomePage()
            }, onFailure: { error in
                print("Authentication failed: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }
}

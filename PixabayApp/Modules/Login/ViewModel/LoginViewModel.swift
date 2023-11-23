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
    let errorMessage = PublishSubject<String>()
    
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
        
        guard emailResult == .valid, passwordResult == .valid else {
            var message = ""
            if case .invalid(let emailMessage) = emailResult {
                message = emailMessage
            }
            else if case .invalid(let passwordMessage) = passwordResult {
                message = passwordMessage
            }
            errorMessage.onNext(message)
            return
        }
        
        login(email: emailText.value, password: passwordText.value)
    }
    
    private func login(email: String, password: String) {
        service.login(email: email, password: password)
            .subscribe(onSuccess: { user in
                self.coordinator.openHomePage()
            }, onFailure: { error in
                self.errorMessage.onNext(error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
}

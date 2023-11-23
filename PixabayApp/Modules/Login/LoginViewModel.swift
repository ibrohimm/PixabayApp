//
//  LoginViewModel.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 22/11/23.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    
    // MARK: - Properties
    
    private let coordinator: Coordinator
    private let service: LoginService
    private let disposeBag = DisposeBag()
    
    let emailText = BehaviorRelay<String>(value: "")
    let passwordText = BehaviorRelay<String>(value: "")
    let loginTapped = PublishSubject<Void>()
    let errorMessage = PublishSubject<String>()
    
    // MARK: - Init
    
    init(service: LoginService, coordinator: Coordinator) {
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
        
        // Mock login service - Replace this with your actual login logic
        print("Success")
    }
}

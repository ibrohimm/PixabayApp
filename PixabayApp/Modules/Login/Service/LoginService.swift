//
//  LoginService.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 22/11/23.
//

import RxSwift

protocol LoginService {
    func login(email: String, password: String) -> Single<User>
}

class LoginServiceImpl: LoginService {
    func login(email: String, password: String) -> Single<User> {
        let user = User()
        return Single.just(user)
    }
}

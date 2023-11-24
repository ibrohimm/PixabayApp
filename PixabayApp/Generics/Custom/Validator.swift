//
//  Validator.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import Foundation

final class Validator {
    static func validateEmail(_ email: String) -> ValidationResult {
        guard !email.isEmpty else {
            return .invalid("EMAIL_REQUIRED".localized())
        }
        
        guard isValidEmail(email) else {
            return .invalid("INVALID_EMAIL_FORMAT".localized())
        }
        
        return .valid
    }
    
    static func validatePassword(_ password: String) -> ValidationResult {
        guard !password.isEmpty else {
            return .invalid("PASSWORD_REQUIRED".localized())
        }
        
        guard password.count >= 6 && password.count <= 12 else {
            return .invalid("PASSWORD_LENGTH_MESSAGE".localized())
        }
        
        return .valid
    }
    
    private static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        guard predicate.evaluate(with: email) else { return false }
        
        let components = email.components(separatedBy: "@")
        if components.count == 2, let domain = components[1] as NSString? {
            let range = domain.range(of: ".", options: .backwards)
            if range.location == NSNotFound {
                return false
            }
        }
        
        return true
    }
}

//
//  Validator.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import Foundation

enum ValidationResult: Equatable {
    case valid
    case invalid(message: String)
}

class Validator {
    static func validateEmail(_ email: String) -> ValidationResult {
        guard !email.isEmpty else {
            return .invalid(message: "Email is required")
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        guard emailPredicate.evaluate(with: email) else {
            return .invalid(message: "Invalid email format")
        }
        
        return .valid
    }
    
    static func validatePassword(_ password: String) -> ValidationResult {
        guard !password.isEmpty else {
            return .invalid(message: "Password is required")
        }
        
        guard password.count >= 6 && password.count <= 12 else {
            return .invalid(message: "Password must be 6-12 characters long")
        }
        
        return .valid
    }
}

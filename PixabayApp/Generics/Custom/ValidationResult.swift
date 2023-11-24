//
//  ValidationResult.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 24/11/23.
//

import Foundation

enum ValidationResult: Equatable {
    case valid
    case invalid(String)
    
    var isValid: Bool {
        switch self {
        case .valid:
            return true
        case .invalid:
            return false
        }
    }
    
    var errorMessage: String {
        switch self {
        case .valid:
            return ""
        case .invalid(let message):
            return message
        }
    }
}

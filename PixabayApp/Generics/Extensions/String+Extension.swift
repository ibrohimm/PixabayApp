//
//  String+Extension.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 22/11/23.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        // Password should be between 6 and 12 characters
        return self.count >= 6 && self.count <= 12
    }
}

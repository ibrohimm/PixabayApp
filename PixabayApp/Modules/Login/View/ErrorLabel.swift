//
//  ErrorLabel.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 24/11/23.
//

import UIKit

final class ErrorLabel: UILabel {
    func showErrorMessage(_ message: String?) {
        text = message
    }
    
    func clearError() {
        text = nil
    }
}

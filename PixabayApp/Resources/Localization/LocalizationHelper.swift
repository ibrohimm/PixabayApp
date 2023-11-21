//
//  LocalizationHelper.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 21/11/23.
//

import Foundation

public extension String {
    /**
     - Returns: The localized string.
     */
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

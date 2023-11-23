//
//  KeychainManager.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import Security
import Foundation

final class KeychainManager {
    
    static let standard = KeychainManager()
    
    private let service = "com.PixabayApp"
    private let account = "APIKey"
    
    private init() {}
    
    func saveAPIKey(apiKey: String) {
        // Convert the API key to Data
        let keyData = apiKey.data(using: .utf8)!

        // Create the query dictionary
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: keyData
        ]

        // Delete any existing item
        SecItemDelete(query as CFDictionary)

        // Add the new item to the keychain
        let status = SecItemAdd(query as CFDictionary, nil)
        if status != errSecSuccess {
            print("Error saving API key to keychain: \(status)")
        }
    }

    func getAPIKey() -> String? {
        // Create the query dictionary
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        if status == errSecSuccess {
            if let data = result as? Data,
                let apiKey = String(data: data, encoding: .utf8) {
                return apiKey
            }
        } else {
            print("Error retrieving API key from keychain: \(status)")
        }

        return nil
    }
}

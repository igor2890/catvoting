//
//  KeychainService.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 13.02.2022.
//

import Foundation
import KeychainSwift

class KeychainService: PrivateServiceProtocol{
    let keychain = KeychainSwift()
    let keyLogin = "emailLogin"
    let keyPassword = "password"
    
    func save(login: String, password: String) {
        keychain.synchronizable = true
        keychain.set(login, forKey: keyLogin)
        keychain.set(password, forKey: keyPassword)
    }
    
    func getLogin() -> String? {
        return keychain.get(keyLogin)
    }
    
}

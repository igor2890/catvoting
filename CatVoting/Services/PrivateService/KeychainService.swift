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
    let keyLogin = "Igor2890.CatVoting.emailLogin"
    let keyPassword = "Igor2890.CatVoting.password"
    
    init(){
        keychain.synchronizable = true
    }
    
    func save(login: String, password: String) {
        keychain.set(login, forKey: keyLogin)
        keychain.set(password, forKey: keyPassword)
    }
    
    func getLogin() -> String? {
        return keychain.get(keyLogin)
    }
    
}

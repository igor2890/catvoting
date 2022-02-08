//
//  FirebaseAuthService.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 08.02.2022.
//

import Foundation
import Firebase
import KeychainSwift

class FirebaseAuthService: AuthServiceProtocol{
    let keychain = KeychainSwift()
    
    func register(email: String, password: String, completion: @escaping ((Result<String,CustomStringError>) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password) {
            [weak self] authResult, error in
            guard let user = authResult?.user, error == nil else {
                let errCode = AuthErrorCode(rawValue: error!._code)
                let errDescription = errCode?.description
                completion(.failure(CustomStringError(description: errDescription)))
                return
            }
            user.sendEmailVerification()
            self?.keychain.synchronizable = true
            self?.keychain.set(email, forKey: "emailLogin")
            self?.keychain.set(password, forKey: "password")
            completion(.success(""))
        }
    }
    
    func login(email: String, password: String) {
        
    }
    
    func logout() {
        
    }
    
    
}

//
//  FirebaseAuthService.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 08.02.2022.
//

import Foundation
import Firebase

class FirebaseAuthService: AuthServiceProtocol{

    func register(email: String, password: String, completion: @escaping ((Result<String,CustomStringError>) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password) {
            authResult, error in
            guard let user = authResult?.user, error == nil else {
                let errCode = AuthErrorCode(rawValue: error!._code)
                let errDescription = errCode?.description
                completion(.failure(CustomStringError(description: errDescription)))
                return
            }
            user.sendEmailVerification()
            completion(.success(""))
        }
    }
    
    func login(email: String, password: String, completion: @escaping ((Result<String,CustomStringError>) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
            guard error == nil else {
                let errCode = AuthErrorCode(rawValue: error!._code)
                let errDescription = errCode?.description
                completion(.failure(CustomStringError(description: errDescription)))
                return
            }
            completion(.success(""))
        }
    }
    
    func isAuthorized() -> Bool {
        guard let _ = Auth.auth().currentUser else { return false }
        return true
    }
    
    func isAccountVerified() -> Bool? {
        Auth.auth().currentUser?.isEmailVerified
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

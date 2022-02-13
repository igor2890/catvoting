//
//  LoginInteractor.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 11.02.2022.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol{
    weak var presenter: LoginPresenterProtocol!
    let authService: AuthServiceProtocol = FirebaseAuthService()
    let privateService: PrivateServiceProtocol = KeychainService()
    
    func login(email: String, password: String) {
        authService.login(email: email, password: password){
            [weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(_):
                self.privateService.save(login: email, password: password)
                self.presenter.loginSuccessed()
            case .failure(let error):
                self.presenter.loginFails(message: error.description)
            }
        }
    }
    
    func getLogin() -> String? {
        return privateService.getLogin()
    }
    
}

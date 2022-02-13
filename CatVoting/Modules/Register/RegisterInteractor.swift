//
//  RegisterInteractor.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 08.02.2022.
//

import Foundation


class RegisterInteractor: RegisterInteractorProtocol{
    weak var presenter: RegisterPresenterProtocol!
    let authService: AuthServiceProtocol = FirebaseAuthService()
    let privateService: PrivateServiceProtocol = KeychainService()

    
    func register(email: String, password: String){
        authService.register(email: email, password: password) {
            [weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(_):
                self.privateService.save(login: email, password: password)
                self.presenter.registerSuccessed()
            case .failure(let error):
                self.presenter.registerFails(message: error.description)
            }
        }
    }
}

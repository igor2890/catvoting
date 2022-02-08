//
//  RegisterPresenter.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 08.02.2022.
//

import Foundation

class RegisterPresenter: RegisterPresenterProtocol{
    
    weak var viewController: RegisterViewControllerProtocol!
    var interactor: RegisterInteractorProtocol!
    var router: RegisterRouterProtocol!
    
    init(with viewController: RegisterViewControllerProtocol){
        self.viewController = viewController
    }
    
    func needCloseView(){
        router.closeView()
    }
    
    func registerTapped(email: String?, password: String?) {
        guard let email = email,
              let password = password
        else { return }
        interactor.register(email: email, password: password)
    }
    
    func registerFails(message: String) {
        viewController.showOKAlert(title: "Ошибка", message: message)
    }
    
    func registerSuccessed() {
        viewController.showOKAlert(
            title: "Зарегистрирован",
            message: "На указанный адрес электронной почты отправлено письмо о необходимости подтверждения регистрации")
    }
    
}

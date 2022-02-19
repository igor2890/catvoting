//
//  LoginPresenter.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 11.02.2022.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol{
    
    weak var viewController: LoginViewControllerProtocol!
    var interactor: LoginInteractorProtocol!
    var router: LoginRouterProtocol!
    
    var login: String? {
        get{
            return interactor.getLogin()
        }
    }
    
    init(with viewController: LoginViewControllerProtocol){
        self.viewController = viewController
    }

    func viewLoaded() {
        viewController.setMainLabelTitle(with: "ДЛЯ ТЕХ, КТО\nХОЧЕТ ПРАВИТЬ\nМИРОМ И ХОЗЯИНОМ")
        viewController.setLoginFieldPlaceholder(with: "е-почта")
        viewController.setPasswordFieldPlaceholder(with: "пароль")
        viewController.setRegisterButtonTitle(with: "Зарегистрироваться")
        viewController.setLoginFieldTitle(with: login ?? "")
    }
    
    func viewShown(){
        if (interactor.isAuthorized()) {
            router.goMainView()
        }
    }
    
    func loginTapped(email: String?, password: String?) {
        viewController.animateLoginButton()
        guard let email = email, let password = password else {
            viewController.showOKAlert(title: "Ошибка", message: "Введены некорректные данные")
            return
        }
        interactor.login(email: email, password: password)
    }
    
    func registerTapped() {
        router.goRegisterView()
    }
    
    func loginFails(message: String) {
        viewController.showOKAlert(title: "Ошибка", message: message)
    }
    
    func loginSuccessed() {
        router.goMainView()
    }
    
    
}

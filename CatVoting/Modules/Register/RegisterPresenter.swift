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
    
    private lazy var registerState: RegistrationStateProtocol = FailRegistrationState(with: self)
    
    init(with viewController: RegisterViewControllerProtocol){
        self.viewController = viewController
    }
    
    func configureView() {
        viewController.setLoginFieldPlaceholder(with: "е-почта")
        viewController.setPasswordFieldPlaceholder(with: "пароль")
        viewController.setRegButtonTitle(with: "Зарегистрироваться")
        viewController.setCloseButtonTitle(with: "Закрыть")
        viewController.showActivityIndicator(false)
    }
    
    
    func closeViewTapped(){
        router.closeView()
    }
    
    func registerTapped(email: String?, password: String?) {
        guard let email = email,
              let password = password
        else { return }
        interactor.register(email: email, password: password)
        viewController.showActivityIndicator(true)
    }
    
    func okTapped(){
        registerState.makeSomethingTapOK()
    }
    
    func registerFails(message: String) {
        registerState = FailRegistrationState(with: self)
        viewController.showOKAlert(title: "Ошибка", message: message)
        viewController.showActivityIndicator(false)
    }
    
    func registerSuccessed() {
        interactor.loginAfterRegister()
        registerState = SuccessRegistrationState(with: self)
        viewController.showOKAlert(
            title: "Зарегистрирован",
            message: "На указанный адрес электронной почты отправлено письмо о необходимости подтверждения регистрации")
        viewController.showActivityIndicator(false)
    }
    
}

//
//  LoginProtocols.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 11.02.2022.
//

import Foundation

protocol LoginConfiguratorProtocol: AnyObject{
    func configure(with viewController: LoginViewControllerProtocol)
}

protocol LoginViewControllerProtocol: AnyObject{
    var presenter: LoginPresenterProtocol! {get set}
    
    func setMainLabelTitle(with text: String)
    func setLoginFieldPlaceholder(with text: String)
    func setLoginFieldTitle(with text: String)
    func setPasswordFieldPlaceholder(with text: String)
    func setRegisterButtonTitle(with text: String)
    
    func performSegue(withIdentifier: String, sender: Any?)
    func animateLoginButton()
    func showOKAlert(title: String, message: String)
}

protocol LoginInteractorProtocol: AnyObject{
    var presenter: LoginPresenterProtocol! {get set}
    
    func login(email: String, password: String)
    func getLogin() -> String?
    func isAuthorized() -> Bool
}

protocol LoginPresenterProtocol: AnyObject{
    var viewController: LoginViewControllerProtocol! {get}
    var interactor: LoginInteractorProtocol! {get set}
    var router: LoginRouterProtocol! {get set}
    
    func viewLoaded()
    func viewShown()
    func loginTapped(email: String?, password: String?)
    func registerTapped()
    func loginFails(message: String)
    func loginSuccessed()
}

protocol LoginRouterProtocol: AnyObject{
    var viewController: LoginViewControllerProtocol! {get}
    
    func goRegisterView()
    func goMainView()
}

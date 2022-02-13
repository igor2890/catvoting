//
//  RegisterProtocols.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 08.02.2022.
//

import Foundation

protocol RegisterConfiguratorProtocol: AnyObject{
    func configure(with viewController: RegisterViewControllerProtocol)
}

protocol RegisterViewControllerProtocol: AnyObject{
    var presenter: RegisterPresenterProtocol! {get set}
    
    func setLoginFieldPlaceholder(with text: String)
    func setPasswordFieldPlaceholder(with text: String)
    func setRegButtonTitle(with text: String)
    func setCloseButtonTitle(with text: String)
    
    func showActivityIndicator(_ isShowing: Bool)
    func showOKAlert(title: String, message: String)
    func closeSelf()
}

protocol RegisterInteractorProtocol: AnyObject{
    var presenter: RegisterPresenterProtocol! {get set}
    
    func register(email: String, password: String)
}

protocol RegisterPresenterProtocol: AnyObject{
    var viewController: RegisterViewControllerProtocol! {get}
    var interactor: RegisterInteractorProtocol! {get set}
    var router: RegisterRouterProtocol! {get set}
    
    func configureView()
    func closeViewTapped()
    func registerTapped(email: String?, password: String?)
    func okTapped()
    func registerFails(message: String)
    func registerSuccessed()
    
}

protocol RegisterRouterProtocol: AnyObject{
    var viewController: RegisterViewControllerProtocol! {get}
    
    func closeView()
}

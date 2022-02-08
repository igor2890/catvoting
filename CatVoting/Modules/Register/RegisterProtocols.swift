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
    
    func needCloseView()
    func registerTapped(email: String?, password: String?)
    func registerFails(message: String)
    func registerSuccessed()
}

protocol RegisterRouterProtocol: AnyObject{
    var viewController: RegisterViewControllerProtocol! {get}
    
    func closeView()
}

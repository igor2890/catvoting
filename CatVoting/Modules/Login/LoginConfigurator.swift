//
//  LoginConfigurator.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 11.02.2022.
//

import Foundation

class LoginConfigurator: LoginConfiguratorProtocol{
    func configure(with viewController: LoginViewControllerProtocol) {
        let presenter: LoginPresenterProtocol = LoginPresenter(with: viewController)
        let interactor: LoginInteractorProtocol = LoginInteractor()
        let router: LoginRouterProtocol = LoginRouter(with: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
    }

}

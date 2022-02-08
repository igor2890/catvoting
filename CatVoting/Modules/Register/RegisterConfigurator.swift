//
//  RegisterConfigurator.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 08.02.2022.
//

import Foundation

class RegisterConfigurator: RegisterConfiguratorProtocol{
    
    func configure(with viewController: RegisterViewControllerProtocol) {
        let presenter: RegisterPresenterProtocol = RegisterPresenter(with: viewController)
        let interactor: RegisterInteractorProtocol = RegisterInteractor()
        let router: RegisterRouterProtocol = RegisterRouter(with: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
    }

}

//
//  LoginRouter.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 11.02.2022.
//

import Foundation

class LoginRouter: LoginRouterProtocol{
    
    weak var viewController: LoginViewControllerProtocol!
    
    init(with viewController: LoginViewControllerProtocol){
        self.viewController = viewController
    
    }
    
    func goRegisterView() {
        viewController.performSegue(withIdentifier: "registerSegue", sender: nil)
    }
    
    func goMainView() {
        viewController.performSegue(withIdentifier: "loginSegue", sender: nil)
    }
}

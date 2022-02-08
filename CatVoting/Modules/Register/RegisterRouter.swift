//
//  RegisterRouter.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 08.02.2022.
//

import Foundation

class RegisterRouter: RegisterRouterProtocol{
    
    weak var viewController: RegisterViewControllerProtocol!
    
    init(with viewController: RegisterViewControllerProtocol){
        self.viewController = viewController
    
    }
    
    func closeView() {
        viewController.closeSelf()
    }
    
}

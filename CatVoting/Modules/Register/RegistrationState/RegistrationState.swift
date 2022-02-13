//
//  RegistrationState.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 13.02.2022.
//

import Foundation

class RegistrationState: RegistrationStateProtocol{
    weak var registerPresenter: RegisterPresenterProtocol!
    
    init (with presenter: RegisterPresenterProtocol){
        self.registerPresenter = presenter
    }
    
    func makeSomethingTapOK() {}
}

//
//  SuccessRegistrationState.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 13.02.2022.
//

import Foundation

class SuccessRegistrationState: RegistrationState{
    override func makeSomethingTapOK() {
        super.registerPresenter.closeViewTapped()
    }
}

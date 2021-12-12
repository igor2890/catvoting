//
//  DelegateProtocol.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 25.09.2021.
//

import UIKit

protocol ButtonDelegate: AnyObject {
    func onButtonTap(sender: UIButton)
}

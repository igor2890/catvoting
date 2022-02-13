//
//  PrivateServiceProtocol.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 13.02.2022.
//

import Foundation

protocol PrivateServiceProtocol{
    func save(login: String, password: String)
    func getLogin() -> String?
}

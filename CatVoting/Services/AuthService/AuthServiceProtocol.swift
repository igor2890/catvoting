//
//  AuthServiceProtocol.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 08.02.2022.
//

import Foundation

protocol AuthServiceProtocol{
    func register(email: String, password: String, completion: @escaping ((Result<String,CustomStringError>) -> Void))
    func login(email: String, password: String, completion: @escaping ((Result<String,CustomStringError>) -> Void))
    func logout()
    func isAccountVerified() -> Bool?
}

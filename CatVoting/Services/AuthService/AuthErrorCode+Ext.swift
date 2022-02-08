//
//  AuthErrorCode+Ext.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 08.02.2022.
//

import Foundation
import FirebaseAuth

extension AuthErrorCode: Error{}

extension AuthErrorCode: CustomStringConvertible{
    public var description: String {
        switch self{
        case .emailAlreadyInUse:
            return "Аккаунт с таким e-mail уже зарегистрирован"
        case .invalidEmail:
            return "E-mail некорректен"
        case .operationNotAllowed:
            return "Аккаунт отключен. Обратитесь к администратору"
        case .weakPassword:
            return "Пароль недостаточно надежен. Пароль должен быть длинее 6 символов"
        default:
            return "Неизвестная ошибка"
        }
    }
}

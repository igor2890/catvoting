//
//  CustomStringError.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 08.02.2022.
//

import Foundation

struct CustomStringError: Error {
    var description: String
    
    init(description: String?){
        if let description = description {
            self.description = description
        } else {
            self.description = "Неизвестная ошибка"
        }
    }
}

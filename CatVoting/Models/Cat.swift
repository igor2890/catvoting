//
//  Cat.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 24.09.2021.
//

import UIKit

class Cat {
    var fotos: [UIImage?]
    let firstName: String
    let lastName: String
    let patronymic: String
    let dateBirth: Double
    var descriptionShort: String
    var descriptionLong: String
    var isSelected: Bool = false
    
    init(fotos: [UIImage?],
         firstName: String,
         lastName: String,
         patronymic: String,
         dateBirth: Double,
         descriptionShort: String,
         descriptionLong: String
    ) {
        self.fotos = fotos
        self.firstName = firstName
        self.lastName = lastName
        self.patronymic = patronymic
        self.dateBirth = dateBirth
        self.descriptionShort = descriptionShort
        self.descriptionLong = descriptionLong
    }
}

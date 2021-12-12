//
//  DemoData.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 24.09.2021.
//

import UIKit

var isVoted = false

let fotos1 = [UIImage(named: "miniCat")]
let fotos2 = [UIImage(named: "default")]
let fotos3 = [UIImage(named: "default")]


let cat1 = Cat(
    fotos: fotos1,
    firstName: "Бультерьер",
    lastName: "фон Подваленхоф",
    patronymic: "Барсикович",
    dateBirth: 1427274000, //25.03.2015
    descriptionShort: "Это Я",
    descriptionLong: "Это я с вами")

let cat2 = Cat(
    fotos: fotos2,
    firstName: "Рулет",
    lastName: "Сочидзе",
    patronymic: "Люциферович",
    dateBirth: 1318665600, //15.10.2011
    descriptionShort: "Это Ты",
    descriptionLong: "Это ты с вами")

let cat3 = Cat(
    fotos: fotos3,
    firstName: "Персик",
    lastName: "Кококошкова",
    patronymic: "Опольевна",
    dateBirth: 1463302800, //15.05.2016
    descriptionShort: "Это Ты",
    descriptionLong: "Это ты с вами")

let cat4 = Cat(
    fotos: fotos3,
    firstName: "Бонифаций",
    lastName: "Серов",
    patronymic: "Иннокентьевич",
    dateBirth: 1298451600, //23.02.2011
    descriptionShort: "Это Ты",
    descriptionLong: "Это ты с вами")

let cat5 = Cat(
    fotos: fotos3,
    firstName: "Левусьен",
    lastName: "Тыгыдымский",
    patronymic: "Пусьенович",
    dateBirth: 1302595200, //12.04.2011
    descriptionShort: "Это Ты",
    descriptionLong: "Это ты с вами")

let cat6 = Cat(
    fotos: fotos3,
    firstName: "Беляш",
    lastName: "Белецкий",
    patronymic: "Белокотович",
    dateBirth: 1301644800, //01.04.2011
    descriptionShort: "Это Ты",
    descriptionLong: "Это ты с вами")

let cat7 = Cat(
    fotos: fotos3,
    firstName: "Касьян",
    lastName: "Альбиносов",
    patronymic: "Соседович",
    dateBirth: 1325404800, //01.01.2012
    descriptionShort: "Это Ты",
    descriptionLong: "Это ты с вами")

var cats: [Cat] = [cat1, cat2, cat3, cat4, cat5, cat6, cat7]

let election = Election(cats: cats, dateStart: Date())


//Левусьен
//Беляш ?
//Касьян

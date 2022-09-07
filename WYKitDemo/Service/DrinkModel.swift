//
//  Drink.swift
//  MilkShopping
//
//  Created by Will on 2022/9/5.
//

import Foundation

struct MSRecords: Decodable {
    let records: [Drink]
}

struct Drink: Decodable {
    let id: String
    let createdTime: String
    let fields: DrinkField
}

struct DrinkField: Decodable {
    let name: String
    let amount: Int
    let image: [DrinkImage]
    let note: String
}

struct DrinkImage: Decodable {
    let url: String
}

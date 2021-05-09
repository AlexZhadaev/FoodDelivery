//
//  Food.swift
//  FoodDelivery
//
//  Created by Жадаев Алексей on 08.05.2021.
//

import Foundation

struct FoodData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case price = "temp"
    }
}

struct Weather: Codable {
    let description: String
    let image: Int
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case image = "id"
        case category = "main"
    }
}

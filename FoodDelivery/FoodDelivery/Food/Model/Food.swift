//
//  CurrentFood.swift
//  FoodDelivery
//
//  Created by Жадаев Алексей on 09.05.2021.
//

import Foundation

struct Food {
    let name: String
    let description: String
    let price: Double
    var priceString: String {
        return String(format: "%.0f", price)
    }
    let image: Int
    var systemIconNameString: String {
        switch image {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 700...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
    }
    
    let category: String
    
    init?(foodData: FoodData) {
        name = foodData.name
        description = foodData.weather.first?.description ?? ""
        price = foodData.main.price
        image = foodData.weather.first?.image ?? 0
        category = foodData.weather.first?.category ?? ""
    }
}

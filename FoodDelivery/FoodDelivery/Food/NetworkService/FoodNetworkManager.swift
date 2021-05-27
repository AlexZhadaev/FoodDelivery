//
//  NetworkManager.swift
//  FoodDelivery
//
//  Created by Жадаев Алексей on 09.05.2021.
//

import Foundation

class FoodNetworkManager {
    
    var onCompletion: ((Food) -> Void)?
    
    func fetchFoodList(for city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let food = self.parseJSON(withData: data) {
                    DispatchQueue.main.async {
                        self.onCompletion?(food)
                    }
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> Food? {
        let decoder = JSONDecoder()
        
        do {
            let foodData = try decoder.decode(FoodData.self, from: data)
            guard let food = Food(foodData: foodData) else {
                return nil
            }
            return food
        } catch let error as NSError {
            debugPrint(error.localizedDescription)
        }
        return nil
    }
}

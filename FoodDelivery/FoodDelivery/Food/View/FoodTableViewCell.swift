//
//  FoodTableViewCell.swift
//  FoodDelivery
//
//  Created by Жадаев Алексей on 08.05.2021.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    @IBOutlet weak var foodPrice: UIButton!
    
    func configure(for food: Food) {
        foodPrice.layer.cornerRadius = foodPrice.frame.size.height/6
        foodPrice.layer.borderWidth = CGFloat(2)
        foodPrice.layer.borderColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1).cgColor
        
        let image = UIImage(systemName: food.systemIconNameString)
        foodImage.image = image
        foodName.text = food.name
        foodDescription.text = food.description
        foodPrice.setTitle("от \(food.priceString) р", for: .normal)
    }
    
}

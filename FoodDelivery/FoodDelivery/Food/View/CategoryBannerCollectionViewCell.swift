//
//  CategoryBannerCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Жадаев Алексей on 08.05.2021.
//

import UIKit

class CategoryBannerCollectionViewCell: UICollectionViewCell {
    
    let view = ViewController.shared
    
    @IBOutlet weak var categoryBannerName: UIButton!
    
    func configure(for categoryBanner: String) {
        categoryBannerName.setTitle(categoryBanner, for: .normal)
        categoryBannerName.layer.cornerRadius = categoryBannerName.frame.size.height/2
        categoryBannerName.layer.masksToBounds = true
    }
    
    @IBAction func categoryBannerTapped(_ sender: UIButton) {
        guard let section = self.categoryBannerName.currentTitle else { return }
//        view.scrollToSection(view.foodTableView, section: section)
    }
    
}

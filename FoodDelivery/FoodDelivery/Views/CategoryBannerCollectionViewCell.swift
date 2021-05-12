//
//  CategoryBannerCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Жадаев Алексей on 08.05.2021.
//

import UIKit

class CategoryBannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryBannerName: UIButton!
    
    func configure(for categoryBanner: String) {
        categoryBannerName.setTitle(categoryBanner, for: .normal)
        categoryBannerName.layer.cornerRadius = categoryBannerName.frame.size.height/2
        categoryBannerName.layer.masksToBounds = true
    }
    
    @IBAction func categoryBannerTapped(_ sender: UIButton) {
//        let view = ViewController()
//        guard let section = self.categoryBannerName.currentTitle else { return }
//
//        var indexPath = IndexPath()
//        for item in 0..<view.foodSectionAndCategoryBanners.count {
//            if section == view.foodTableView.headerView(forSection: item)?.textLabel?.text {
//                indexPath = IndexPath(row: 0, section: item)
//            }
//        }
//        view.foodTableView.scrollToRow(at: indexPath, at: .top, animated: true)
        
    }
    
}

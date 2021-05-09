//
//  ViewController.swift
//  FoodDelivery
//
//  Created by Жадаев Алексей on 07.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var networkManager = FoodNetworkManager()
    var topBanners: [UIImage] = []
    var food: [Food] = []
    var foodDictionary: [String:[Food]] = [:]
    var foodSectionAndCategoryBanners: [String] = []
    
    @IBOutlet weak var topBannerCollectionView: UICollectionView!
    @IBOutlet weak var categoryBannerCollectionView: UICollectionView!
    @IBOutlet weak var foodTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.onCompletion = { [weak self] food in
            guard let self = self else { return }
            self.updateInterfaceWith(food: food)
        }
        hardcodeTopBanners()
        networkManager.fetchFoodList(for: "Moscow")
        networkManager.fetchFoodList(for: "London")
        networkManager.fetchFoodList(for: "Stambul")
        networkManager.fetchFoodList(for: "Madrid")
        networkManager.fetchFoodList(for: "Rome")
        networkManager.fetchFoodList(for: "Berlin")
        networkManager.fetchFoodList(for: "Helsinki")
        networkManager.fetchFoodList(for: "Beijing")
        networkManager.fetchFoodList(for: "Paris")
        
    }
    
    private func hardcodeTopBanners() {
        guard let topBanner1 = UIImage(named: "banner1") else { return }
        guard let topBanner2 = UIImage(named: "banner1") else { return }
        guard let topBanner3 = UIImage(named: "banner1") else { return }
        topBanners = [topBanner1, topBanner2, topBanner3]
        topBannerCollectionView.reloadData()
    }
    
    func updateInterfaceWith(food: Food) {
        DispatchQueue.main.async {
            self.food.append(food)
            self.sortFood(for: food)
            self.foodTableView.reloadData()
            self.categoryBannerCollectionView.reloadData()
        }
    }
    
}


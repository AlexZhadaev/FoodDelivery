//
//  ViewController + TableView extension.swift
//  FoodDelivery
//
//  Created by Жадаев Алексей on 08.05.2021.
//

import UIKit

extension ViewController: UITableViewDataSource {
    
    func sortFood(for foodItem: Food) {
        
        let foodKey = foodItem.category
        if var foodValues = foodDictionary[foodKey] {
            foodValues.append(foodItem)
            foodDictionary[foodKey] = foodValues
        } else {
            foodDictionary[foodKey] = [foodItem]
        }
        self.foodSectionAndCategoryBanners = [String](foodDictionary.keys).sorted()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return foodSectionAndCategoryBanners.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let foodKey = foodSectionAndCategoryBanners[section]
        if let foodValues = foodDictionary[foodKey] {
            return foodValues.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodTableViewCellIdentifier", for: indexPath) as! FoodTableViewCell
        let foodKey = foodSectionAndCategoryBanners[indexPath.section]
        if let foodValues = foodDictionary[foodKey] {
            cell.configure(for: foodValues[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect())
        headerView.backgroundColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1)
        let label = UILabel(frame: CGRect(x: 15, y: 6, width: 200, height: 15))
        label.text = foodSectionAndCategoryBanners[section]
        headerView.addSubview(label)
        return headerView
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == foodTableView && topBannerCollectionView.isHidden == false {
            UIView.animate(withDuration: 0.1, animations: {
                self.topBannerCollectionView.isHidden = true
            })
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == foodTableView && topBannerCollectionView.isHidden == true && foodTableView.contentOffset.y <= 0 {
            UIView.animate(withDuration: 0.1, animations: {
                self.topBannerCollectionView.isHidden = false
            })
        }
    }

}

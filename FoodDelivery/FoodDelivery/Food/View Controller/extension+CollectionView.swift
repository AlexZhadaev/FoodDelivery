//
//  ViewController + CollectionView.swift
//  FoodDelivery
//
//  Created by Жадаев Алексей on 08.05.2021.
//

import UIKit

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topBannerCollectionView {
            return topBanners.count
        } else {
            return foodSectionAndCategoryBanners.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topBannerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topBannerCellIdentifier", for: indexPath) as! TopBannerCollectionViewCell
            cell.configure(for: topBanners[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryBannerCellIdentifier", for: indexPath) as! CategoryBannerCollectionViewCell
            cell.configure(for: foodSectionAndCategoryBanners[indexPath.item])
            return cell
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == topBannerCollectionView {
            return 16
        } else {
            return 8
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topBannerCollectionView {
            return CGSize(width: 300, height: 112)
        } else {
            return CGSize(width: 88, height: 32)
        }
    }
}

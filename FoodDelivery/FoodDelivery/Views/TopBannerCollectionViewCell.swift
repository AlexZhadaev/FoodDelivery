//
//  TopBannersCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Жадаев Алексей on 08.05.2021.
//

import UIKit

class TopBannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topBannerImage: UIImageView!
    
    func configure(for topBanner: UIImage) {
        topBannerImage.image = topBanner
        topBannerImage.layer.cornerRadius = topBannerImage.frame.size.height/10
        topBannerImage.layer.masksToBounds = true
    }
}

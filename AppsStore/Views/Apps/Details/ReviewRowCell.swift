//
//  ReviewRowCell.swift
//  AppsStore
//
//  Created by Владислав Резник on 29.07.2022.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let reviewslController = ReviewsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(reviewslController.view)
        reviewslController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

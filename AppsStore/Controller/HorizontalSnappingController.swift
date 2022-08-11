//
//  HorizontalSnappingController.swift
//  AppsStore
//
//  Created by Владислав Резник on 28.07.2022.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController {
    
    // MARK: - Lifecycle
    
    init() {
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

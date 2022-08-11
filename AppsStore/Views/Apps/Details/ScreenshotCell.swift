//
//  ScreenshotCell.swift
//  AppsStore
//
//  Created by Владислав Резник on 29.07.2022.
//

import UIKit

class ScreenshotCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let imageView = UIImageView(cornerRadius: 12)
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

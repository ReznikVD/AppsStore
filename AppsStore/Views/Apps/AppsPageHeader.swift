//
//  AppsPageHeader.swift
//  AppsStore
//
//  Created by Владислав Резник on 27.07.2022.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  AppsHeaderCell.swift
//  AppsStore
//
//  Created by Владислав Резник on 27.07.2022.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let companyLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 24))
    let imageView = UIImageView(cornerRadius: 8)
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        companyLabel.textColor = .systemBlue
        titleLabel.numberOfLines = 2
        
        let stackView = UIStackView(arrangedSubviews: [companyLabel, titleLabel, imageView])
        stackView.axis = .vertical
        stackView.spacing = 12
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

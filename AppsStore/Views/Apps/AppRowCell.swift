//
//  AppRowCell.swift
//  AppsStore
//
//  Created by Владислав Резник on 27.07.2022.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let imageView: UIImageView = UIImageView(cornerRadius: 8)
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getButton = UIButton(title: "GET")
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 16
        
        let labelStackView = UIStackView(arrangedSubviews: [nameLabel, companyLabel])
        labelStackView.axis = .vertical
        labelStackView.spacing = 4
        
        let stackView = UIStackView(arrangedSubviews: [imageView, labelStackView, getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

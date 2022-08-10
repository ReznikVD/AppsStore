//
//  TrackCell.swift
//  AppsStore
//
//  Created by Владислав Резник on 10.08.2022.
//

import UIKit

class TrackCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "Track Name", font: .boldSystemFont(ofSize: 18))
    let subtitleLabel = UILabel(text: "Subtitle Label", font: .systemFont(ofSize: 16), numberOfLines: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.image = #imageLiteral(resourceName: "star")
        imageView.constrainWidth(constant: 80)
        
        let verticalStackView = UIStackView(arrangedSubviews: [
            nameLabel, subtitleLabel
            ], customSpacing: 4)
        verticalStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView, verticalStackView
            ], customSpacing: 16)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        stackView.alignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

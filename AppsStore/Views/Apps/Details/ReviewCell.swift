//
//  ReviewCell.swift
//  AppsStore
//
//  Created by Владислав Резник on 29.07.2022.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 18))
    let auhorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
    let starsLabel = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    let starsStackView: UIStackView = {
        var arrangeSubviews = [UIView]()
        (0..<5).forEach { _ in
            let imageView = UIImageView(image: UIImage(named: "star"))
            imageView.constrainWidth(constant: 24)
            imageView.constrainHeight(constant: 24)
            arrangeSubviews.append(imageView)
        }
        arrangeSubviews.append(UIView())
        let stack = UIStackView(arrangedSubviews: arrangeSubviews)
        return stack
    }()
    
    let bodyLabel = UILabel(text: "Review body", font: .systemFont(ofSize: 18), numberOfLines: 5)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .init(white: 0.95, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let stackView = UIStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [
                titleLabel, auhorLabel
                ], customSpacing: 8),
            starsStackView,
            bodyLabel
            ], customSpacing: 12)
        
        titleLabel.setContentCompressionResistancePriority(.init(rawValue: 0), for: .horizontal)
        auhorLabel.textAlignment = .right
        stackView.axis = .vertical
        addSubview(stackView)

        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

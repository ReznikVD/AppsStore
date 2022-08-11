//
//  AppDetailCell.swift
//  AppsStore
//
//  Created by Владислав Резник on 29.07.2022.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var app: Result! {
        didSet {
            nameLabel.text = app?.trackName
            releaseNotesLabel.text = app?.releaseNotes
            appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            priceButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }
    
    let appIconImageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    let priceButton = UIButton(title: "$4.99")
    let whatsNewLabel = UILabel(text: "Whats new", font: .boldSystemFont(ofSize: 20))
    let releaseNotesLabel = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        appIconImageView.backgroundColor = .white
        appIconImageView.constrainWidth(constant: 140)
        appIconImageView.constrainHeight(constant: 140)
        
        let verticalStackView = UIStackView(arrangedSubviews: [
            nameLabel,
            UIStackView(arrangedSubviews: [priceButton, UIView()]),
            UIView()
            ])
        
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 12
        
        priceButton.backgroundColor = .systemBlue
        priceButton.constrainHeight(constant: 32)
        priceButton.layer.cornerRadius = 32 / 2
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        priceButton.setTitleColor(.white, for: .normal)
        priceButton.constrainWidth(constant: 80)
        
        let stackView = UIStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [
                appIconImageView,
                verticalStackView
                ], customSpacing: 20),
            whatsNewLabel,
            releaseNotesLabel
            ])
        
        stackView.axis = .vertical
        stackView.spacing = 16
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}


//
//  SearchResultCell.swift
//  AppsStore
//
//  Created by Владислав Резник on 04.07.2022.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    // MARK: - Subviews
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .white
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "App name"
        return lbl
    }()
    
    let categoryLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Photo & Video"
        return lbl
    }()
    
    let ratingsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "9.25M"
        return lbl
    }()
    
    let getButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Get", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.backgroundColor = UIColor(white: 0.95, alpha: 1)
        btn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 32).isActive = true
        btn.layer.cornerRadius = 16
        return btn
    }()
    
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    // MARK: - Properties
    
    var appResult: Result! {
        didSet {
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingsLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
            
            let url = URL(string: appResult.artworkUrl100)
            appIconImageView.sd_setImage(with: url)
            screenshot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            if appResult.screenshotUrls.count > 1 {
                screenshot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            if appResult.screenshotUrls.count > 2 {
                screenshot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // optional
        
        let labelsStackView = UIStackView(arrangedSubviews: [
            nameLabel, categoryLabel, ratingsLabel
            ])
        labelsStackView.axis = .vertical
        
        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconImageView, labelsStackView, getButton
            ])
        
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenshotsStackView = UIStackView(arrangedSubviews: [
            screenshot1ImageView, screenshot2ImageView, screenshot3ImageView
            ])
        screenshotsStackView.distribution = .fillEqually
        screenshotsStackView.spacing = 12
        
        let overallStackView = UIStackView(arrangedSubviews: [
            infoTopStackView, screenshotsStackView
        ])
        
        overallStackView.spacing = 16
        overallStackView.axis = .vertical
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func createScreenshotImageView() -> UIImageView {
        let imgView = UIImageView()
        imgView.backgroundColor = .white
        imgView.layer.cornerRadius = 8
        imgView.clipsToBounds = true
        imgView.layer.borderWidth = 0.5
        imgView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imgView.contentMode = .scaleAspectFill
        return imgView
    }
    
   
}

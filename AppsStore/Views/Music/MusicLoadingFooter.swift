//
//  MusicLoadingFooter.swift
//  AppsStore
//
//  Created by Владислав Резник on 10.08.2022.
//

import UIKit

class MusicLoadingFooter: UICollectionReusableView {
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .darkGray
        aiv.startAnimating()
        
        let label = UILabel(text: "Loading more...", font: .systemFont(ofSize: 16))
        label.textAlignment = .center
     
        let verticlaStackView = UIStackView(arrangedSubviews: [
            aiv, label
            ], customSpacing: 8)
        addSubview(verticlaStackView)
        verticlaStackView.axis = .vertical
        verticlaStackView.centerInSuperview(size: .init(width: 200, height: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

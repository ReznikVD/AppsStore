//
//  PreviewScreenshotsController.swift
//  AppsStore
//
//  Created by Владислав Резник on 29.07.2022.
//

import UIKit

class PreviewScreenshotsController: HorizontalSnappingController {
    
    // MARK: - Poperties
    
    let cellId = "cellId"
    
    var app: Result? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 24)
    }
    
    // MARK: - Methods
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? ScreenshotCell else {
            return UICollectionViewCell()
        }
        let screenshotUrl = self.app?.screenshotUrls[indexPath.item]
        
        cell.imageView.sd_setImage(with: URL(string: screenshotUrl ?? ""))
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PreviewScreenshotsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
}

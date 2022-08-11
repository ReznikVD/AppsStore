//
//  TodayMultipleAppsController.swift
//  AppsStore
//
//  Created by Владислав Резник on 05.08.2022.
//

import UIKit

class TodayMultipleAppsController: BaseListController {
    
    // MARK: - Subviews
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close_button"), for: .normal)
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Properties
    
    let cellId = "cellId"
    var apps = [FeedResult]()
    fileprivate let mode: Mode
    override var prefersStatusBarHidden: Bool { return true }
    fileprivate let spacing: CGFloat = 16
    
    // MARK: - Lifecycle
    
    init(mode: Mode){
        self.mode = mode
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if mode == .fullscreen {
            setupCloseButton()
            navigationController?.isNavigationBarHidden = true
        } else {
            collectionView.isScrollEnabled = false
        }
        
        collectionView.backgroundColor = .white
        collectionView.register(MultipleAppCell.self, forCellWithReuseIdentifier: cellId)
    }

    // MARK: - Methods
    
    @objc func handleDismiss() {
        dismiss(animated: true)
    }
    
    func setupCloseButton() {
        view.addSubview(closeButton)
        
        closeButton.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 16), size: .init(width: 44, height: 44))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if mode == .fullscreen {
            return apps.count
        }
        return min(4, apps.count)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? MultipleAppCell else {
            return UICollectionViewCell()
        }
        cell.app = apps[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appId = apps[indexPath.item].id
        let appDetailController = AppDetailController(appId: appId)
        navigationController?.pushViewController(appDetailController, animated: true)
    }
}

// MARK: - Mode

extension TodayMultipleAppsController {
    
    enum Mode {
        case small, fullscreen
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension TodayMultipleAppsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if mode == .fullscreen {
            return .init(top: 12, left: 24, bottom: 12, right: 24)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height: CGFloat = (view.frame.height - 3 * spacing) / 4
        
        if mode == .fullscreen {
            height = 68
            return .init(width: view.frame.width - 48, height: height)
        }
        
        return .init(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
}

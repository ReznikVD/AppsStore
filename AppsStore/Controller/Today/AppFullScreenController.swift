//
//  AppFullScreenController.swift
//  AppsStore
//
//  Created by Владислав Резник on 01.08.2022.
//

import UIKit

class AppFullScreenController: UIViewController {
    
    // MARK: - Subviews
    
    let tableView = UITableView(frame: .zero, style: .plain)
    let floatingContainerView = UIView()
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close_button"), for: . normal)
        return button
    }()
    
    // MARK: - Properties
    
    var dismissHandler: (() -> ())?
    var todayItem: TodayItem?
    
    let statusBarHeight = UIApplication.shared.connectedScenes
            .filter {$0.activationState == .foregroundActive }
            .map {$0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter({ $0.isKeyWindow }).first?
            .windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    
    // MARK: - Lifecylce
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.clipsToBounds = true
        
        view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.dataSource = self
        tableView.delegate = self
        
        setupCloseButton()
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
        
        tableView.contentInset = .init(top: 0, left: 0, bottom: statusBarHeight, right: 0)
        
        setupFloatingControls()
    }
    
    // MARK: - Methods
    
    fileprivate func setupCloseButton() {
        view.addSubview(closeButton)
        
        closeButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 40))
        closeButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
    }
    
    @objc fileprivate func handleDismiss(sender: UIButton) {
        sender.isHidden = true
        dismissHandler?()
    }
    
    fileprivate func setupFloatingControls() {
        
        floatingContainerView.layer.cornerRadius = 16
        floatingContainerView.clipsToBounds = true
        view.addSubview(floatingContainerView)
        
        floatingContainerView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: -90, right: 16), size: .init(width: 0, height: 90))
        
        let blurVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        floatingContainerView.addSubview(blurVisualEffectView)
        blurVisualEffectView.fillSuperview()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        let imageView = UIImageView(cornerRadius: 16)
        imageView.image = todayItem?.image
        imageView.constrainHeight(constant: 68)
        imageView.constrainWidth(constant: 68)
        
        let getButton = UIButton(title: "GET")
        getButton.setTitleColor(.white, for: .normal)
        getButton.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 16)
        getButton.backgroundColor = .darkGray
        getButton.layer.cornerRadius = 16
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        
        let verticalStackView = UIStackView(arrangedSubviews: [
            UILabel(text: "Life Hack", font: .boldSystemFont(ofSize: 18)),
            UILabel(text: "Utilizing your Time", font: .systemFont(ofSize: 16))
            ], customSpacing: 4)
        verticalStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView,
            verticalStackView,
            getButton
            ], customSpacing: 16)
        
        floatingContainerView.addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        stackView.alignment = .center
    }
    
    @objc fileprivate func handleTap() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
            self.floatingContainerView.transform = .init(translationX: 0, y: -90)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.isScrollEnabled = false
            scrollView.isScrollEnabled = true
        }
    
        let translationY = -90 - self.statusBarHeight
        let transform  = scrollView.contentOffset.y > 100 ? CGAffineTransform(translationX: 0, y: translationY) : .identity
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
            self.floatingContainerView.transform = transform
        }
    }
}

// MARK: - UITableViewDelegate

extension AppFullScreenController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return TodayController.cellSize
        }
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource

extension AppFullScreenController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.item == 0 {
            let headerCell = AppFullScreenHeaderCell()
            headerCell.todayCell.todayItem = todayItem
            headerCell.todayCell.layer.cornerRadius = 0
            headerCell.clipsToBounds = true
            headerCell.todayCell.backgroundView = nil
            return headerCell
        }
        let cell = AppFullScreenDescriptionCell()
        return cell
    }
}

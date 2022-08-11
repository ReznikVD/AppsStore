//
//  AppFullScreenHeaderCell.swift
//  AppsStore
//
//  Created by Владислав Резник on 02.08.2022.
//

import UIKit

class AppFullScreenHeaderCell: UITableViewCell {
    
    // MARK: - Properties
    
    let todayCell = TodayCell()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(todayCell)
        todayCell.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

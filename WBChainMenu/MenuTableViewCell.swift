//
//  MenuTableViewCell.swift
//  WBChainMenu
//
//  Created by Muhammad Waqas on 2/16/19.
//  Copyright © 2019 Muhammad Waqas. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    static let cellId = "menuCell"
    
    @IBOutlet weak var buttonMenu: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_imageNames: [String]) {

        translatesAutoresizingMaskIntoConstraints = false

        let container = MenuChainView(configure: contentView, position: Position(positionX: .right, positionY: .bottom))
      //  container.actionButtonColor = UIColor.brown
      //  container.actionButtonHeight = 40.0
      //  container.actionButtonImage = _imageNames[0]
        container.actionButtonMarginX = 0
        container.actionButtonMarginY = 0
      //  container.chainAnimation = false
        
        let item1 = MenuChainItem(_imageNames[0])
        let item2 = MenuChainItem(_imageNames[1])
        let item3 = MenuChainItem(_imageNames[2])
        let item4 = MenuChainItem(_imageNames[3])
        
        container.items = [item1, item2, item3, item4]
        
    }
}

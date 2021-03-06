//
//  MenuTableViewCell.swift
//  WBChainMenu
//
//  Created by Muhammad Waqas on 2/16/19.
//  Copyright © 2019 Muhammad Waqas. All rights reserved.
//

import UIKit
import WBChainMenu

class MenuTableViewCell: UITableViewCell {
    
    static let cellId = "menuCell"
    
    @IBOutlet weak var buttonMenu: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_imageNames: [String], index: Int) {

        translatesAutoresizingMaskIntoConstraints = false
        var container: MenuChainView?
        if index == 0 {
            container = MenuChainView(configure: contentView, position: Position(positionX: .left, positionY: .center))
        } else if index == 1 {
            container = MenuChainView(configure: contentView, position: Position(positionX: .right, positionY: .center))

        }  else if index == 2 {
            container = MenuChainView(configure: contentView, position: Position(positionX: .left, positionY: .top))
            container?.actionButtonMarginY = 0.0
        }  else if index == 3 {
            container = MenuChainView(configure: contentView, position: Position(positionX: .right, positionY: .top))
            container?.actionButtonMarginY = 0.0
        }  else if index == 4 {
            container = MenuChainView(configure: contentView, position: Position(positionX: .left, positionY: .bottom))
            container?.actionButtonMarginY = 0.0
        }
        else  {
            container = MenuChainView(configure: contentView, position: Position(positionX: .right, positionY: .bottom))
            container?.actionButtonMarginY = 0.0
        }
      //  container.actionButtonColor = UIColor.brown
      //  container.actionButtonHeight = 40.0
      //  container.actionButtonImage = _imageNames[0]
      //  container.actionButtonMarginX = 0
      //  container.actionButtonMarginY = 0
      //  container.chainAnimation = false
        
        let item1 = MenuChainItem(_imageNames[0])
        let item2 = MenuChainItem(_imageNames[1])
        let item3 = MenuChainItem(_imageNames[2])
        let item4 = MenuChainItem(_imageNames[3])
        
        container?.items = [item1, item2, item3, item4]
        
    }
}

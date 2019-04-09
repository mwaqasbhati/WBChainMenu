//
//  ChainMenuView.swift
//  WBChainMenu
//
//  Created by Muhammad Waqas on 4/8/19.
//  Copyright © 2019 Muhammad Waqas. All rights reserved.
//

import UIKit

/**
 horizontal and vertical position of the View in view Hierarchy
 */
public struct Position {
    public let positionX: Horizontal
    public let positionY: Vertical
    public init(positionX: Horizontal, positionY: Vertical) {
        self.positionX = positionX
        self.positionY = positionY
    }
}

/**
 vertical position of the view which includes top, center and bottom.
 */
public enum Vertical {
    case top
    case center
    case bottom
    
    //Mark: Helper Methods
    /**
     Create Vertical Constraint for Main Action Button
     
     - Parameters:
     - actionButton: Main Button on which we will apply constraint
     - menuView: MenuChainView which will have all the items and subview of container
     - container: ContentView of UITableViewCell
     
     - Returns: NSLayoutConstraint which will be stored to change it later
     */
    func constraintFor(_ actionButton: UIButton, menuView: MenuChainView, container: UIView) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        switch self {
        case .top:
            constraint = actionButton.topAnchor.constraint(equalTo: menuView.topAnchor, constant: menuView.actionButtonMarginY)
        case .center:
            constraint = actionButton.centerYAnchor.constraint(equalTo: menuView.centerYAnchor, constant: menuView.actionButtonMarginY)
        case .bottom:
            constraint = container.bottomAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: menuView.actionButtonMarginY)
        }
        return constraint
    }
    /**
     Create Vertical Constraint for Menu Item like save button item etc.
     
     - Parameters:
     - menuItem: Each Menu Item which is contained in MenuChainView
     - menuView: MenuChainView which will have all the items and subview of container
     - container: ContentView of UITableViewCell
     
     - Returns: NSLayoutConstraint which will be stored to change it later
     */
    func constraintFor(_ menuItem: MenuChainItem, menuView: MenuChainView, container: UIView) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        switch self {
        case .top:
            constraint = menuItem.topAnchor.constraint(equalTo: container.topAnchor, constant: menuView.actionButtonMarginY)
        case .center:
            constraint = menuItem.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: menuView.actionButtonMarginY)
        case .bottom:
            constraint = container.bottomAnchor.constraint(equalTo: menuItem.bottomAnchor, constant: menuView.actionButtonMarginY)
        }
        return constraint
    }
}

/**
 horizontal position of the View which includes left and right
 */

public enum Horizontal {
    case left
    case right
    
    //Mark: Properties
    /// initial transform which will be applied on Menu Items
    var initialTransform: CGAffineTransform {
        var temp: CGAffineTransform!
        switch self {
        case .left:
            temp = CGAffineTransform.init(rotationAngle: CGFloat(-Double.pi))
        case .right:
            temp = CGAffineTransform.init(rotationAngle: CGFloat(-Double.pi))
        }
        return temp
    }
    
    /// transform which we will apply when menu is opened/closed
    var closeTransform: CGAffineTransform {
        var temp: CGAffineTransform!
        switch self {
        case .left:
            temp = CGAffineTransform.init(rotationAngle: CGFloat(0))
        case .right:
            temp = CGAffineTransform.init(rotationAngle: CGFloat(-Double.pi))
        }
        return temp
    }
    
    /// transform which we will apply when menu is opened/closed
    var openTransform: CGAffineTransform {
        var temp: CGAffineTransform!
        switch self {
        case .left:
            temp = CGAffineTransform.init(rotationAngle: CGFloat(-Double.pi))
        case .right:
            temp = CGAffineTransform.init(rotationAngle: CGFloat(-(2*Double.pi)))
        }
        return temp
    }
    
    //Mark: Helper Methods
    /**
     Create Horizontal Constraint for Menu Item like save button item etc.
     
     - Parameters:
     - menuItem: Each Menu Item which is contained in MenuChainView
     - menuView: MenuChainView which will have all the items and subview of container
     - container: ContentView of UITableViewCell
     
     - Returns: NSLayoutConstraint which will be stored to change it later
     */
    func constraintFor(_ menuItem: MenuChainItem, menuView: MenuChainView, container: UIView) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        switch self {
        case .left:
            constraint = menuItem.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: -menuItem.itemWidth)
        case .right:
            constraint = menuItem.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 30)
        }
        return constraint
    }
    /**
     Create Horitontal Constraint for Menu Action Button
     
     - Parameters:
     - actionButton: Main Button on which we will apply constraint
     - menuView: MenuChainView which will have all the items and subview of container
     - container: ContentView of UITableViewCell
     
     - Returns: NSLayoutConstraint which will be stored to change it later
     */
    func constraintFor(_ actionButton: UIButton, menuView: MenuChainView, container: UIView) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        switch self {
        case .left:
            constraint = actionButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: menuView.actionButtonMarginX)
        case .right:
            constraint = container.trailingAnchor.constraint(equalTo: actionButton.trailingAnchor, constant: menuView.actionButtonMarginX)
        }
        return constraint
    }
    /**
     Create Constraint for Background View/Blurry View
     
     - Parameters:
     - menuView: MenuChainView which will have all the items and subview of container
     - container: ContentView of UITableViewCell
     
     - Returns: NSLayoutConstraint which will be stored to change it later
     */
    func constraintFor(_ menuView: UIView, container: UIView) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint!
        switch self {
        case .left:
            constraint = menuView.trailingAnchor.constraint(equalTo: container.leadingAnchor)
        case .right:
            constraint = menuView.leadingAnchor.constraint(equalTo: container.trailingAnchor)
        }
        return constraint
    }
}
class ActionButton: UIButton {
    
}
open class MenuChainItem: UIView {
    
    //MARK: Properties
    private var imageName: String?
    var positionXConstraint = NSLayoutConstraint()
    var positionYConstraint = NSLayoutConstraint()
    private var itemWidthConstraint = NSLayoutConstraint()
    private var itemHeightConstraint = NSLayoutConstraint()
    
    var onClick: ((UIButton) -> ())?
    
    var actionButtonColor: UIColor = .clear {
        didSet {
            actionButton.backgroundColor = actionButtonColor
        }
    }
    /// image view of Menu Item
    lazy private var imageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        if let image = imageName {
            temp.image = UIImage(named: image)
        }
        return temp
    }()
    /// Menu Item Button
    lazy private var actionButton: UIButton = {
        let actionBtn = UIButton()
        actionBtn.translatesAutoresizingMaskIntoConstraints = false
        actionBtn.backgroundColor = actionButtonColor
        actionBtn.addTarget(self, action: #selector(actionButtonPressed(sender:)), for: .touchUpInside)
        return actionBtn
    }()
    
    /// Menu Item width, default is 30.0
    var itemWidth: CGFloat = 30.0 {
        didSet {
            itemWidthConstraint.constant = itemWidth
        }
    }
    
    /// Menu Item height, default is 30.0
    var itemHeight: CGFloat = 30.0 {
        didSet {
            itemHeightConstraint.constant = itemHeight
        }
    }
    
    
    //MARK: Initializer
    public convenience init(_ image: String) {
        self.init(frame: .zero)
        imageName = image
        setup()
    }
    /**
     setup menu item and it's subview
     */
    //MARK: Helper Methods
    private func setup() {
        setupImageView()
        setupActionButton()
    }
    /**
     setup Menu Item Menu Image constraints
     */
    private func setupImageView() {
        addSubview(imageView)
        
        imageView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 0.0).isActive = true
        imageView.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: 0.0).isActive = true
        imageView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 0.0).isActive = true
        imageView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: 0.0).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    /**
     setup Menu Item Action button constraints
     */
    private func setupActionButton() {
        addSubview(actionButton)
        bringSubviewToFront(actionButton)
        
        actionButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        actionButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        actionButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    /**
     update Menu Items constraints
     - Parameters:
     - menuView: MenuChainView which will have all the items and subview of container
     - container: ContentView of UITableViewCell
     - position: define x and y position of Menu Item
     */
    fileprivate func update(_ menuView: MenuChainView, container: UIView, position: Position) {
        translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        
        if menuView.chainAnimation {
            transform = position.positionX.initialTransform
        }
        positionXConstraint = position.positionX.constraintFor(self, menuView: menuView, container: container)
        positionYConstraint = position.positionY.constraintFor(self, menuView: menuView, container: container)
        itemWidthConstraint = widthAnchor.constraint(equalToConstant: itemWidth)
        itemHeightConstraint = heightAnchor.constraint(equalToConstant: itemHeight)
        
        itemWidthConstraint.isActive = true
        itemHeightConstraint.isActive = true
        positionXConstraint.isActive = true
        positionYConstraint.isActive = true
    }
    
    //MARK: IBActions
    @objc func actionButtonPressed(sender:UIButton) {
        if let action = onClick {
            action(sender)
        }
    }
}

open class MenuChainView: UIView {
    
    //MARK: Properties
    private var positionXConstraint = NSLayoutConstraint()
    private var buttonWidthConstraint = NSLayoutConstraint()
    private var buttonHeightConstraint = NSLayoutConstraint()
    private var buttonXConstraint = NSLayoutConstraint()
    private var buttonYConstraint = NSLayoutConstraint()
    
    private var configure = UIView()
    private var position: Position = Position(positionX: .left, positionY: .center)
    private var isOpen = false
    
    public var chainAnimation = true
    public var animationDuration = 2.0
    public var itemSpace: CGFloat = 20.0
    
    /// Menu Items First Item Margin from Left/Right
    fileprivate var menuItemsMargin: CGFloat {
        return actionButtonMarginX + actionButtonWidth + 50.0
    }
    /// Main Action Button Y position in the container
    public var actionButtonMarginY: CGFloat = 0.0 {
        didSet {
            buttonYConstraint.constant = actionButtonMarginY
        }
    }
    /// Main Action Button X position in the container
    public var actionButtonMarginX: CGFloat = 20.0 {
        didSet {
            buttonXConstraint.constant = actionButtonMarginX
        }
    }
    /// Main Action Button width in the container
    public var actionButtonWidth: CGFloat = 30.0 {
        didSet {
            buttonWidthConstraint.constant = actionButtonWidth
        }
    }
    /// Main Action Button height in the container
    public var actionButtonHeight: CGFloat = 30.0 {
        didSet {
            buttonHeightConstraint.constant = actionButtonHeight
        }
    }
    /// Item duration which will come from animation duration divided by total items
    private var itemDuration: Double {
        return animationDuration/Double(items.count)
    }
    /// Main Action Button Image, default will be 3 black dots
    public var actionButtonImage: String = "dots" {
        didSet {
            if let image = UIImage(named: actionButtonImage) {
                actionButton.setImage(image, for: .normal)
            }
        }
    }
    /// Main Action Button background color
    public var actionButtonBackColor: UIColor = .clear {
        didSet {
            actionButton.backgroundColor = actionButtonBackColor
        }
    }
    /// Initialize main Action button
    lazy private var actionButton: ActionButton = {
        let button = ActionButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: actionButtonImage), for: .normal)
        button.backgroundColor = actionButtonBackColor
        button.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
        return button
    }()
    /// All the items which a Chain Menu contains
    public var items = [MenuChainItem]() {
        didSet {
            for item in items {
                item.update(self, container: configure, position: position)
            }
        }
    }
    
    //MARK: Initializers
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(configure: UIView, with image: String = "dots", position: Position = Position(positionX: .left, positionY: .center)) {
        self.init(frame: .zero)
        tag = -1 // later access it
        actionButtonImage = image
        self.position = position
        setup(configure: configure)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Helper Methods
    /**
     setup Main Menu View and it's subviews
     */
    private func setup(configure: UIView) {
        removeAll(configure: configure)
        self.configure = configure
        translatesAutoresizingMaskIntoConstraints = false
        configure.addSubview(self)
        
        backgroundColor = UIColor.white
        alpha = 0.5
        let tap = UITapGestureRecognizer(target: self, action: #selector(actionButtonPressed))
        addGestureRecognizer(tap)
        
        positionXConstraint = position.positionX.constraintFor(self, container: configure)
        positionXConstraint.isActive = true
        
        topAnchor.constraint(equalTo: configure.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: configure.bottomAnchor).isActive = true
        
        widthAnchor.constraint(equalTo: configure.widthAnchor).isActive = true
        
        setupActionButton(configure: configure)
        
    }
    private func removeAll(configure: UIView) {
        for view in configure.subviews {
            if (view.isKind(of: MenuChainView.classForCoder()) || view.isKind(of: MenuChainItem.classForCoder()) || view.isKind(of: ActionButton.classForCoder())) {
                view.removeFromSuperview()
            }
        }
    }
    /**
     Apply all four constraints(x, y, height, width) on Main Action Button
     */
    private func setupActionButton(configure: UIView) {
        configure.addSubview(actionButton)
        
        buttonXConstraint = position.positionX.constraintFor(actionButton, menuView: self, container: configure)
        buttonYConstraint = position.positionY.constraintFor(actionButton, menuView: self, container: configure)
        
        buttonWidthConstraint = actionButton.widthAnchor.constraint(equalToConstant: actionButtonWidth)
        buttonHeightConstraint = actionButton.heightAnchor.constraint(equalToConstant: actionButtonHeight)
        
        buttonWidthConstraint.isActive = true
        buttonHeightConstraint.isActive = true
        buttonXConstraint.isActive = true
        buttonYConstraint.isActive = true
    }
    /**
     close the Menu using chain Animation, Incase of Right Menu
     open  the Menu using chain Animation, Incase of Left Menu
     */
    private func open() {
        let change = self.positionXConstraint.constant + self.frame.size.width
        print("Open \(position.positionX):\(change)")
        self.positionXConstraint.constant = change
        
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0, options: [.calculationModeLinear], animations: { [weak self] in
            // Add animations
            guard let `self` = self else { return }
            var distance = self.menuItemsMargin
            for item in self.items {
                item.isHidden = false
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: self.itemDuration, animations: {
                    item.positionXConstraint.constant += distance
                    if self.chainAnimation {
                        item.transform = self.position.positionX.closeTransform
                    }
                    self.configure.layoutIfNeeded()
                })
                distance += item.frame.size.width + self.itemSpace
            }
            }, completion:{ _ in
                
        })
    }
    /**
     close the Menu using chain Animation, Incase of left Menu
     open  the Menu using chain Animation, Incase of Right Menu
     */
    private func close() {
        var distance = self.menuItemsMargin
        
        let change = self.positionXConstraint.constant - self.frame.size.width
        print("Close \(position.positionX):\(change)")
        self.positionXConstraint.constant = change
        
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0, options: [.calculationModeLinear], animations: {
            for item in self.items {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: self.itemDuration, animations: {
                    item.positionXConstraint.constant -= distance
                    if self.chainAnimation {
                        item.transform = self.position.positionX.openTransform
                    }
                    self.configure.layoutIfNeeded()
                })
                distance += item.frame.size.width + self.itemSpace
            }
        }, completion:{ _ in
            
        })
        
    }
    
    //MARK: IBActions
    @objc func actionButtonPressed() {
        
        if let tableViewCell = configure.superview as? UITableViewCell, let tableView = tableViewCell.superview as? UITableView {
            for (_, cell) in tableView.visibleCells.enumerated() {
                if let optionView = cell.viewWithTag(-1) as? MenuChainView {
                    if optionView.isOpen && optionView != self {
                       optionView.position.positionX == .right ? optionView.open() : optionView.close()
                       optionView.isOpen = false
                    }
                }
            }
        }
        
        switch position.positionX {
        case .left:
            if isOpen {
                close()
            } else {
                open()
            }
        case .right:
            if isOpen {
                open()
            } else {
                close()
            }
        }
        isOpen = !isOpen
        
    }
    
}

# WBChainMenu

[![CI Status](https://img.shields.io/travis/mwaqasbhati/WBChainMenu.svg?style=flat)](https://travis-ci.org/mwaqasbhati/WBChainMenu)
[![Version](https://img.shields.io/cocoapods/v/WBChainMenu.svg?style=flat)](https://cocoapods.org/pods/WBChainMenu)
[![License](https://img.shields.io/cocoapods/l/WBChainMenu.svg?style=flat)](https://cocoapods.org/pods/WBChainMenu)
[![Platform](https://img.shields.io/cocoapods/p/WBChainMenu.svg?style=flat)](https://cocoapods.org/pods/WBChainMenu)

## About

An Option Menu with chain animation has below mentioned features:

* Menu on top of UItableViewCell which can come out from left to right or vice versa.
* Menu Action button with: image only*
* Animated expansion from left, right.
* Custom Menu Items: Background Image

## Background

I have used many menus for a tableviewcell but WBChainMenu is used where we have lengthy number of menu items and needs to display in one view.

### Expansion Styles

The expansion style describes the behavior when we call the `open` and `close` function of Menu View. 

|             Left         |         Right          |
|---------------------------------|------------------------------|
|![Demo](https://github.com/mwaqasbhati/WBChainMenu/blob/master/Gifs/Left.gif)|![Demo](https://github.com/mwaqasbhati/WBChainMenu/blob/master/Gifs/Right.gif)|

#### Chain Menu View

````swift
let container = MenuChainView(configure: contentView, position: Position(positionX: .left, positionY: .center))
````

we can further customize Menu View with the below optional fields

````swift
container.actionButtonBackColor = UIColor.brown
container.actionButtonHeight = 40.0
container.actionButtonWidth = 30.0
container.actionButtonImage = _imageNames[0]
container.actionButtonMarginX = 0
container.actionButtonMarginY = 0
container.chainAnimation = false
container.animationDuration = 5.0
container.itemSpace = 50.0
````

#### Left/Right and Top/Center/Bottom

We have to inilialize position object which contains horizontal/vertical position of the layout and assigin it to `MenuChainView`

````swift
Position(positionX: .left, positionY: .center)
````


#### Chain Menu Item View

````swift
let item1 = MenuChainItem(UIImage)
let item2 = MenuChainItem(UIImage)
let item3 = MenuChainItem(UIImage)
let item4 = MenuChainItem(UIImage)
        
container?.items = [item1, item2, item3, item4]
````

we can further customize Menu View with the below optional fields

````swift
item.itemWidth = 40.0
item.itemHeight = 50.0
item.backgroundColor = UIColor.blue
````

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* Swift 4.2
* Xcode 10
* iOS 11.0

## Installation

WBChainMenu is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WBChainMenu'
```

## Author

mwaqasbhati, m.waqas.bhati@hotmail.com

## License

WBChainMenu is available under the MIT license. See the LICENSE file for more info.

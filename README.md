# PKCAlertView

[![CI Status](http://img.shields.io/travis/pikachu987/PKCAlertView.svg?style=flat)](https://travis-ci.org/pikachu987/PKCAlertView)
[![Version](https://img.shields.io/cocoapods/v/PKCAlertView.svg?style=flat)](http://cocoapods.org/pods/PKCAlertView)
[![License](https://img.shields.io/cocoapods/l/PKCAlertView.svg?style=flat)](http://cocoapods.org/pods/PKCAlertView)
[![Platform](https://img.shields.io/cocoapods/p/PKCAlertView.svg?style=flat)](http://cocoapods.org/pods/PKCAlertView)

## Example

![image](./0.gif)

![image](./4.png)

![image](./3.png)

![image](./2.png)

![image](./1.png)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

<br><br>

~~~~~

import PKCAlertView

let alertView = PKCAlertView("Title", message: "Message")
alertView.addSuperView(self.view)

alertView.addAlertButton("Default") { (type, text) in

}

alertView.addAlertView("OK") { (type, text) in
	
}

alertView.addAlertView("Cancel", rightText: "OK") { (type, text) in

}

alertView.addAlertView("Left", centerText: "Center", rightText: "Right", handler: { (type, text) in
                   
})

alertView.animationType = .default
alertView.animationType = .alpha
alertView.animationType = .modal
alertView.animationTime = TimeInterval(0.5)

alertView.show()

~~~~~

## Installation

PKCAlertView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PKCAlertView"
```

## Author

pikachu987, pikachu77769@gmail.com

## License

PKCAlertView is available under the MIT license. See the LICENSE file for more info.

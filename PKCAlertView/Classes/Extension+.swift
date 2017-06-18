//
//  Extension+.swift
//  Pods
//
//  Created by Kim Guanho on 2017. 6. 17..
//
//

import UIKit

extension UIColor{
    static let alertDefault = UIColor(red: 0, green: 0.48, blue: 1, alpha: 1)
    static let alertCancel = UIColor(red: 1, green: 0.23, blue: 0.19, alpha: 1)
}



extension UIEdgeInsets{
    static let pkcAlertTopEdge = UIEdgeInsetsMake(16, 16, 2, 16)
    static let pkcAlertBottomEdge = UIEdgeInsetsMake(2, 16, 16, 16)
    static let pkcAlertDefaultEdge = UIEdgeInsetsMake(16, 16, 16, 16)
}


extension UIView{
    func horizontalLayout(left: CGFloat = 0, right: CGFloat = 0) -> [NSLayoutConstraint]{
        return NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(left)-[view]-\(right)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": self])
    }
    func verticalLayout(top: CGFloat = 0, bottom: CGFloat = 0) -> [NSLayoutConstraint]{
        return NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(top)-[view]-\(bottom)-|", options: NSLayoutFormatOptions.alignAllLeading, metrics: nil, views: ["view": self])
    }
}

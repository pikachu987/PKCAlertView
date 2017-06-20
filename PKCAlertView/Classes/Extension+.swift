//Copyright (c) 2017 pikachu987 <pikachu77769@gmail.com>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.

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


public extension UIView{
    //addSubview
    public func pkc_addSubview(_ alertView: PKCAlertView){
        self.addSubview(alertView)
        let leadingConst = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: alertView, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConst = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: alertView, attribute: .trailing, multiplier: 1, constant: 0)
        let topConst = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: alertView, attribute: .top, multiplier: 1, constant: 0)
        let bottomConst = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: alertView, attribute: .bottom, multiplier: 1, constant: 0)
        leadingConst.priority = UILayoutPriority(999)
        trailingConst.priority = UILayoutPriority(999)
        topConst.priority = UILayoutPriority(999)
        bottomConst.priority = UILayoutPriority(999)
        self.addConstraints([leadingConst, trailingConst, topConst, bottomConst])
        alertView.leadingConst = leadingConst
        alertView.trailingConst = trailingConst
        alertView.topConst = topConst
        alertView.bottomConst = bottomConst
    }
    
    func horizontalLayout(left: CGFloat = 0, right: CGFloat = 0) -> [NSLayoutConstraint]{
        return NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(left)-[view]-\(right)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": self])
    }
    func verticalLayout(top: CGFloat = 0, bottom: CGFloat = 0) -> [NSLayoutConstraint]{
        return NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(top)-[view]-\(bottom)-|", options: NSLayoutFormatOptions.alignAllLeading, metrics: nil, views: ["view": self])
    }
}

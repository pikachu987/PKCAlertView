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

public class PKCContainerView: UIView {
    var titleLabel: PKCAlertLabel
    var messageLabel: PKCAlertLabel
    var buttonView: PKCButtonView
    
    public init(_ title: String, message: String) {
        var titleEdge = UIEdgeInsets.pkcAlertDefaultEdge
        var messageEdge = UIEdgeInsets.pkcAlertDefaultEdge
        if title != "" && message != ""{
            titleEdge = UIEdgeInsets.pkcAlertTopEdge
            messageEdge = UIEdgeInsets.pkcAlertBottomEdge
        }else{
            if title == ""{
                titleEdge = UIEdgeInsets.zero
            }
            if message == ""{
                messageEdge = UIEdgeInsets.zero
            }
        }
        
        self.titleLabel = PKCAlertLabel(title, inset: titleEdge, type: .title)
        self.messageLabel = PKCAlertLabel(message, inset: messageEdge, type: .message)
        self.buttonView = PKCButtonView()
        
        super.init(frame: CGRect.zero)
        self.initVars()
    }
    
    
    private override init(frame: CGRect) {
        self.titleLabel = PKCAlertLabel("", inset: .zero, type: .title)
        self.messageLabel = PKCAlertLabel("", inset: .zero, type: .message)
        self.buttonView = PKCButtonView()
        super.init(frame: frame)
        self.initVars()
    }
    
    
    
    private func initVars(){
        self.backgroundColor = UIColor(white: 0.98, alpha: 1)
        self.layer.cornerRadius = 12
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        
        self.addSubview(self.titleLabel)
        self.addSubview(self.messageLabel)
        self.addSubview(self.buttonView)
        
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[view1]-0-[view2]-0-[view3]-0-|",
            options: NSLayoutFormatOptions.alignAllLeading, metrics: nil,
            views: ["view1": self.titleLabel, "view2": self.messageLabel, "view3": self.buttonView]
        ))
        self.addConstraints(self.titleLabel.horizontalLayout())
        self.addConstraints(self.messageLabel.horizontalLayout())
        self.addConstraints(self.buttonView.horizontalLayout())
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

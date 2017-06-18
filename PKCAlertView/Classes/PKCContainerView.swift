//
//  PKCContainerView.swift
//  Pods
//
//  Created by Kim Guanho on 2017. 6. 17..
//
//

import UIKit

public class PKCContainerView: UIView {
    var titleLabel: PKCAlertLabel!
    var messageLabel: PKCAlertLabel!
    var buttonView: PKCButtonView!
    
    public init(_ title: String, message: String) {
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = UIColor(white: 0.98, alpha: 1)
        self.layer.cornerRadius = 12
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        
        var titleEdge = UIEdgeInsets.pkcAlertDefaultEdge
        var messageEdge = UIEdgeInsets.pkcAlertDefaultEdge
        if title != "" && description != ""{
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
        self.addSubview(self.titleLabel)
        
        self.messageLabel = PKCAlertLabel(message, inset: messageEdge, type: .message)
        self.addSubview(self.messageLabel)
        
        
        
        self.buttonView = PKCButtonView()
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
    
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

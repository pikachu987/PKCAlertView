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

enum PKCAlertLabelType {
    case title, message
}

class PKCAlertLabel: UILabel {
    
    var inset: UIEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7)
    
    public init(_ text: String, inset: UIEdgeInsets, type: PKCAlertLabelType) {
        super.init(frame: CGRect.zero)
        self.text = text
        self.textAlignment = .center
        self.numberOfLines = 0
        self.inset = inset
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if type == .title{
            self.font = UIFont(name: ".SFUIText-Semibold", size: 17)
        }else if type == .message{
            self.font = UIFont.systemFont(ofSize: 14)
        }
    }
    
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, self.inset))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += self.inset.top + self.inset.bottom
            contentSize.width += self.inset.left + self.inset.right
            return contentSize
        }
    }
}

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

public class PKCAlertButton: UIButton {
    var title = ""
    var textColor = UIColor.alertDefault
    
    private var bgColor: UIColor? = nil
    public var highlightColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1)
    
    override public var isHighlighted: Bool {
        didSet {
            if self.bgColor == nil{
                self.bgColor = UIColor.clear
            }
            self.backgroundColor = isHighlighted ? self.highlightColor : self.bgColor
        }
    }
    public override var backgroundColor: UIColor? {
        willSet{
            if self.bgColor == nil{
                self.bgColor = newValue
            }
        }
    }
    
    public init(_ title: String, textColor: UIColor = UIColor.alertDefault) {
        super.init(frame: .zero)
        self.initVars(title, textColor: textColor)
    }
    
    private func initVars(_ title: String, textColor: UIColor = UIColor.alertDefault){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
        self.title = title
        self.textColor = textColor
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        
        self.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .height,
            multiplier: 1,
            constant: 44))
    }
    
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  BaseClasses.swift
//  MvvmBasic
//
//  Created by 김동준 on 2021/10/09.
//

import Foundation
import UIKit

class BaseView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .black
    }
}

class BaseViewController: UIViewController{
    
    override func loadView() {
        super.loadView()
        setup()
        bindViewModel()
    }
    
    public func setup() {
        
    }
    
    public func bindViewModel() {
        
    }
}

extension UILabel{
    func introLabel(text: String, lineHeightMultiply: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        //line height size
        paragraphStyle.lineSpacing = lineHeightMultiply
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        attributedText = attrString
        lineBreakMode = NSLineBreakMode.byTruncatingTail
        numberOfLines = 4
        textAlignment = .left
    }
}


protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input: Input {get}
    var output: Output {get}
}
extension UIView {
    func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    final func animate(duration: CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
        CAMediaTimingFunctionName.default)
        animation.subtype = CATransitionSubtype.fromBottom
        animation.type = CATransitionType.moveIn
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.reveal.rawValue)
    }
    
    final func setShadow(){
        layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 2)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4
        layer.cornerRadius = 15
        clipsToBounds = false
        layer.masksToBounds = false
    }

}

extension UINavigationBar{
    final func setColorWithView(){
        barTintColor = .systemGray6
        isTranslucent = false
        shadowImage = UIImage()
    }
}

extension UIScrollView{
    final func setDefalutView(){
        contentSize.width = frame.width
        contentSize.height = frame.height * 2
        isScrollEnabled = true
        alwaysBounceVertical = true
        
    }
}

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

extension CALayer {
  func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {

    let border = CALayer()

    switch edge {
    case UIRectEdge.top:
        border.frame = CGRect(x: 0, y: 47, width: frame.width, height: thickness)

    case UIRectEdge.bottom:
        border.frame = CGRect(x:0, y: frame.height - thickness, width: frame.width, height:thickness)

    case UIRectEdge.left:
        border.frame = CGRect(x:0, y:0, width: thickness, height: frame.height)

    case UIRectEdge.right:
        border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)

    default: do {}
    }

    border.backgroundColor = color.cgColor

    addSublayer(border)
 }
}

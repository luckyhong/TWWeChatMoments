//
//  TWColorExtension.swift
//  TWWeChatMoments
//
//  Created by 韩继宏 on 2019/10/11.
//  Copyright © 2019 韩继宏. All rights reserved.
//

import UIKit

@objc public extension UIColor {
    
    class var Color929292: UIColor {
        return hexColor(hexString: "929292")
    }
    
    class var Color09aa07: UIColor {
        return hexColor(hexString: "09aa07")
    }
    
    class var ColorHalfClear: UIColor {
        return UIColor(r: 0, g: 0, b: 0, a: 0.5)
    }
    
    convenience init(r: UInt32, g: UInt32, b: UInt32, a: CGFloat = 1.0) {
        self.init(red: CGFloat(r) / 255.0,
                green: CGFloat(g) / 255.0,
                 blue: CGFloat(b) / 255.0,
                alpha: a)
    }
    
    class var random: UIColor {
        return UIColor(r: arc4random_uniform(256),
                       g: arc4random_uniform(256),
                       b: arc4random_uniform(256))
    }
    
    @objc class func hexColor(hexString: String) -> UIColor {
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        if cString.count < 6 { return UIColor.black }
        
        let index = cString.index(cString.endIndex, offsetBy: -6)
        let subString = cString[index...]
        if cString.hasPrefix("0X") { cString = String(subString) }
        if cString.hasPrefix("#") { cString = String(subString) }
        
        if cString.count != 6 { return UIColor.black }
        
        var range: NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(r: r, g: g, b: b)
    }
    
}

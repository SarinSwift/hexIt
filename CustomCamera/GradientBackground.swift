//
//  GradientBackground.swift
//  CustomCamera
//
//  Created by Sarin Swift on 11/4/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func gradientBackgroundColor(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

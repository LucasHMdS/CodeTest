//
//  UIView+Extension.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado da Silva on 23/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import UIKit

extension UIView {
    func setGradient(fromColor: UIColor, toColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [fromColor.cgColor, toColor.cgColor]
        gradientLayer.frame.size = self.frame.size
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

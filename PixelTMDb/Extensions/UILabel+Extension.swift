//
//  UILabel+Extension.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 19/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import UIKit

extension UILabel {
    enum Style {
        case cellMain
        case pageTitle
        case cellSide
        case error
    }
    
    func setStyle(_ style: Style) {
        switch style {
            case .cellMain:
                self.textColor = R.color.mainTextColor()
                self.textAlignment = .left
                self.font = UIFont.systemFont(ofSize: CGFloat(17))
            case .pageTitle:
                self.textColor = R.color.mainTextColor()
                self.textAlignment = .left
                self.font = UIFont.systemFont(ofSize: CGFloat(28))
            case .cellSide:
                self.textColor = R.color.sideTextColor()
                self.textAlignment = .left
                self.font = UIFont.systemFont(ofSize: CGFloat(15))
            case .error:
                self.textColor = R.color.sideTextColor()
                self.textAlignment = .center
                self.font = UIFont.systemFont(ofSize: CGFloat(17))
        }
    }
}

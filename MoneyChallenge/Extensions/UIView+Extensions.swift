//
//  UIView+Extensions.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 14/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(radius: CGFloat? = nil) {
        layer.cornerRadius = radius ?? (min(frame.height, frame.width) / 2)
        layer.masksToBounds = true
    }
}

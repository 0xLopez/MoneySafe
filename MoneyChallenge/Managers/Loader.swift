//
//  Loader.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 15/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

class Loader {
    
    struct Constants {
        static let animationDuration: TimeInterval = 0.3
        static let width: CGFloat = 50
        static var height: CGFloat {
            width
        }
        static let activityIndicatorAlpha: CGFloat = 1.0
        static let backgroundViewAlpha: CGFloat = 0.3
    }
    
    static var backgroundView = UIView()
    static var activityIndicator = NVActivityIndicatorView(frame: .zero, color: .primary)
    
    static func showActivityIndicator(in presenterViewController: UIViewController? = nil) {
        guard !activityIndicator.isAnimating else {
            return
        }
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {
            return
        }
        let container = presenterViewController ?? rootViewController
        addBackgroundView(to: container)
        addActivityIndicator(to: container)
        UIView.animate(withDuration: Constants.animationDuration) {
            self.activityIndicator.alpha = Constants.activityIndicatorAlpha
            self.backgroundView.alpha = Constants.backgroundViewAlpha
        }
    }
    
    private static func addBackgroundView(to viewController: UIViewController) {
        backgroundView = UIView(frame: viewController.view.frame)
        backgroundView.alpha = .zero
        backgroundView.backgroundColor = .white
        viewController.view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: viewController.view.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor).isActive = true
    }
    
    private static func addActivityIndicator(to viewController: UIViewController) {
        activityIndicator.alpha = .zero
        viewController.view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: Constants.width).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor).isActive = true
        activityIndicator.setNeedsDisplay()
        activityIndicator.startAnimating()
    }
    
    static func hideActivityIndicator() {
        guard activityIndicator.isAnimating else {
            return
        }
        activityIndicator.stopAnimating()
        activityIndicator.alpha = .zero
        backgroundView.alpha = .zero
        activityIndicator.removeFromSuperview()
        backgroundView.removeFromSuperview()
    }
}

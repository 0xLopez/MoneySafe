//
//  Utils.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 15/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import UIKit

class Utils {
    enum ViewController {
        case login
        case products
        
        var storyboard: String {
            "Main"
        }
        
        var id: String {
            switch self {
            case .login:
                return "LoginViewController"
            case .products:
                return "ProductsViewController"
            }
        }
    }
    
    static func loadRootScreen(_ screen: ViewController) {
        guard let window = (UIApplication.shared.delegate as? AppDelegate)?.window else {
            return
        }
        window.rootViewController = instantiateViewController(screen)
    }
    
    private static func instantiateViewController(_ screen: ViewController) -> UIViewController {
        let storyboard = UIStoryboard(name: screen.storyboard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: screen.id)
    }
    
    static func showAlert(for error: APIError, in viewController: UIViewController) {
        let alert = UIAlertController(title: "Oops!", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
    }
}

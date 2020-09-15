//
//  AppDelegate.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 14/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setNavigationBarAppearance()
        return true
    }
    
    private func setNavigationBarAppearance() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.primary
        ]
        navigationBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.primary
        ]
    }
}

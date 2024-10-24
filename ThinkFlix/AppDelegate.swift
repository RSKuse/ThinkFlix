//
//  AppDelegate.swift
//  ThinkFlix
//
//  Created by Reuben Simphiwe Kuse on 2024/10/22.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: RegistrationViewController())
        return true
        //        application.statusBarStyle = .lightContent
        //        UIApplication.shared.statusBarStyle = .lightContent
        
    }
}

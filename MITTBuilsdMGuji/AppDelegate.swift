//
//  AppDelegate.swift
//  MITTBuilsdMGuji
//
//  Created by mumu on 2026/1/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame:UIScreen.main.bounds)
        let basic  = UINavigationController.init(rootViewController:  MITTBuilsdMainTabNavigator())
        basic.navigationBar.isHidden = true
        window?.rootViewController = basic
        window?.makeKeyAndVisible()
        return true
    }

   


}


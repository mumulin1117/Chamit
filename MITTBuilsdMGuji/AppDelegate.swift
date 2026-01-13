//
//  AppDelegate.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame:UIScreen.main.bounds)
        
        if MITTBuilsdBlueprintScope.MITTBuilsdActiveSessionKey == nil {
            let basic  = UINavigationController.init(rootViewController:  MITTBuilsdAuthLandingViewController())
            basic.navigationBar.isHidden = true
            window?.rootViewController = basic
        }else{
           
            window?.rootViewController = MITTBuilsdMainTabNavigator()
        }
       
        window?.makeKeyAndVisible()
        return true
    }

   


}


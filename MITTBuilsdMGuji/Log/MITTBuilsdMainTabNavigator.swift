//
//  MITTBuilsdMainTabNavigator.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/12.
//

import UIKit

// MARK: - Core Application Frame
class MITTBuilsdMainTabNavigator: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MITTBuilsdInitializeNavigationNodes()
        MITTBuilsdApplyAestheticStyling()
    }
    
    private func MITTBuilsdInitializeNavigationNodes() {
        let MITTBuilsdHomePortal =  MITTBuilsdDiscoveryFeedController()
       
        
        let MITTBuilsdTrendRadar =  MITTBuilsdSocialPulseController()
       
        
        let MITTBuilsdStudioSpace = UIViewController()
        
        let MITTBuilsdInboxNexus =  MITTBuilsdMesgController()
        
        
        let MITTBuilsdCollectorProfile = MITTBuilsdCollectorProfileontroller()
        
        viewControllers = [
            MITTBuilsdWrapInNav(MITTBuilsdHomePortal, "mITTBuilsdmhome", "mITTBuilsdhomesel"),
            MITTBuilsdWrapInNav(MITTBuilsdTrendRadar, "mITTBuilsdfire", "mITTBuilsdfiresel"),
            MITTBuilsdWrapInNav(MITTBuilsdStudioSpace, "mITTBuilsdadd", "mITTBuilsdadd"),
            MITTBuilsdWrapInNav(MITTBuilsdInboxNexus, "mITTBuilsdmesg", "mITTBuilsdmesgsel"),
            MITTBuilsdWrapInNav(MITTBuilsdCollectorProfile, "mITTBuilsdowned", "mITTBuilsdownedsel")
        ]
    }
    
    private func MITTBuilsdWrapInNav(_ root: UIViewController, _ symbol: String, _ symbolsel: String) -> UINavigationController {
        let MITTBuilsdNav = UINavigationController(rootViewController: root)
        MITTBuilsdNav.navigationBar.isHidden = true
       
        MITTBuilsdNav.tabBarItem.image = UIImage(named: symbol)?.withRenderingMode(.alwaysOriginal)
        MITTBuilsdNav.tabBarItem.selectedImage = UIImage(named: symbolsel)?.withRenderingMode(.alwaysOriginal)
        root.view.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        return MITTBuilsdNav
    }
    
    private func MITTBuilsdApplyAestheticStyling() {
        tabBar.tintColor = UIColor(red: 0.63, green: 0.47, blue: 0.94, alpha: 1.0)
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.backgroundColor = .white
    }
    
    
}


//
//  MITTBuilsdMainTabNavigator.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/12.
//

import UIKit

class MITTBuilsdMainTabNavigator: UITabBarController,UITabBarControllerDelegate {
    private let MITTBuilsdPortalZIndex: Int = 999
        
    private var MITTBuilsdLastActiveIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
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
       
        MITTBuilsdNav.tabBarItem.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: symbol)?.withRenderingMode(.alwaysOriginal)
        MITTBuilsdNav.tabBarItem.selectedImage = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: symbolsel)?.withRenderingMode(.alwaysOriginal)
    
        if symbol == "mITTBuilsdadd" {
            MITTBuilsdNav.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 5, right: 0)
        }
        
        root.view.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        return MITTBuilsdNav
    }
    
    private func MITTBuilsdApplyAestheticStyling() {
        tabBar.tintColor = UIColor(red: 0.63, green: 0.47, blue: 0.94, alpha: 1.0)
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.backgroundColor = .white
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            
            var MITTBuilsdIsVibeAuthenticated = 2
            let MITTBuilsdTargetIndex = viewControllers?.firstIndex(of: viewController) ?? 0
            
            if MITTBuilsdTargetIndex == 2 {
                if MITTBuilsdIsVibeAuthenticated == 2{
                    MITTBuilsdTriggerModalArtifactPortal()
                }
                return false
            }
            
            MITTBuilsdLastActiveIndex = MITTBuilsdTargetIndex
            return true
        }
    private func MITTBuilsdTriggerModalArtifactPortal() {
       
        let MITTBuilsdCreationVC = MITTBuilsdArtPortalController.init(MITTBuilsdEntrySource: MITTBuilsdBlueprintScope.MITTBuilsdMomentGallery.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: ""))
        MITTBuilsdCreationVC.MITTBuilsdIsOverlayTransition = true
        

        let MITTBuilsdRandomSeed = Double.random(in: 0...0.1)
        DispatchQueue.main.asyncAfter(deadline: .now() + MITTBuilsdRandomSeed) {
            self.present(MITTBuilsdCreationVC, animated: true)
        }
        
    }
    
}

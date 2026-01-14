//
//  MITTBuilsdCollectorProfileController.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/13.
//

import UIKit

class MITTBuilsdCollectorProfileontroller: UIViewController {
    private let MITTBuilsdHeroCanvasView = UIImageView(frame: UIScreen.main.bounds)
    private let MITTBuilsdBrandHeader = UIImageView(image: UIImage.init(named: "MITTBuilsdProfile") )
    

  
    private let MITTBuilsdCoinIcon = UIButton()
  
    private let MITTBuilsdGearTrigger = UIButton(type: .custom)
    
    private let MITTBuilsdIdentityCard = UIView()
    private let MITTBuilsdMasterAvatar = UIImageView()
    private let MITTBuilsdEditBadge = UIButton()
    private let MITTBuilsdNameAgeLabel = UILabel()
    private let MITTBuilsdBioIntroLabel = UILabel()
    
    private let MITTBuilsdStatsHub = UIStackView()
    private let MITTBuilsdTabSwitcher = UIStackView()
    private let MITTBuilsdMomentTab = UIButton(type: .custom)
    private let MITTBuilsdVideoTab = UIButton(type: .custom)
    
   
    private var MITTBuilsdCurrentFocusType: Int = 0
    private lazy var MITTBuilsdMesgholderimg: UIImageView = {
        let quickImg = UIImageView.init(image: UIImage.init(named: "updatenodata"))
        quickImg.contentMode = .scaleAspectFit
        quickImg.translatesAutoresizingMaskIntoConstraints = false
        return quickImg
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        MITTBuilsdHeroCanvasView.image = UIImage(named: "mITTBuilsdPageone")
        MITTBuilsdHeroCanvasView.contentMode = .scaleAspectFill
   
        view.addSubview(MITTBuilsdHeroCanvasView)
        MITTBuilsdBrandHeader.contentMode = .scaleToFill
        MITTBuilsdBrandHeader.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdBrandHeader)
      
        MITTBuilsdAssembleStructureNodes()
        MITTBuilsdDefineLayoutGeometry()
    }


   @objc func MITTBuilsdAssemblenet(UIbus:UIButton)  {
       var lasultionPath:String = ""
       if UIbus == MITTBuilsdCoinIcon {
           lasultionPath = MITTBuilsdBlueprintScope.MITTBuilsdWalletTerminal.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: "")
       }
       
       if UIbus == MITTBuilsdGearTrigger {
           lasultionPath = MITTBuilsdBlueprintScope.MITTBuilsdConfigSetting.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: "")
       }
       
       if UIbus == MITTBuilsdEditBadge {
           lasultionPath = MITTBuilsdBlueprintScope.MITTBuilsdProfileEditor.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: "")
       }
       let potritMITTBuilsd = MITTBuilsdArtPortalController.init(MITTBuilsdEntrySource: lasultionPath)
       potritMITTBuilsd.hidesBottomBarWhenPushed = true
       self.navigationController?.pushViewController(potritMITTBuilsd, animated: true)
    }
    
    
    
    @objc func MITTBuilsdAtapRealtionssemblenet(UIbus:UITapGestureRecognizer)  {
        var lasultionPath:String = ""
        if UIbus.view?.tag == 45 {
            lasultionPath = MITTBuilsdBlueprintScope.MITTBuilsdFollowerSphere.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: "")
        }
        
        if UIbus.view?.tag == 445 {
            lasultionPath = MITTBuilsdBlueprintScope.MITTBuilsdFollowerSphere.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: "")
        }
        
        if UIbus.view?.tag == 4445 {
            lasultionPath = MITTBuilsdBlueprintScope.MITTBuilsdProfileEditor.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: "")
        }
        let potritMITTBuilsd = MITTBuilsdArtPortalController.init(MITTBuilsdEntrySource: lasultionPath)
        potritMITTBuilsd.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(potritMITTBuilsd, animated: true)
     }
    
    
    private func MITTBuilsdAssembleStructureNodes() {
         //coin
        MITTBuilsdCoinIcon.setBackgroundImage(UIImage.init(named: "mITTBuilsblanbg"), for: .normal)
        MITTBuilsdCoinIcon.setImage(UIImage.init(named: "BiBiQk"), for: .normal)
        MITTBuilsdCoinIcon.setTitle(" ->", for: .normal)
        MITTBuilsdCoinIcon.setTitleColor(UIColor(red: 0.71, green: 0.38, blue: 0.93, alpha: 1), for: .normal)
        MITTBuilsdCoinIcon.titleLabel?.font = UIFont(name: "Roboto-Black", size: 16)
        MITTBuilsdCoinIcon.addTarget(self, action: #selector(MITTBuilsdAssemblenet(UIbus:)), for: .touchUpInside)
        //set
        MITTBuilsdGearTrigger.setImage(UIImage(named: "mITTBuilssite"), for: .normal)
        MITTBuilsdGearTrigger.addTarget(self, action: #selector(MITTBuilsdAssemblenet(UIbus:)), for: .touchUpInside)
        
        // 2. Identity Card
        MITTBuilsdIdentityCard.backgroundColor = .white
        MITTBuilsdIdentityCard.layer.cornerRadius = 30
        
        MITTBuilsdMasterAvatar.backgroundColor = .systemGray5
        MITTBuilsdMasterAvatar.layer.cornerRadius = 50
        MITTBuilsdMasterAvatar.clipsToBounds = true
      
        MITTBuilsdEditBadge.setImage(UIImage.init(named: "mITTBuilsedit"), for: .normal)
        MITTBuilsdEditBadge.addTarget(self, action: #selector(MITTBuilsdAssemblenet(UIbus:)), for: .touchUpInside)
       
//        MITTBuilsdNameAgeLabel.text = "Anna | 26"
        MITTBuilsdNameAgeLabel.font = .systemFont(ofSize: 20, weight: .bold)
        MITTBuilsdBioIntroLabel.text = "Introduction"
        MITTBuilsdBioIntroLabel.textColor = .lightGray
        MITTBuilsdBioIntroLabel.font = .systemFont(ofSize: 14)
        
        // 3. Stats
        MITTBuilsdStatsHub.axis = .horizontal
        MITTBuilsdStatsHub.distribution = .fillEqually
        MITTBuilsdStatsHub.addArrangedSubview(MITTBuilsdCreateStatUnit(value: "0", title: "Following", labelOndex: 44))
        MITTBuilsdStatsHub.addArrangedSubview(MITTBuilsdCreateStatUnit(value: "0", title: "Followers", labelOndex: 444))
//        MITTBuilsdStatsHub.addArrangedSubview(MITTBuilsdCreateStatUnit(value: "0", title: "Like", labelOndex: 4444))
        
        // 4. Tab Switches
        MITTBuilsdSetupTabButtons()
    }

    private func MITTBuilsdCreateStatUnit(value: String, title: String,labelOndex:Int) -> UIView {
        let MITTBuilsdBox = UIStackView()
        MITTBuilsdBox.axis = .vertical
        MITTBuilsdBox.alignment = .center
        MITTBuilsdBox.tag = labelOndex+1
        let MITTBuilsdV = UILabel()
        MITTBuilsdV.tag = labelOndex
        MITTBuilsdV.text = value
        MITTBuilsdV.font = .systemFont(ofSize: 18, weight: .bold)
        let MITTBuilsdT = UILabel()
        MITTBuilsdT.text = title
        MITTBuilsdT.font = .systemFont(ofSize: 12)
        MITTBuilsdT.textColor = .gray
        MITTBuilsdBox.addArrangedSubview(MITTBuilsdV)
        MITTBuilsdBox.addArrangedSubview(MITTBuilsdT)
        return MITTBuilsdBox
    }

    private func MITTBuilsdSetupTabButtons() {
        MITTBuilsdMomentTab.setTitle("Moment", for: .normal)
        MITTBuilsdVideoTab.setTitle("Video", for: .normal)
        [MITTBuilsdMomentTab, MITTBuilsdVideoTab].forEach {
            $0.layer.cornerRadius = 22
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            $0.addTarget(self, action: #selector(MITTBuilsdSwitchGalleryType(_:)), for: .touchUpInside)
        }
        MITTBuilsdTabSwitcher.axis = .horizontal
        MITTBuilsdTabSwitcher.distribution = .fillEqually
        MITTBuilsdTabSwitcher.spacing = 15
        MITTBuilsdTabSwitcher.addArrangedSubview(MITTBuilsdMomentTab)
        MITTBuilsdTabSwitcher.addArrangedSubview(MITTBuilsdVideoTab)
        MITTBuilsdRefreshSegmentAesthetics()
    }

    @objc private func MITTBuilsdSwitchGalleryType(_ sender: UIButton) {
        MITTBuilsdCurrentFocusType = (sender == MITTBuilsdMomentTab) ? 0 : 1
        let MITTBuilsdHaptic = UIImpactFeedbackGenerator(style: .medium)
        MITTBuilsdHaptic.impactOccurred()
        MITTBuilsdRefreshSegmentAesthetics()
      
    }
    private let MITTBuilsdThemeViolet = UIColor(red: 0.63, green: 0.47, blue: 0.94, alpha: 1.0)
    private func MITTBuilsdRefreshSegmentAesthetics() {
        if MITTBuilsdCurrentFocusType == 0 {
            MITTBuilsdMomentTab.backgroundColor = MITTBuilsdThemeViolet
            MITTBuilsdMomentTab.setTitleColor(.white, for: .normal)
            MITTBuilsdVideoTab.backgroundColor = UIColor(red: 248/255, green: 236/255, blue: 254/255, alpha: 1)
            MITTBuilsdVideoTab.setTitleColor(UIColor(red: 0.71, green: 0.37, blue: 0.98, alpha: 1), for: .normal)
        } else {
            MITTBuilsdMomentTab.backgroundColor = UIColor(red: 248/255, green: 236/255, blue: 254/255, alpha: 1)
            MITTBuilsdMomentTab.setTitleColor(UIColor(red: 0.71, green: 0.37, blue: 0.98, alpha: 1), for: .normal)
            MITTBuilsdVideoTab.backgroundColor = MITTBuilsdThemeViolet
            MITTBuilsdVideoTab.setTitleColor(.white, for: .normal)
        }
    }

    private func MITTBuilsdDefineLayoutGeometry() {
        [
         MITTBuilsdCoinIcon, MITTBuilsdGearTrigger,
         MITTBuilsdIdentityCard, MITTBuilsdMasterAvatar, MITTBuilsdEditBadge, MITTBuilsdNameAgeLabel,
         MITTBuilsdBioIntroLabel, MITTBuilsdStatsHub, MITTBuilsdTabSwitcher, ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
     
        view.addSubview(MITTBuilsdCoinIcon)
       
        view.addSubview(MITTBuilsdGearTrigger)
        
        view.addSubview(MITTBuilsdIdentityCard)
        view.addSubview(MITTBuilsdMasterAvatar)
        view.addSubview(MITTBuilsdEditBadge)
        MITTBuilsdIdentityCard.addSubview(MITTBuilsdNameAgeLabel)
        MITTBuilsdIdentityCard.addSubview(MITTBuilsdBioIntroLabel)
        MITTBuilsdIdentityCard.addSubview(MITTBuilsdStatsHub)
        
        view.addSubview(MITTBuilsdTabSwitcher)
        view.addSubview(MITTBuilsdMesgholderimg)
        NSLayoutConstraint.activate([
            MITTBuilsdBrandHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            MITTBuilsdBrandHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          
            
          
         
            MITTBuilsdCoinIcon.widthAnchor.constraint(equalToConstant: 90),
            MITTBuilsdCoinIcon.heightAnchor.constraint(equalToConstant: 34),
            MITTBuilsdCoinIcon.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            MITTBuilsdCoinIcon.centerYAnchor.constraint(equalTo: MITTBuilsdBrandHeader.centerYAnchor),
            
            
            MITTBuilsdGearTrigger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            MITTBuilsdGearTrigger.centerYAnchor.constraint(equalTo: MITTBuilsdBrandHeader.centerYAnchor),
            
                
            MITTBuilsdIdentityCard.heightAnchor.constraint(equalToConstant: 180),
            MITTBuilsdIdentityCard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            MITTBuilsdIdentityCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            MITTBuilsdIdentityCard.topAnchor.constraint(equalTo: MITTBuilsdBrandHeader.bottomAnchor, constant: 66),
            
            
            
            
            MITTBuilsdMasterAvatar.centerXAnchor.constraint(equalTo: MITTBuilsdIdentityCard.centerXAnchor),
            MITTBuilsdMasterAvatar.topAnchor.constraint(equalTo: MITTBuilsdBrandHeader.bottomAnchor, constant:16),
            MITTBuilsdMasterAvatar.widthAnchor.constraint(equalToConstant: 100),
            MITTBuilsdMasterAvatar.heightAnchor.constraint(equalToConstant: 100),
            
            MITTBuilsdEditBadge.trailingAnchor.constraint(equalTo: MITTBuilsdMasterAvatar.trailingAnchor),
            MITTBuilsdEditBadge.bottomAnchor.constraint(equalTo: MITTBuilsdMasterAvatar.bottomAnchor),
            MITTBuilsdEditBadge.widthAnchor.constraint(equalToConstant: 30),
            MITTBuilsdEditBadge.heightAnchor.constraint(equalToConstant: 30),
            
            MITTBuilsdNameAgeLabel.topAnchor.constraint(equalTo: MITTBuilsdIdentityCard.topAnchor, constant: 60),
            MITTBuilsdNameAgeLabel.centerXAnchor.constraint(equalTo: MITTBuilsdIdentityCard.centerXAnchor),
            
            MITTBuilsdBioIntroLabel.topAnchor.constraint(equalTo: MITTBuilsdNameAgeLabel.bottomAnchor, constant: 5),
            MITTBuilsdBioIntroLabel.centerXAnchor.constraint(equalTo: MITTBuilsdIdentityCard.centerXAnchor),
            
            MITTBuilsdStatsHub.topAnchor.constraint(equalTo: MITTBuilsdBioIntroLabel.bottomAnchor, constant: 25),
            MITTBuilsdStatsHub.leadingAnchor.constraint(equalTo: MITTBuilsdIdentityCard.leadingAnchor, constant: 30),
            MITTBuilsdStatsHub.trailingAnchor.constraint(equalTo: MITTBuilsdIdentityCard.trailingAnchor, constant: -30),
            
            MITTBuilsdTabSwitcher.topAnchor.constraint(equalTo: MITTBuilsdIdentityCard.bottomAnchor, constant: 16),
            MITTBuilsdTabSwitcher.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            MITTBuilsdTabSwitcher.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            MITTBuilsdTabSwitcher.heightAnchor.constraint(equalToConstant: 47),
            
            MITTBuilsdMesgholderimg.topAnchor.constraint(equalTo: MITTBuilsdTabSwitcher.bottomAnchor, constant: 30),
            MITTBuilsdMesgholderimg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MITTBuilsdMesgholderimg.widthAnchor.constraint(equalToConstant: 100),
            MITTBuilsdMesgholderimg.heightAnchor.constraint(equalToConstant: 100)
            
            
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MITTBuilsdCommitAuthRequest()
    }
    private func MITTBuilsdCommitAuthRequest() {
      
        MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdEngage(on: self.view)
        let cantnotUID = UserDefaults.standard.object(forKey: "MITTBuilsdVisualIdentity") as? Int ?? 0
        
        MITTBuilsdSignalBroadcaster.MITTBuilsdDispatchNetworkTask(MITTBuilsdPath: "/iuqvqyz/gfzgtxdhjgwtbxq", MITTBuilsdParams: ["MITTBuilsdShelfOrganization":cantnotUID]) {  andu in
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
            
            guard let MITTBuilsddata = andu as? Dictionary<String,Any> ,
                 
                    let MITTBuilsdreasutl = MITTBuilsddata["data"] as? Dictionary<String,Any>
                    
            else {
                MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdEngage()
                return
            }
         
            self.MITTBuilsdBrandHeader.MITTBuilsdApplyCollectorGraphic(from: MITTBuilsdreasutl["MITTBuilsdDynamicPose"] as? String)
            self.MITTBuilsdBioIntroLabel.text = ( MITTBuilsdreasutl["MITTBuilsdMagneticAccessory"] as? String ?? "No intruduction")
            self.MITTBuilsdNameAgeLabel.text = ( MITTBuilsdreasutl["MITTBuilsdMacroLensShot"] as? String ?? "No name")
            
            if let folloeingcountlbl = self.view.viewWithTag(44) as? UILabel{
                folloeingcountlbl.text = "\( MITTBuilsdreasutl["MITTBuilsdSandingFinish"] as? Int ?? 0)"
            }
            if let likingcountlbl = self.view.viewWithTag(44) as? UILabel{
                likingcountlbl.text = "\( MITTBuilsdreasutl["MITTBuilsdVarnishLayer"] as? Int ?? 0)"
            }
        } MITTBuilsdFailureBlock: {  ertttt in
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(ertttt.localizedDescription)
        }

    }
}



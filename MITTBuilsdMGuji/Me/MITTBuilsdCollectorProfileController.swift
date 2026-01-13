//
//  MITTBuilsdCollectorProfileController.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/13.
//

import UIKit

class MITTBuilsdCollectorProfileontroller: UIViewController {
    private let MITTBuilsdHeroCanvasView = UIImageView(frame: UIScreen.main.bounds)
    private let MITTBuilsdBrandHeader = UIImageView(image: UIImage.init(named: "MITTBuilsdChamit") )
    

  
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


    private func MITTBuilsdAssembleStructureNodes() {
         //coin
        MITTBuilsdCoinIcon.setBackgroundImage(UIImage.init(named: "mITTBuilsblanbg"), for: .normal)
        MITTBuilsdCoinIcon.setImage(UIImage.init(named: "BiBiQk"), for: .normal)
        MITTBuilsdCoinIcon.setTitle(" 0", for: .normal)
        MITTBuilsdCoinIcon.setTitleColor(UIColor(red: 0.71, green: 0.38, blue: 0.93, alpha: 1), for: .normal)
        MITTBuilsdCoinIcon.titleLabel?.font = UIFont(name: "Roboto-Black", size: 16)
        //set
        MITTBuilsdGearTrigger.setImage(UIImage(named: "mITTBuilssite"), for: .normal)
        
        
        // 2. Identity Card
        MITTBuilsdIdentityCard.backgroundColor = .white
        MITTBuilsdIdentityCard.layer.cornerRadius = 30
        
        MITTBuilsdMasterAvatar.backgroundColor = .systemGray5
        MITTBuilsdMasterAvatar.layer.cornerRadius = 50
        MITTBuilsdMasterAvatar.clipsToBounds = true
      
        MITTBuilsdEditBadge.setImage(UIImage.init(named: "mITTBuilsedit"), for: .normal)

        MITTBuilsdNameAgeLabel.text = "Anna | 26"
        MITTBuilsdNameAgeLabel.font = .systemFont(ofSize: 20, weight: .bold)
        MITTBuilsdBioIntroLabel.text = "Introduction"
        MITTBuilsdBioIntroLabel.textColor = .lightGray
        MITTBuilsdBioIntroLabel.font = .systemFont(ofSize: 14)
        
        // 3. Stats
        MITTBuilsdStatsHub.axis = .horizontal
        MITTBuilsdStatsHub.distribution = .fillEqually
        MITTBuilsdStatsHub.addArrangedSubview(MITTBuilsdCreateStatUnit(value: "0", title: "Following"))
        MITTBuilsdStatsHub.addArrangedSubview(MITTBuilsdCreateStatUnit(value: "0", title: "Followers"))
        MITTBuilsdStatsHub.addArrangedSubview(MITTBuilsdCreateStatUnit(value: "0", title: "Like"))
        
        // 4. Tab Switches
        MITTBuilsdSetupTabButtons()
    }

    private func MITTBuilsdCreateStatUnit(value: String, title: String) -> UIView {
        let MITTBuilsdBox = UIStackView()
        MITTBuilsdBox.axis = .vertical
        MITTBuilsdBox.alignment = .center
        let MITTBuilsdV = UILabel()
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
            MITTBuilsdMesgholderimg.widthAnchor.constraint(equalToConstant: 80),
            MITTBuilsdMesgholderimg.heightAnchor.constraint(equalToConstant: 80)
            
            
        ])
    }
}



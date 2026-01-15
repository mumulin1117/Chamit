//
//  MITTBuilsdMatchPortalController.swift
//  MITTBuilsdMGuji
//
//  Created by mumu on 2026/1/14.
//
import UIKit

class MITTBuilsdMatchPortalController: UIViewController {
 
   
    private let MITTBuilsdNebulaBackground = UIImageView(frame: UIScreen.main.bounds)
    lazy var MITTBuilsdNebfilter:  UIButton = {
        let MITTBuilsdcommuti = UIButton.init()
        MITTBuilsdcommuti.setImage(MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "MITTBuilsdNebfilter"), for: .normal)
        MITTBuilsdcommuti.translatesAutoresizingMaskIntoConstraints = false
        return MITTBuilsdcommuti
    }()
    private let MITTBuilsdCoinIcon = UIButton()
    
    private let MITTBuilsdRadialMatchNode = UIButton()
    private let MITTBuilsdHistoryTrackView = UITableView()
    private let MITTBuilsdHeartGridContainer = UIView()
    
    
    private var MITTBuilsdArtisanRoster: [String] = ["mITTBuilsdRandom0","mITTBuilsdRandom1","mITTBuilsdRandom2","mITTBuilsdRandom3","mITTBuilsdRandom4"]
    private var MITTBuilsdLogArchives: [[String: Any]] = []
    private var MITTBuilsdPulseTimer: Timer?
    private var MITTBuilsdIsEngagedInSearch: Bool = false
    
    private let MITTBuilsdThemeViolet = UIColor(red: 0.85, green: 0.65, blue: 1.0, alpha: 1.0)
    private let MITTBuilsdNeonAmethyst = UIColor(red: 0.63, green: 0.47, blue: 0.94, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        MITTBuilsdCoinIcon.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdRadialMatchNode.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdHistoryTrackView.translatesAutoresizingMaskIntoConstraints = false
        
        MITTBuilsdHeartGridContainer.translatesAutoresizingMaskIntoConstraints = false
        
        MITTBuilsdConstructAestheticLayer()
        
        MITTBuilsdGenerateOrbitalNodes()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        MITTBuilsdCommitAuthRequest()
    }
    
    @objc func MITTBuilsdAssemblenet(UIbus:UIButton)  {
        var lasultionPath:String = ""
        if UIbus == MITTBuilsdCoinIcon {
            lasultionPath = MITTBuilsdBlueprintScope.MITTBuilsdWalletTerminal.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: "")
        }
        
        if UIbus == MITTBuilsdNebfilter {
            lasultionPath = MITTBuilsdBlueprintScope.MITTBuilsdFilterMatrix.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: "")
        }
        
//        if UIbus == MITTBuilsdRadialMatchNode {
//            lasultionPath = MITTBuilsdBlueprintScope.MITTBuilsdVisualPicker.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: "")
//        }
        let potritMITTBuilsd = MITTBuilsdArtPortalController.init(MITTBuilsdEntrySource: lasultionPath)
        potritMITTBuilsd.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(potritMITTBuilsd, animated: true)
     }
     
    
    private func MITTBuilsdConstructAestheticLayer() {
        view.backgroundColor = .white
       
        self.title = "Heartbeat Match"
        self.navigationController?.navigationBar.barTintColor = .black
        MITTBuilsdNebulaBackground.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "MITTBuilsdNebulaBackground")
      
        view.addSubview(MITTBuilsdNebulaBackground)
        view.addSubview(MITTBuilsdNebfilter)
        view.addSubview(MITTBuilsdCoinIcon)
        view.addSubview(MITTBuilsdHeartGridContainer)
        MITTBuilsdHeartGridContainer.addSubview(MITTBuilsdRadialMatchNode)
        
        view.addSubview(MITTBuilsdHistoryTrackView)
       
        
       
        
        
        MITTBuilsdNebfilter.addTarget(self, action: #selector(MITTBuilsdTriggerPreferencePanel), for: .touchUpInside)
        
    
        MITTBuilsdCoinIcon.setBackgroundImage(MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "mITTBuilsblanbg"), for: .normal)
        MITTBuilsdCoinIcon.setImage(MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "BiBiQk"), for: .normal)
        MITTBuilsdCoinIcon.setTitle(" ->", for: .normal)
        MITTBuilsdCoinIcon.setTitleColor(UIColor(red: 0.71, green: 0.38, blue: 0.93, alpha: 1), for: .normal)
        MITTBuilsdCoinIcon.titleLabel?.font = UIFont(name: "Roboto-Black", size: 16)
        MITTBuilsdCoinIcon.addTarget(self, action: #selector(MITTBuilsdAssemblenet(UIbus:)), for: .touchUpInside)
    
        
        
        MITTBuilsdRadialMatchNode.setBackgroundImage(MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "MITTBuilsdRadialMatchicon"), for: .normal)
        MITTBuilsdRadialMatchNode.setBackgroundImage(MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "MITTBuilsdRadialMatchiconcancel"), for: .selected)
        
        MITTBuilsdRadialMatchNode.addTarget(self, action: #selector(MITTBuilsdToggleSearchAura), for: .touchUpInside)
        
        MITTBuilsdHistoryTrackView.rowHeight = 90
        MITTBuilsdHistoryTrackView.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdHistoryTrackView.backgroundColor = .white
        MITTBuilsdHistoryTrackView.layer.cornerRadius = 30
        MITTBuilsdHistoryTrackView.delegate = self
        MITTBuilsdHistoryTrackView.dataSource = self
        MITTBuilsdHistoryTrackView.separatorStyle = .none
        MITTBuilsdHistoryTrackView.register( MITTBuilsdHistoryTrackCell.self, forCellReuseIdentifier: "MITTBuilsdHistoryTrackCell")
        NSLayoutConstraint.activate([
            MITTBuilsdNebfilter.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            MITTBuilsdNebfilter.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16),
            MITTBuilsdNebfilter.widthAnchor.constraint(equalToConstant: 40),
            MITTBuilsdNebfilter.heightAnchor.constraint(equalToConstant: 40),
            
            MITTBuilsdCoinIcon.widthAnchor.constraint(equalToConstant: 90),
            MITTBuilsdCoinIcon.heightAnchor.constraint(equalToConstant: 34),
            MITTBuilsdCoinIcon.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            MITTBuilsdCoinIcon.centerYAnchor.constraint(equalTo: MITTBuilsdNebfilter.centerYAnchor),
            
            MITTBuilsdHeartGridContainer.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            MITTBuilsdHeartGridContainer.heightAnchor.constraint(equalToConstant: 300),
            MITTBuilsdHeartGridContainer.topAnchor.constraint(equalTo: MITTBuilsdCoinIcon.bottomAnchor),
            MITTBuilsdHeartGridContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            MITTBuilsdRadialMatchNode.centerYAnchor.constraint(equalTo: MITTBuilsdHeartGridContainer.centerYAnchor),
            MITTBuilsdRadialMatchNode.centerXAnchor.constraint(equalTo: MITTBuilsdHeartGridContainer.centerXAnchor, constant: 0),
            MITTBuilsdRadialMatchNode.widthAnchor.constraint(equalToConstant: 100),
            MITTBuilsdRadialMatchNode.heightAnchor.constraint(equalToConstant: 100),
        
            MITTBuilsdHistoryTrackView.topAnchor.constraint(equalTo: MITTBuilsdHeartGridContainer.bottomAnchor, constant: 38),
            MITTBuilsdHistoryTrackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            MITTBuilsdHistoryTrackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            MITTBuilsdHistoryTrackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
       
    }
    

    
    private func MITTBuilsdGenerateOrbitalNodes() {
        let MITTBuilsdRadius: CGFloat = 130
        let MITTBuilsdCenter = CGPoint(x: view.frame.width/2, y: view.frame.width/2)
        
        for (MITTBuilsdIndex, MITTBuilsdData) in MITTBuilsdArtisanRoster.enumerated() {
            let MITTBuilsdAngle = CGFloat(MITTBuilsdIndex) * (CGFloat.pi * 2 / CGFloat(MITTBuilsdArtisanRoster.count))
            let MITTBuilsdPosX = MITTBuilsdCenter.x + MITTBuilsdRadius * cos(MITTBuilsdAngle)
            let MITTBuilsdPosY = MITTBuilsdCenter.y + MITTBuilsdRadius * sin(MITTBuilsdAngle)
            
            let MITTBuilsdAvatarNode = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
            MITTBuilsdAvatarNode.center = CGPoint(x: MITTBuilsdPosX, y: MITTBuilsdPosY + 80)
            MITTBuilsdAvatarNode.layer.cornerRadius = 35
            MITTBuilsdAvatarNode.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdData)
            MITTBuilsdAvatarNode.clipsToBounds = true
            MITTBuilsdAvatarNode.layer.borderWidth = 2
            MITTBuilsdAvatarNode.layer.borderColor = UIColor.white.cgColor
            MITTBuilsdAvatarNode.backgroundColor = .lightGray
            MITTBuilsdAvatarNode.tag = 100 + MITTBuilsdIndex
            view.addSubview(MITTBuilsdAvatarNode)
        }
    }
    
    
    @objc private func MITTBuilsdToggleSearchAura() {
        MITTBuilsdIsEngagedInSearch.toggle()
        
        if MITTBuilsdIsEngagedInSearch {
            MITTBuilsdRadialMatchNode.isSelected = true
            MITTBuilsdPulseTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                self.MITTBuilsdIterateOrbitalAesthetics()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.MITTBuilsdPushToSynergyView()
            }
        } else {
            MITTBuilsdRadialMatchNode.isSelected = false
            MITTBuilsdPulseTimer?.invalidate()
        }
    }
    
    private func MITTBuilsdIterateOrbitalAesthetics() {
        for MITTBuilsdIndex in 0..<MITTBuilsdArtisanRoster.count {
            if let MITTBuilsdNode = MITTBuilsdHeartGridContainer.viewWithTag(100 + MITTBuilsdIndex) {
                MITTBuilsdNode.transform = MITTBuilsdNode.transform.rotated(by: 0.05)
            }
        }
    }
    
    @objc private func MITTBuilsdTriggerPreferencePanel() {
        let MITTBuilsdTarget = UIViewController()
        MITTBuilsdTarget.view.backgroundColor = MITTBuilsdThemeViolet
        self.present(MITTBuilsdTarget, animated: true)
    }
    
    @objc private func MITTBuilsdOpenTreasureStore() {
        let MITTBuilsdStore = UIViewController()
        MITTBuilsdStore.view.backgroundColor = .orange
        self.show(MITTBuilsdStore, sender: nil)
    }
    
    private func MITTBuilsdPushToSynergyView() {
        MITTBuilsdPulseTimer?.invalidate()
        let  lasultionPath = MITTBuilsdBlueprintScope.MITTBuilsdVisualPicker.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: "")
        let potritMITTBuilsd = MITTBuilsdArtPortalController.init(MITTBuilsdEntrySource: lasultionPath)
        potritMITTBuilsd.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(potritMITTBuilsd, animated: true)
    }
}

extension MITTBuilsdMatchPortalController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        24
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        UIImageView(image: MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "historyTitle"))
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MITTBuilsdLogArchives.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MITTBuilsdIdentifier = "MITTBuilsdHistoryTrackCell"
        var MITTBuilsdCell = tableView.dequeueReusableCell(withIdentifier: MITTBuilsdIdentifier)
        if MITTBuilsdCell == nil {
            MITTBuilsdCell = UITableViewCell(style: .subtitle, reuseIdentifier: MITTBuilsdIdentifier)
        }
        let MITTBuilsdRecord = MITTBuilsdLogArchives[indexPath.row]
        MITTBuilsdCell?.textLabel?.text = MITTBuilsdRecord["MITTBuilsdAmbientOcclusion"] as? String
        MITTBuilsdCell?.detailTextLabel?.text = "Matching successful!"
        MITTBuilsdCell?.detailTextLabel?.textColor = MITTBuilsdNeonAmethyst
        MITTBuilsdCell?.imageView?.MITTBuilsdApplyCollectorGraphic(from: MITTBuilsdLogArchives[indexPath.row]["MITTBuilsdSpecularityMap"] as? String)
//        MITTBuilsdCell?.imageView?.frame.size = CGSize(width: 30, height: 30)
        MITTBuilsdCell?.imageView?.contentMode = .scaleAspectFill
//                MITTBuilsdCell?.imageView?.layer.cornerRadius = 20
        MITTBuilsdCell?.imageView?.layer.masksToBounds = true
//        MITTBuilsdCell?.imageView?.tintColor = MITTBuilsdThemeViolet
//        
        let MITTBuilsdReactionIcon = UIImageView(image: MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "heart.fillSuccess"))
     
        MITTBuilsdCell?.accessoryView = MITTBuilsdReactionIcon
        
        return MITTBuilsdCell!
    }
    
    private func MITTBuilsdCommitAuthRequest() {
      
        MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdEngage(on: self.view)
       
        MITTBuilsdSignalBroadcaster.MITTBuilsdDispatchNetworkTask(MITTBuilsdPath: "/headijtstfcjrz/jopctjeunadhmk", MITTBuilsdParams: ["MITTBuilsdHighPolyDetail":1]) {  andu in//
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
            
            guard let MITTBuilsddata = andu as? Dictionary<String,Any> ,
                 
                    let MITTBuilsdreasutl = MITTBuilsddata[MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"")"data"] as? Array<Dictionary<String,Any>>
                    
            else {
                MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdEngage()
                return
            }
            self.MITTBuilsdLogArchives = MITTBuilsdreasutl
          
        
            self.MITTBuilsdHistoryTrackView.reloadData()
            
        } MITTBuilsdFailureBlock: {  ertttt in
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(ertttt.localizedDescription)
        }

    }
    
}


class MITTBuilsdHistoryTrackCell: UITableViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 1. 定义固化的尺寸常量
        let MITTBuilsdGraphicDimension: CGFloat = 40.0
        let MITTBuilsdCenterOffset = (self.contentView.frame.height - MITTBuilsdGraphicDimension) / 2
        
        // 2. 强制锁定渲染框架 (Aura Frame)
        if let MITTBuilsdVisualNode = self.imageView {
            MITTBuilsdVisualNode.frame = CGRect(x: 15, y: MITTBuilsdCenterOffset, width: MITTBuilsdGraphicDimension, height: MITTBuilsdGraphicDimension)
            
            // 3. 执行几何圆角固化 (Geometry Curing)
            let MITTBuilsdCurvature = MITTBuilsdGraphicDimension / 2
            MITTBuilsdVisualNode.layer.cornerRadius = MITTBuilsdCurvature
            MITTBuilsdVisualNode.layer.masksToBounds = true
            MITTBuilsdVisualNode.contentMode = .scaleAspectFill
        }
        
        // 4. 微调文本边距，防止重叠
        let MITTBuilsdTextPadding: CGFloat = 70.0
        self.textLabel?.frame.origin.x = MITTBuilsdTextPadding
        self.detailTextLabel?.frame.origin.x = MITTBuilsdTextPadding
    }
}

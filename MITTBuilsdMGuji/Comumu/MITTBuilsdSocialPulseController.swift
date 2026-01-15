//
//  MITTBuilsdSocialPulseController.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/12.
//

import UIKit


class MITTBuilsdSocialPulseController: UIViewController, MITTBuilsdMatchCardCellDelegate {
    private var MITTBuilsdActiveFeedType: Int = 0
    private var MITTBuilsdTopActivys:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
   
    func MITTBuilsdreloadSections(with: Int) {
        self.MITTBuilsdActiveFeedType = with
        MITTBuilsdCommitAuthRequest()
    }
    
    private let MITTBuilsdHeroCanvasView = UIImageView(frame: UIScreen.main.bounds)
    private let MITTBuilsdBrandHeader = UIImageView(image: MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "MITTBuilsdcommu") )
    
    private let MITTBuilsdAvatarLead = UIImageView.init(image: MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "LightMITTBuilsdlogo"))
    
    private var MITTBuilsdPortalCanvas: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
  
    @objc func MITTBuilsdActionHubTriggeraction()  {
        let potritMITTBuilsd = MITTBuilsdArtPortalController.init(MITTBuilsdEntrySource: MITTBuilsdBlueprintScope.MITTBuilsdMatchCenter.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: ""))
        potritMITTBuilsd.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(potritMITTBuilsd, animated: true)
        
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MITTBuilsdHeroCanvasView.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "mITTBuilsdPageone")
        MITTBuilsdHeroCanvasView.contentMode = .scaleAspectFill
   
        view.addSubview(MITTBuilsdHeroCanvasView)
        MITTBuilsdInitializeBaseAesthetics()
        MITTBuilsdConstructInterfaceNodes()
        MITTBuilsdApplyGeometryConstraints()
        MITTBuilsdCommitAuthRequest()
    }
    private func MITTBuilsdConstructInterfaceNodes() {
        // 确保画布填充整个屏幕
        MITTBuilsdPortalCanvas.translatesAutoresizingMaskIntoConstraints = false
        
        // 注册所有 Cell 节点
        MITTBuilsdPortalCanvas.register(MITTBuilsdMatchCardCell.self, forCellWithReuseIdentifier: "Match")
        MITTBuilsdPortalCanvas.register(MITTBuilsdMomentFeedCell.self, forCellWithReuseIdentifier: "Moment")
    }
    private func MITTBuilsdInitializeBaseAesthetics() {
        view.backgroundColor = .white
        
        MITTBuilsdBrandHeader.contentMode = .scaleToFill
        MITTBuilsdBrandHeader.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdBrandHeader)

        MITTBuilsdAvatarLead.backgroundColor = .systemGray5
        MITTBuilsdAvatarLead.layer.cornerRadius = 18
        MITTBuilsdAvatarLead.clipsToBounds = true
        MITTBuilsdAvatarLead.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdAvatarLead)
        
        MITTBuilsdPortalCanvas.backgroundColor = .clear
        MITTBuilsdPortalCanvas.delegate = self
        MITTBuilsdPortalCanvas.dataSource = self
        MITTBuilsdPortalCanvas.register(MITTBuilsdMatchCardCell.self, forCellWithReuseIdentifier: "Match")
        MITTBuilsdPortalCanvas.register(MITTBuilsdMomentFeedCell.self, forCellWithReuseIdentifier: "Moment")
        MITTBuilsdPortalCanvas.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdPortalCanvas)

    }

   

  
    private func MITTBuilsdApplyGeometryConstraints() {
        NSLayoutConstraint.activate([
            MITTBuilsdBrandHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            MITTBuilsdBrandHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            MITTBuilsdAvatarLead.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            MITTBuilsdAvatarLead.centerYAnchor.constraint(equalTo: MITTBuilsdBrandHeader.centerYAnchor),
            MITTBuilsdAvatarLead.widthAnchor.constraint(equalToConstant: 36),
            MITTBuilsdAvatarLead.heightAnchor.constraint(equalToConstant: 36),
            
            MITTBuilsdPortalCanvas.topAnchor.constraint(equalTo: MITTBuilsdBrandHeader.bottomAnchor, constant: 15),
            MITTBuilsdPortalCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            MITTBuilsdPortalCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            MITTBuilsdPortalCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
           
        ])
    }


}

extension MITTBuilsdSocialPulseController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return indexPath.section == 0 ? CGSize(width: UIScreen.main.bounds.width - 32, height: 110 + 47 + 32) :  CGSize(width: UIScreen.main.bounds.width - 32, height: 243)
         
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 2 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : MITTBuilsdTopActivys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Match", for: indexPath) as! MITTBuilsdMatchCardCell
            cell.delegateMITTBuilsd = self
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Moment", for: indexPath) as! MITTBuilsdMomentFeedCell
        cell.MITTBuilsdPopulateFakeData(isVideo: MITTBuilsdActiveFeedType == 1, infoData: MITTBuilsdTopActivys[indexPath.row])
        cell.MITTBuilsdcommuti.addTarget(self, action: #selector(MITTBAlert), for: .touchUpInside)
        return cell
    }
   @objc func MITTBAlert(){
        let potritMITTBuilsd = MITTBuilsdArtPortalController.init(MITTBuilsdEntrySource: MITTBuilsdBlueprintScope.MITTBuilsdReportEntry.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: ""))
        potritMITTBuilsd.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(potritMITTBuilsd, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            MITTBuilsdActionHubTriggeraction()
            return
        }
        
        MITTBuilsdNavigateToDetail(at: indexPath.row)
    }
    
    private func MITTBuilsdNavigateToDetail(at index: Int) {
        if  self.MITTBuilsdActiveFeedType == 0  ,let dumnId = MITTBuilsdTopActivys[index]["MITTBuilsdCustomizedSkin"] as? Int{
            let potritMITTBuilsd = MITTBuilsdArtPortalController.init(MITTBuilsdEntrySource: MITTBuilsdBlueprintScope.MITTBuilsdVaultDetail.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: "\(dumnId)"))
            potritMITTBuilsd.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(potritMITTBuilsd, animated: true)
            return
            
           
            
            
        }
        if  self.MITTBuilsdActiveFeedType == 1  ,let dumnId = MITTBuilsdTopActivys[index]["MITTBuilsdCustomizedSkin"] as? Int{
            let potritMITTBuilsd = MITTBuilsdArtPortalController.init(MITTBuilsdEntrySource: MITTBuilsdBlueprintScope.MITTBuilsdVaultDetail.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: "\(dumnId)&type=2"))
            potritMITTBuilsd.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(potritMITTBuilsd, animated: true)
        }
       
       
    }
    
    private func MITTBuilsdCommitAuthRequest() {
      
        MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdEngage(on: self.view)
       
        MITTBuilsdSignalBroadcaster.MITTBuilsdDispatchNetworkTask(MITTBuilsdPath: "/hmbrvmcxz/yfmqdoyxig", MITTBuilsdParams: ["MITTBuilsdExhibitionPiece":"87531697","MITTBuilsdDioramaBase":1,"MITTBuilsdModularStage":20]) {  andu in
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
            
            
            guard let MITTBuilsddata = andu as? Dictionary<String,Any> ,
                 
                    let MITTBuilsdreasutl = MITTBuilsddata[MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"")"data"] as? Array<Dictionary<String,Any>>
                    
            else {
                MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdEngage()
                return
            }
         
            self.MITTBuilsdTopActivys = MITTBuilsdreasutl.filter({ abbody in
                if  self.MITTBuilsdActiveFeedType == 0  {
                    return abbody["MITTBuilsdRareChase"] as?  String  == nil
                }
                return abbody["MITTBuilsdRareChase"] as?  String  != nil
            })
        
            self.MITTBuilsdPortalCanvas.reloadData()
            
        } MITTBuilsdFailureBlock: {  ertttt in
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(ertttt.localizedDescription)
        }

    }
    
}



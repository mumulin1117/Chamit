//
//  MITTBuilsdSocialPulseController.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/12.
//

import UIKit


class MITTBuilsdSocialPulseController: UIViewController, MITTBuilsdMatchCardCellDelegate {
    private var MITTBuilsdActiveFeedType: Int = 0
    
    func MITTBuilsdreloadSections(with: Int) {
        self.MITTBuilsdActiveFeedType = with
        self.MITTBuilsdPortalCanvas.reloadSections(IndexSet(integer: 1))
    }
    
    private let MITTBuilsdHeroCanvasView = UIImageView(frame: UIScreen.main.bounds)
    private let MITTBuilsdBrandHeader = UIImageView(image: UIImage.init(named: "MITTBuilsdcommu") )
    
    private let MITTBuilsdAvatarLead = UIImageView()
    
    private var MITTBuilsdPortalCanvas: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
  
    
  
//    init() {
//        let MITTBuilsdLayout = UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
//            if section == 0 {
//                return MITTBuilsdSocialPulseController.MITTBuilsdCraftMatchRollSection()
//            } else {
//                return MITTBuilsdSocialPulseController.MITTBuilsdCraftFeedFlowSection()
//            }
//        }
//
//        super.init(nibName: nil, bundle: nil)
//    }

//    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MITTBuilsdHeroCanvasView.image = UIImage(named: "mITTBuilsdPageone")
        MITTBuilsdHeroCanvasView.contentMode = .scaleAspectFill
   
        view.addSubview(MITTBuilsdHeroCanvasView)
        MITTBuilsdInitializeBaseAesthetics()
        MITTBuilsdConstructInterfaceNodes()
        MITTBuilsdApplyGeometryConstraints()
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

//    static func MITTBuilsdCraftMatchRollSection() -> NSCollectionLayoutSection {
//        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .absolute(110 + 47 + 32)), subitems: [item])
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .groupPagingCentered
//        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//        return section
//    }
//
//    static func MITTBuilsdCraftFeedFlowSection() -> NSCollectionLayoutSection {
//        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(400)))
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(400)), subitems: [item])
//        let section = NSCollectionLayoutSection(group: group)
//        section.interGroupSpacing = 20
//        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 100, trailing: 15)
//        return section
//    }
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
        return section == 0 ? 1 : 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Match", for: indexPath) as! MITTBuilsdMatchCardCell
            cell.delegateMITTBuilsd = self
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Moment", for: indexPath) as! MITTBuilsdMomentFeedCell
        cell.MITTBuilsdPopulateFakeData(isVideo: MITTBuilsdActiveFeedType == 1)
        return cell
    }
}



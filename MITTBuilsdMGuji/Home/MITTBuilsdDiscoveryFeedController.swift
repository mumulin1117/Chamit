//
//  MITTBuilsdDiscoveryFeedController.swift
//  MITTBuilsdMGuji
//
//  Created by mumu on 2026/1/12.
//

import UIKit

class MITTBuilsdDiscoveryFeedController: UIViewController {
    private let MITTBuilsdHeroPageIndicator = UIPageControl()
    private let MITTBuilsdHeroTotalCount: Int = 3 // 对应 Section 0 的 item 数量
    
    private let MITTBuilsdHeroCanvasView = UIImageView(frame: UIScreen.main.bounds)
    private let MITTBuilsdBrandHeader = UIImageView(image: UIImage.init(named: "MITTBuilsdChamit") )
    private let MITTBuilsdActionHubTrigger = UIButton(type: .system)
    private let MITTBuilsdAvatarThumbnail = UIImageView()
    
    private var MITTBuilsdMainScrollCanvas: UICollectionView!
    private let MITTBuilsdInterestFilterStrip = ["All", "ToyLink", "FigiBuddy", "ToyVibe"]
   
    private var MITTBuilsdActiveCategoryIndex: Int = 0
    
    // Virtual data source for category switching
    private var MITTBuilsdCurrentDisplayItems: Int = 10
    private func MITTBuilsdConfigurePageMonitor() {
        MITTBuilsdHeroPageIndicator.numberOfPages = MITTBuilsdHeroTotalCount
        MITTBuilsdHeroPageIndicator.currentPage = 0
        MITTBuilsdHeroPageIndicator.currentPageIndicatorTintColor = UIColor(red: 0.63, green: 0.47, blue: 0.94, alpha: 1.0)
        MITTBuilsdHeroPageIndicator.pageIndicatorTintColor = UIColor.systemGray5
        MITTBuilsdHeroPageIndicator.isUserInteractionEnabled = false // 仅用于展示，由滚动触发
        MITTBuilsdHeroPageIndicator.transform = CGAffineTransform(scaleX: 0.8, y: 0.8) // 缩小尺寸更显精致
        MITTBuilsdHeroPageIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdHeroPageIndicator)
    }
    
    private func MITTBuilsdApplyIndicatorConstraints() {
        NSLayoutConstraint.activate([
            MITTBuilsdHeroPageIndicator.topAnchor.constraint(equalTo: MITTBuilsdMainScrollCanvas.topAnchor, constant: 30), // 适配 Banner 高度 320
            MITTBuilsdHeroPageIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        MITTBuilsdHeroCanvasView.image = UIImage(named: "mITTBuilsdPageone")
        MITTBuilsdHeroCanvasView.contentMode = .scaleAspectFill
   
        view.addSubview(MITTBuilsdHeroCanvasView)
        MITTBuilsdInitializeAestheticBase()
        MITTBuilsdSetupCollectionSurface()
        MITTBuilsdDefineLayoutArchitecture()
        
        MITTBuilsdConfigurePageMonitor()
        MITTBuilsdApplyIndicatorConstraints()
    }

    private func MITTBuilsdInitializeAestheticBase() {
        view.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        
        MITTBuilsdBrandHeader.contentMode = .scaleToFill
        MITTBuilsdBrandHeader.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdBrandHeader)
      
       
        MITTBuilsdActionHubTrigger.setImage(UIImage(named: "mITTBuilsdPageAdd"), for: .normal)
        
        MITTBuilsdActionHubTrigger.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdActionHubTrigger.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdActionHubTrigger)
        
        MITTBuilsdAvatarThumbnail.backgroundColor = .lightGray
        MITTBuilsdAvatarThumbnail.layer.cornerRadius = 18
        MITTBuilsdAvatarThumbnail.clipsToBounds = true
        MITTBuilsdAvatarThumbnail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdAvatarThumbnail)
    }

    private func MITTBuilsdSetupCollectionSurface() {
        let MITTBuilsdLayoutScheme = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            if sectionIndex == 0 {
                return self.MITTBuilsdCreateHeroHeroSection()
            } else if sectionIndex == 1 {
                return self.MITTBuilsdCreateHorizontalFilterSection()
            } else {
                return self.MITTBuilsdCreateDualColumnShowcaseSection()
            }
        }

        MITTBuilsdMainScrollCanvas = UICollectionView(frame: .zero, collectionViewLayout: MITTBuilsdLayoutScheme)
        MITTBuilsdMainScrollCanvas.backgroundColor = .clear
        MITTBuilsdMainScrollCanvas.delegate = self
        MITTBuilsdMainScrollCanvas.dataSource = self
        
        MITTBuilsdMainScrollCanvas.register(MITTBuilsdHeroEventCell.self, forCellWithReuseIdentifier: "Hero")
        MITTBuilsdMainScrollCanvas.register(MITTBuilsdInterestTagCell.self, forCellWithReuseIdentifier: "Tag")
        MITTBuilsdMainScrollCanvas.register(MITTBuilsdToyShowcaseCell.self, forCellWithReuseIdentifier: "Showcase")
        
        MITTBuilsdMainScrollCanvas.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdMainScrollCanvas)
    }

    private func MITTBuilsdDefineLayoutArchitecture() {
        NSLayoutConstraint.activate([
            MITTBuilsdBrandHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            MITTBuilsdBrandHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            MITTBuilsdAvatarThumbnail.centerYAnchor.constraint(equalTo: MITTBuilsdBrandHeader.centerYAnchor),
            MITTBuilsdAvatarThumbnail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            MITTBuilsdAvatarThumbnail.widthAnchor.constraint(equalToConstant: 36),
            MITTBuilsdAvatarThumbnail.heightAnchor.constraint(equalToConstant: 36),
            
            MITTBuilsdActionHubTrigger.centerYAnchor.constraint(equalTo: MITTBuilsdBrandHeader.centerYAnchor),
            MITTBuilsdActionHubTrigger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            MITTBuilsdActionHubTrigger.widthAnchor.constraint(equalToConstant: 30),
            MITTBuilsdActionHubTrigger.heightAnchor.constraint(equalToConstant: 30),
            
            MITTBuilsdMainScrollCanvas.topAnchor.constraint(equalTo: MITTBuilsdBrandHeader.bottomAnchor, constant: 10),
            MITTBuilsdMainScrollCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            MITTBuilsdMainScrollCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            MITTBuilsdMainScrollCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - Section Factories
    private func MITTBuilsdCreateHeroHeroSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(320)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 15
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15)
        
        // 【新增核心代码】专门处理分页指示器同步
        section.visibleItemsInvalidationHandler = { [weak self] (items, offset, env) in
            guard let self = self else { return }
            let MITTBuilsdPageWidth = env.container.contentSize.width
            let MITTBuilsdPageIndex = Int(round(offset.x / MITTBuilsdPageWidth))
            DispatchQueue.main.async {
                self.MITTBuilsdHeroPageIndicator.currentPage = MITTBuilsdPageIndex
            }
        }
        
        return section
    }

    private func MITTBuilsdCreateHorizontalFilterSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(44)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15)
        return section
    }

    private func MITTBuilsdCreateDualColumnShowcaseSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.65)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 7, bottom: 20, trailing: 7)
        return section
    }
}

// MARK: - Data Source Logic
extension MITTBuilsdDiscoveryFeedController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 3 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return 3 }
        if section == 1 { return MITTBuilsdInterestFilterStrip.count }
        return MITTBuilsdCurrentDisplayItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "Hero", for: indexPath)
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tag", for: indexPath) as! MITTBuilsdInterestTagCell
            let MITTBuilsdIsActive = (indexPath.item == MITTBuilsdActiveCategoryIndex)
            cell.MITTBuilsdConfigureAesthetic(MITTBuilsdInterestFilterStrip[indexPath.item], active: MITTBuilsdIsActive)
            return cell
        } else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "Showcase", for: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            // 1. 更新选中的索引
            MITTBuilsdActiveCategoryIndex = indexPath.item
            
            // 2. 模拟数据变更（这里必须先改变数据源，再同步 UI）
            // 在实际业务中，这里会触发一次 MITTBuilsdFetchToyData 异步请求
            MITTBuilsdCurrentDisplayItems = Int.random(in: 4...12)
            
            // 3. 触觉反馈增强体验
            let MITTBuilsdHapticNode = UISelectionFeedbackGenerator()
            MITTBuilsdHapticNode.selectionChanged()
            
            // 4. 【核心修复】直接使用 reloadData 避免 Section 间的数据量冲突
            // 这种方式最稳定，且不会触发 batch update 的不一致检测
            collectionView.reloadData()
            
            // 5. 确保选中的标签滚动到视觉中心
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            print("MITTBuilsd: Switched category to \(MITTBuilsdInterestFilterStrip[indexPath.item])")
        } else if indexPath.section == 2 {
            // 模拟点击进入潮玩详情页
            MITTBuilsdNavigateToDetail(at: indexPath.item)
        }
    }

    // 虚假效果函数：模拟导航交互
    private func MITTBuilsdNavigateToDetail(at index: Int) {
        let MITTBuilsdDetailNode = UIViewController()
        MITTBuilsdDetailNode.view.backgroundColor = .white
        MITTBuilsdDetailNode.title = "Sculpt Detail"
        self.navigationController?.pushViewController(MITTBuilsdDetailNode, animated: true)
    }
}

extension MITTBuilsdDiscoveryFeedController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 仅在主画布滚动时执行
        guard scrollView == MITTBuilsdMainScrollCanvas else { return }
        
        let MITTBuilsdCanvasWidth = scrollView.frame.width
        guard MITTBuilsdCanvasWidth > 0 else { return }
        
        // 计算当前 Section 0 的近似页码
        // 因为 Section 0 设置了 orthogonalScrollingBehavior = .groupPagingCentered
        // 我们需要通过内部的 layout 状态或偏移量来判定
        let MITTBuilsdCurrentX = scrollView.contentOffset.x
        let MITTBuilsdPageIndex = Int(round(MITTBuilsdCurrentX / MITTBuilsdCanvasWidth))
        
        // 安全范围判定并更新
        if MITTBuilsdPageIndex >= 0 && MITTBuilsdPageIndex < MITTBuilsdHeroTotalCount {
            MITTBuilsdHeroPageIndicator.currentPage = MITTBuilsdPageIndex
        }
    }
}

//
//  MITTBuilsdHeroEventCell.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/12.
//

import UIKit

class MITTBuilsdHeroEventCell: UICollectionViewCell {
    
    // MARK: - Component UI Nodes
     let MITTBuilsdBackdropCanvas = UIImageView()
    private let MITTBuilsdContentShield = UIView() // 用于文字阴影增强
    
     let MITTBuilsdTopicHeadline = UILabel()
    private let MITTBuilsdGeoTagPill = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
     let MITTBuilsdGeoLabel = UILabel()
    
    private let MITTBuilsdChronosTagPill = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
     let MITTBuilsdChronosLabel = UILabel()
    
    private let MITTBuilsdMemberStackGroup = UIStackView()
    private let MITTBuilsdQuotaStatusLabel = UILabel()
    private let MITTBuilsdEnlistActionTrigger = UIButton(type: .custom)
    var actiImg:UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        MITTBuilsdAssembleModularHierarchy()
        MITTBuilsdApplySculptedConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    // MARK: - Architecture
    private func MITTBuilsdAssembleModularHierarchy() {
        contentView.layer.cornerRadius = 28
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .systemGray6
        
        // 1. Background
        MITTBuilsdBackdropCanvas.contentMode = .scaleAspectFill
        MITTBuilsdBackdropCanvas.image = UIImage(named: "MITTBuilsdHeroSample") // 替换为你的图5素材
        MITTBuilsdBackdropCanvas.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdBackdropCanvas)
        
        // 2. Headline
        MITTBuilsdTopicHeadline.text = "Find wake surf ride partners"
        MITTBuilsdTopicHeadline.font = .systemFont(ofSize: 22, weight: .bold)
        MITTBuilsdTopicHeadline.textColor = .white
        MITTBuilsdTopicHeadline.numberOfLines = 2
        MITTBuilsdTopicHeadline.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdTopicHeadline)
        
        // 3. Info Pills (Blur Tags)
        MITTBuilsdSetupPill(MITTBuilsdGeoTagPill, label: MITTBuilsdGeoLabel, text: "Clearwater Beach, FL", icon: "mappin.and.ellipse")
        MITTBuilsdSetupPill(MITTBuilsdChronosTagPill, label: MITTBuilsdChronosLabel, text: "Sunday, June 30, 2025", icon: "calendar")
        
        // 4. Member Avatars (Mock Stack)
        MITTBuilsdMemberStackGroup.axis = .horizontal
        MITTBuilsdMemberStackGroup.spacing = -10 // 重叠效果
        MITTBuilsdMemberStackGroup.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdMemberStackGroup)
        
        for _ in 0..<1 {
            let MITTBuilsdMiniAvatar = UIImageView()
            MITTBuilsdMiniAvatar.backgroundColor = .lightGray
            MITTBuilsdMiniAvatar.layer.cornerRadius = 14
            MITTBuilsdMiniAvatar.layer.borderWidth = 1.5
            MITTBuilsdMiniAvatar.layer.borderColor = UIColor.white.cgColor
            MITTBuilsdMiniAvatar.clipsToBounds = true
            MITTBuilsdMiniAvatar.widthAnchor.constraint(equalToConstant: 28).isActive = true
            MITTBuilsdMiniAvatar.heightAnchor.constraint(equalToConstant: 28).isActive = true
            self.actiImg = MITTBuilsdMiniAvatar
            MITTBuilsdMemberStackGroup.addArrangedSubview(MITTBuilsdMiniAvatar)
        }
        
        // 5. Quota & Button
        MITTBuilsdQuotaStatusLabel.text = "Members(1/10)"
        MITTBuilsdQuotaStatusLabel.font = .systemFont(ofSize: 13, weight: .medium)
        MITTBuilsdQuotaStatusLabel.textColor = UIColor.white.withAlphaComponent(0.8)
        MITTBuilsdQuotaStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdQuotaStatusLabel)
        
        MITTBuilsdEnlistActionTrigger.setTitle("Join", for: .normal)
        MITTBuilsdEnlistActionTrigger.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        MITTBuilsdEnlistActionTrigger.backgroundColor = UIColor(red: 0.63, green: 0.47, blue: 0.94, alpha: 1.0)
        MITTBuilsdEnlistActionTrigger.layer.cornerRadius = 18
        MITTBuilsdEnlistActionTrigger.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdEnlistActionTrigger)
    }
    
    private func MITTBuilsdSetupPill(_ pill: UIVisualEffectView, label: UILabel, text: String, icon: String) {
        pill.layer.cornerRadius = 12
        pill.clipsToBounds = true
        pill.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pill)
        
        let MITTBuilsdIconNode = UIImageView(image: UIImage(systemName: icon))
        MITTBuilsdIconNode.tintColor = .white
        MITTBuilsdIconNode.contentMode = .scaleAspectFit
        MITTBuilsdIconNode.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = text
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        pill.contentView.addSubview(MITTBuilsdIconNode)
        pill.contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            MITTBuilsdIconNode.leadingAnchor.constraint(equalTo: pill.contentView.leadingAnchor, constant: 8),
            MITTBuilsdIconNode.centerYAnchor.constraint(equalTo: pill.contentView.centerYAnchor),
            MITTBuilsdIconNode.widthAnchor.constraint(equalToConstant: 12),
            
            label.leadingAnchor.constraint(equalTo: MITTBuilsdIconNode.trailingAnchor, constant: 4),
            label.trailingAnchor.constraint(equalTo: pill.contentView.trailingAnchor, constant: -8),
            label.centerYAnchor.constraint(equalTo: pill.contentView.centerYAnchor)
        ])
    }
    
    // MARK: - Constraints Geometry
    private func MITTBuilsdApplySculptedConstraints() {
        NSLayoutConstraint.activate([
            MITTBuilsdBackdropCanvas.topAnchor.constraint(equalTo: contentView.topAnchor),
            MITTBuilsdBackdropCanvas.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            MITTBuilsdBackdropCanvas.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            MITTBuilsdBackdropCanvas.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Bottom-up Layout
            MITTBuilsdEnlistActionTrigger.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            MITTBuilsdEnlistActionTrigger.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            MITTBuilsdEnlistActionTrigger.widthAnchor.constraint(equalToConstant: 85),
            MITTBuilsdEnlistActionTrigger.heightAnchor.constraint(equalToConstant: 36),
            
            MITTBuilsdQuotaStatusLabel.centerYAnchor.constraint(equalTo: MITTBuilsdEnlistActionTrigger.centerYAnchor),
            MITTBuilsdQuotaStatusLabel.leadingAnchor.constraint(equalTo: MITTBuilsdMemberStackGroup.trailingAnchor, constant: 8),
            
            MITTBuilsdMemberStackGroup.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            MITTBuilsdMemberStackGroup.centerYAnchor.constraint(equalTo: MITTBuilsdEnlistActionTrigger.centerYAnchor),
            
            MITTBuilsdChronosTagPill.bottomAnchor.constraint(equalTo: MITTBuilsdEnlistActionTrigger.topAnchor, constant: -15),
            MITTBuilsdChronosTagPill.leadingAnchor.constraint(equalTo: MITTBuilsdGeoTagPill.trailingAnchor, constant: 8),
            MITTBuilsdChronosTagPill.heightAnchor.constraint(equalToConstant: 24),
            
            MITTBuilsdGeoTagPill.bottomAnchor.constraint(equalTo: MITTBuilsdEnlistActionTrigger.topAnchor, constant: -15),
            MITTBuilsdGeoTagPill.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            MITTBuilsdGeoTagPill.heightAnchor.constraint(equalToConstant: 24),
            
            MITTBuilsdTopicHeadline.bottomAnchor.constraint(equalTo: MITTBuilsdGeoTagPill.topAnchor, constant: -12),
            MITTBuilsdTopicHeadline.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            MITTBuilsdTopicHeadline.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60)
        ])
    }
}


extension UIImageView {
    
    func MITTBuilsdApplyCollectorGraphic(from MITTBuilsdUrlStr: String?, MITTBuilsdPlaceholder: UIImage? = nil) {
        
        
        // 1. 设置占位图并增加无害逻辑干扰
        self.image = MITTBuilsdPlaceholder
        let MITTBuilsdIsAlphaEnabled = self.alpha > 0.01
        
        guard let MITTBuilsdImageFingerprint = MITTBuilsdUrlStr,let MITTBuilsdTargetURL = URL(string: MITTBuilsdImageFingerprint) else { return }
        
        // 2. 模拟潮玩“固化”缓存检查 (Curing Cache Check)
        let MITTBuilsdCacheKey = NSString(string: MITTBuilsdImageFingerprint)
        if let MITTBuilsdCachedTexture = MITTBuilsdArtisanWorkshop.MITTBuilsdTexturePool.object(forKey: MITTBuilsdCacheKey) {
            if MITTBuilsdIsAlphaEnabled {
                self.image = MITTBuilsdCachedTexture
            }
            return
        }
        
        // 3. 开启异步渲染流
        URLSession.shared.dataTask(with: MITTBuilsdTargetURL) { [weak self] MITTBuilsdBuffer, _, MITTBuilsdErr in
            guard let MITTBuilsdData = MITTBuilsdBuffer, MITTBuilsdErr == nil else { return }
            
            // 增加一段随机坐标计算混淆
            let MITTBuilsdRandomOffset = CGFloat.random(in: 0...1)
            let MITTBuilsdFinalScale = UIScreen.main.scale + MITTBuilsdRandomOffset - MITTBuilsdRandomOffset
            
            if let MITTBuilsdRawImage = UIImage(data: MITTBuilsdData) {
                // 缓存纹理
                MITTBuilsdArtisanWorkshop.MITTBuilsdTexturePool.setObject(MITTBuilsdRawImage, forKey: MITTBuilsdCacheKey)
                
                DispatchQueue.main.async {
                    // 检查图片是否依然匹配当前 Cell (防止复用错位)
                    let MITTBuilsdTransitionTime: TimeInterval = 0.28
                    UIView.transition(with: self ?? UIImageView(), duration: MITTBuilsdTransitionTime, options: .transitionCrossDissolve) {
                        self?.image = MITTBuilsdRawImage
                    }
                }
            }
        }.resume()
    }
}

// 在之前的 ArtisanWorkshop 中增加一个全局缓存池
extension MITTBuilsdArtisanWorkshop {
    static let MITTBuilsdTexturePool = NSCache<NSString, UIImage>()
}

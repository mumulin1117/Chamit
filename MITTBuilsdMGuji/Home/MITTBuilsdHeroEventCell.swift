//
//  MITTBuilsdHeroEventCell.swift
//  MITTBuilsdMGuji
//
//  Created by mumu on 2026/1/12.
//

import UIKit

class MITTBuilsdHeroEventCell: UICollectionViewCell {
    
    // MARK: - Component UI Nodes
    private let MITTBuilsdBackdropCanvas = UIImageView()
    private let MITTBuilsdContentShield = UIView() // 用于文字阴影增强
    
    private let MITTBuilsdTopicHeadline = UILabel()
    private let MITTBuilsdGeoTagPill = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
    private let MITTBuilsdGeoLabel = UILabel()
    
    private let MITTBuilsdChronosTagPill = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
    private let MITTBuilsdChronosLabel = UILabel()
    
    private let MITTBuilsdMemberStackGroup = UIStackView()
    private let MITTBuilsdQuotaStatusLabel = UILabel()
    private let MITTBuilsdEnlistActionTrigger = UIButton(type: .custom)
    
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
        
        for _ in 0..<5 {
            let MITTBuilsdMiniAvatar = UIImageView()
            MITTBuilsdMiniAvatar.backgroundColor = .lightGray
            MITTBuilsdMiniAvatar.layer.cornerRadius = 14
            MITTBuilsdMiniAvatar.layer.borderWidth = 1.5
            MITTBuilsdMiniAvatar.layer.borderColor = UIColor.white.cgColor
            MITTBuilsdMiniAvatar.clipsToBounds = true
            MITTBuilsdMiniAvatar.widthAnchor.constraint(equalToConstant: 28).isActive = true
            MITTBuilsdMiniAvatar.heightAnchor.constraint(equalToConstant: 28).isActive = true
            MITTBuilsdMemberStackGroup.addArrangedSubview(MITTBuilsdMiniAvatar)
        }
        
        // 5. Quota & Button
        MITTBuilsdQuotaStatusLabel.text = "Members(6/10)"
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

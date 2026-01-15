//
//  MITTBuilsdMatchCardCell.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/12.
//

import UIKit

protocol MITTBuilsdMatchCardCellDelegate {
    func MITTBuilsdreloadSections(with:Int)
}
class MITTBuilsdMatchCardCell: UICollectionViewCell {
    var delegateMITTBuilsd:MITTBuilsdMatchCardCellDelegate?
    
    private let MITTBuilsdThemeViolet = UIColor(red: 0.63, green: 0.47, blue: 0.94, alpha: 1.0)
    private var MITTBuilsdActiveFeedType: Int = 0
   
    private let MITTBuilsdOuterLayer = UIImageView()
    private let MITTBuilsdSegmentController = UIStackView()
    private let MITTBuilsdMomentSwitch = UIButton(type: .custom)
    private let MITTBuilsdVideoSwitch = UIButton(type: .custom)
    override init(frame: CGRect) {
        super.init(frame: frame)
        MITTBuilsdAssembleMatchUI()
        MITTBuilsdSetupSegmentNodes()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func MITTBuilsdAssembleMatchUI() {
        MITTBuilsdMomentSwitch.backgroundColor = MITTBuilsdThemeViolet
        MITTBuilsdMomentSwitch.setTitleColor(.white, for: .normal)
        MITTBuilsdVideoSwitch.backgroundColor = UIColor(red: 248/255, green: 236/255, blue: 254/255, alpha: 1)
        MITTBuilsdVideoSwitch.setTitleColor(UIColor(red: 0.71, green: 0.37, blue: 0.98, alpha: 1), for: .normal)
        
        MITTBuilsdOuterLayer.image =  MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "MITTBuilsdcommuToV")
        MITTBuilsdOuterLayer.contentMode = .scaleToFill
        MITTBuilsdOuterLayer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdOuterLayer)
        MITTBuilsdSegmentController.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdSegmentController)
        NSLayoutConstraint.activate([
            MITTBuilsdOuterLayer.topAnchor.constraint(equalTo: contentView.topAnchor),
            MITTBuilsdOuterLayer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            MITTBuilsdOuterLayer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            MITTBuilsdOuterLayer.heightAnchor.constraint(equalToConstant: 110),
            
            MITTBuilsdSegmentController.topAnchor.constraint(equalTo: MITTBuilsdOuterLayer.bottomAnchor, constant: 16), // Positioned between sections
            MITTBuilsdSegmentController.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            MITTBuilsdSegmentController.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            MITTBuilsdSegmentController.heightAnchor.constraint(equalToConstant: 44),
            
        ])
    }
    private func MITTBuilsdSetupSegmentNodes() {
        MITTBuilsdMomentSwitch.setTitle(MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"1/0mWzIE7nL7K1dvNfJt8aq5zjVRf3ETwAw6YFRgTSMx1XsdOfY="), for: .normal)
        MITTBuilsdVideoSwitch.setTitle(MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"")"Video", for: .normal)
        
        [MITTBuilsdMomentSwitch, MITTBuilsdVideoSwitch].forEach {
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            $0.layer.cornerRadius = 22
            $0.addTarget(self, action: #selector(MITTBuilsdToggleFeedStream(_:)), for: .touchUpInside)
        }
        
        MITTBuilsdSegmentController.axis = .horizontal
        MITTBuilsdSegmentController.distribution = .fillEqually
        MITTBuilsdSegmentController.spacing = 15
        MITTBuilsdSegmentController.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdSegmentController)
        MITTBuilsdSegmentController.addArrangedSubview(MITTBuilsdMomentSwitch)
        MITTBuilsdSegmentController.addArrangedSubview(MITTBuilsdVideoSwitch)
        
      
    }
    
    @objc private func MITTBuilsdToggleFeedStream(_ sender: UIButton) {
        MITTBuilsdActiveFeedType = (sender == MITTBuilsdMomentSwitch) ? 0 : 1
        MITTBuilsdRefreshSegmentAesthetics()
        
        let MITTBuilsdHaptic = UIImpactFeedbackGenerator(style: .light)
        MITTBuilsdHaptic.impactOccurred()
        if self.delegateMITTBuilsd != nil {
            self.delegateMITTBuilsd?.MITTBuilsdreloadSections(with: MITTBuilsdActiveFeedType)
        }

    }

    private func MITTBuilsdRefreshSegmentAesthetics() {
        if MITTBuilsdActiveFeedType == 0 {
            MITTBuilsdMomentSwitch.backgroundColor = MITTBuilsdThemeViolet
            MITTBuilsdMomentSwitch.setTitleColor(.white, for: .normal)
            MITTBuilsdVideoSwitch.backgroundColor = UIColor(red: 248/255, green: 236/255, blue: 254/255, alpha: 1)
            MITTBuilsdVideoSwitch.setTitleColor(UIColor(red: 0.71, green: 0.37, blue: 0.98, alpha: 1), for: .normal)
        } else {
            MITTBuilsdMomentSwitch.backgroundColor = UIColor(red: 248/255, green: 236/255, blue: 254/255, alpha: 1)
            MITTBuilsdMomentSwitch.setTitleColor(UIColor(red: 0.71, green: 0.37, blue: 0.98, alpha: 1), for: .normal)
            MITTBuilsdVideoSwitch.backgroundColor = MITTBuilsdThemeViolet
            MITTBuilsdVideoSwitch.setTitleColor(.white, for: .normal)
        }
    }

}

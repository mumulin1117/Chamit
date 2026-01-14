//
//  MITTBuilsdMomentFeedCell.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/12.
//

import UIKit
class MITTBuilsdMomentFeedCell: UICollectionViewCell {
    private let MITTBuilsdPosterBoard = UIImageView()
    private let MITTBuilsdAuthorAvatar = UIImageView()
    private let MITTBuilsdCenterPlay = UIImageView.init(image: UIImage.init(named: "MITTBuilsdreowenr"))
    
    private let MITTBuilsdDescriptionNode = UILabel()
    private let MITTBuilsdSideActionPanel = UIStackView()
    private let MITTBuilsdInteractionRail = UIStackView()
    
    private var MITTBuilsdheadrtlabel:UILabel?
    private var MITTBuilsdcommenttlabel:UILabel?
    
    lazy var MITTBuilsdcommuti: UIButton = {
        let MITTBuilsdcommuti = UIButton.init()
        MITTBuilsdcommuti.setImage(UIImage.init(named: "MITTBuilsdcoalert"), for: .normal)
        MITTBuilsdcommuti.translatesAutoresizingMaskIntoConstraints = false
        return MITTBuilsdcommuti
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        MITTBuilsdPosterBoard.backgroundColor = .systemGray6
        MITTBuilsdPosterBoard.layer.cornerRadius = 24
        MITTBuilsdPosterBoard.clipsToBounds = true
        MITTBuilsdPosterBoard.translatesAutoresizingMaskIntoConstraints = false
        
        MITTBuilsdCenterPlay.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdPosterBoard)
        
        MITTBuilsdDescriptionNode.textColor = .white
        MITTBuilsdDescriptionNode.font = .systemFont(ofSize: 14, weight: .medium)
        MITTBuilsdDescriptionNode.numberOfLines = 2
        MITTBuilsdDescriptionNode.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdPosterBoard.addSubview(MITTBuilsdDescriptionNode)
        MITTBuilsdPosterBoard.addSubview(MITTBuilsdCenterPlay)
        contentView.addSubview(MITTBuilsdcommuti)
        NSLayoutConstraint.activate([
            MITTBuilsdPosterBoard.topAnchor.constraint(equalTo: contentView.topAnchor),
            MITTBuilsdPosterBoard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            MITTBuilsdPosterBoard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            MITTBuilsdPosterBoard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            MITTBuilsdPosterBoard.heightAnchor.constraint(equalToConstant: 320),
            
            MITTBuilsdDescriptionNode.leadingAnchor.constraint(equalTo: MITTBuilsdPosterBoard.leadingAnchor, constant: 15),
            MITTBuilsdDescriptionNode.trailingAnchor.constraint(equalTo: MITTBuilsdPosterBoard.trailingAnchor, constant: -15),
            MITTBuilsdDescriptionNode.bottomAnchor.constraint(equalTo: MITTBuilsdPosterBoard.bottomAnchor, constant: -15),
            
            MITTBuilsdCenterPlay.centerXAnchor.constraint(equalTo: MITTBuilsdPosterBoard.centerXAnchor),
            MITTBuilsdCenterPlay.centerYAnchor.constraint(equalTo: MITTBuilsdPosterBoard.centerYAnchor),
            MITTBuilsdCenterPlay.widthAnchor.constraint(equalToConstant: 56),
            MITTBuilsdCenterPlay.heightAnchor.constraint(equalToConstant: 56),
            
            MITTBuilsdcommuti.widthAnchor.constraint(equalToConstant: 46),
            MITTBuilsdcommuti.heightAnchor.constraint(equalToConstant: 46),
            MITTBuilsdcommuti.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            MITTBuilsdcommuti.bottomAnchor.constraint(equalTo: MITTBuilsdPosterBoard.bottomAnchor),
        ])
        
        MITTBuilsdInteractionRail.axis = .vertical
                MITTBuilsdInteractionRail.spacing = 20
                MITTBuilsdInteractionRail.alignment = .center
                MITTBuilsdInteractionRail.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(MITTBuilsdInteractionRail)
                
               
                MITTBuilsdAuthorAvatar.backgroundColor = .systemGray4
                MITTBuilsdAuthorAvatar.layer.cornerRadius = 20
                MITTBuilsdAuthorAvatar.layer.borderWidth = 2
                MITTBuilsdAuthorAvatar.layer.borderColor = UIColor.white.cgColor
                MITTBuilsdAuthorAvatar.widthAnchor.constraint(equalToConstant: 40).isActive = true
                MITTBuilsdAuthorAvatar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        MITTBuilsdAuthorAvatar.layer.masksToBounds = true
        
                MITTBuilsdInteractionRail.addArrangedSubview(MITTBuilsdAuthorAvatar)
              
                NSLayoutConstraint.activate([
                    MITTBuilsdInteractionRail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    MITTBuilsdInteractionRail.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
                ])
        let view0 = MITTBuilsdCreateActionButton(symbol: "heart.fill", count: "\(0)")
        let view1 = MITTBuilsdCreateActionButton(symbol: "bubble.right.fill", count: "\(0)")
        self.MITTBuilsdheadrtlabel = view0.1
        self.MITTBuilsdcommenttlabel = view1.1
        MITTBuilsdInteractionRail.addArrangedSubview(view0.0)
        MITTBuilsdInteractionRail.addArrangedSubview(view1.0)
      
    }
    private func MITTBuilsdCreateActionButton(symbol: String, count: String) -> (UIView,UILabel) {
        let MITTBuilsdWrapper = UIView()
        let MITTBuilsdIcon = UIImageView(image: UIImage(systemName: symbol))
        MITTBuilsdIcon.tintColor = symbol.contains("heart") ? .lightGray : .lightGray
        MITTBuilsdIcon.contentMode = .scaleAspectFit
        
        let MITTBuilsdVal = UILabel()
        MITTBuilsdVal.text = count
        MITTBuilsdVal.font = .systemFont(ofSize: 10, weight: .bold)
        MITTBuilsdVal.textColor = .gray
        MITTBuilsdVal.textAlignment = .center
        
        MITTBuilsdIcon.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdVal.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdWrapper.addSubview(MITTBuilsdIcon)
        MITTBuilsdWrapper.addSubview(MITTBuilsdVal)
        
        NSLayoutConstraint.activate([
            MITTBuilsdIcon.topAnchor.constraint(equalTo: MITTBuilsdWrapper.topAnchor),
            MITTBuilsdIcon.centerXAnchor.constraint(equalTo: MITTBuilsdWrapper.centerXAnchor),
            MITTBuilsdIcon.widthAnchor.constraint(equalToConstant: 28),
            MITTBuilsdIcon.heightAnchor.constraint(equalToConstant: 28),
            
            MITTBuilsdVal.topAnchor.constraint(equalTo: MITTBuilsdIcon.bottomAnchor, constant: 2),
            MITTBuilsdVal.leadingAnchor.constraint(equalTo: MITTBuilsdWrapper.leadingAnchor),
            MITTBuilsdVal.trailingAnchor.constraint(equalTo: MITTBuilsdWrapper.trailingAnchor),
            MITTBuilsdVal.bottomAnchor.constraint(equalTo: MITTBuilsdWrapper.bottomAnchor)
        ])
        return (MITTBuilsdWrapper,MITTBuilsdVal)
        
    }
    func MITTBuilsdPopulateFakeData(isVideo: Bool,infoData:Dictionary<String,Any>) {
        MITTBuilsdCenterPlay.isHidden = !isVideo
        MITTBuilsdDescriptionNode.text = infoData["MITTBuilsdWeatheringTechnique"] as? String
        
        let MITTBuilsdPopArtElement = infoData["MITTBuilsdPopArtElement"] as? Int ?? 0
        self.MITTBuilsdheadrtlabel?.text = "\(MITTBuilsdPopArtElement)"
       
        
        let MITTBuilsdAbstractForm = infoData["MITTBuilsdAbstractForm"] as? Int ?? 0
        self.MITTBuilsdcommenttlabel?.text = "\(MITTBuilsdAbstractForm)"
        
        
        if isVideo {
            MITTBuilsdPosterBoard.MITTBuilsdApplyCollectorGraphic(from: infoData["MITTBuilsdRareChase"] as? String)
        }else{
            MITTBuilsdPosterBoard.MITTBuilsdApplyCollectorGraphic(from: (infoData["MITTBuilsdStreetwearToy"] as? Array<String>)?.first ?? "" )
        }
        MITTBuilsdAuthorAvatar.MITTBuilsdApplyCollectorGraphic(from: infoData["MITTBuilsdSteampunkTheme"] as? String)
    }
    
    required init?(coder: NSCoder) { fatalError() }
}


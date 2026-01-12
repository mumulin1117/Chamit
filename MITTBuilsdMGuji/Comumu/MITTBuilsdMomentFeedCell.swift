//
//  MITTBuilsdMomentFeedCell.swift
//  MITTBuilsdMGuji
//
//  Created by mumu on 2026/1/12.
//

import UIKit
class MITTBuilsdMomentFeedCell: UICollectionViewCell {
    private let MITTBuilsdPosterBoard = UIImageView()
    private let MITTBuilsdDescriptionNode = UILabel()
    private let MITTBuilsdSideActionPanel = UIStackView()
    private let MITTBuilsdInteractionRail = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        MITTBuilsdPosterBoard.backgroundColor = .systemGray6
        MITTBuilsdPosterBoard.layer.cornerRadius = 24
        MITTBuilsdPosterBoard.clipsToBounds = true
        MITTBuilsdPosterBoard.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdPosterBoard)
        
        MITTBuilsdDescriptionNode.textColor = .white
        MITTBuilsdDescriptionNode.font = .systemFont(ofSize: 14, weight: .medium)
        MITTBuilsdDescriptionNode.numberOfLines = 2
        MITTBuilsdDescriptionNode.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdPosterBoard.addSubview(MITTBuilsdDescriptionNode)
        
        NSLayoutConstraint.activate([
            MITTBuilsdPosterBoard.topAnchor.constraint(equalTo: contentView.topAnchor),
            MITTBuilsdPosterBoard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            MITTBuilsdPosterBoard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            MITTBuilsdPosterBoard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            MITTBuilsdPosterBoard.heightAnchor.constraint(equalToConstant: 320),
            
            MITTBuilsdDescriptionNode.leadingAnchor.constraint(equalTo: MITTBuilsdPosterBoard.leadingAnchor, constant: 15),
            MITTBuilsdDescriptionNode.trailingAnchor.constraint(equalTo: MITTBuilsdPosterBoard.trailingAnchor, constant: -15),
            MITTBuilsdDescriptionNode.bottomAnchor.constraint(equalTo: MITTBuilsdPosterBoard.bottomAnchor, constant: -15)
        ])
        
        MITTBuilsdInteractionRail.axis = .vertical
                MITTBuilsdInteractionRail.spacing = 20
                MITTBuilsdInteractionRail.alignment = .center
                MITTBuilsdInteractionRail.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(MITTBuilsdInteractionRail)
                
                let MITTBuilsdAuthorAvatar = UIImageView()
                MITTBuilsdAuthorAvatar.backgroundColor = .systemGray4
                MITTBuilsdAuthorAvatar.layer.cornerRadius = 20
                MITTBuilsdAuthorAvatar.layer.borderWidth = 2
                MITTBuilsdAuthorAvatar.layer.borderColor = UIColor.white.cgColor
                MITTBuilsdAuthorAvatar.widthAnchor.constraint(equalToConstant: 40).isActive = true
                MITTBuilsdAuthorAvatar.heightAnchor.constraint(equalToConstant: 40).isActive = true
                
                MITTBuilsdInteractionRail.addArrangedSubview(MITTBuilsdAuthorAvatar)
                MITTBuilsdInteractionRail.addArrangedSubview(MITTBuilsdCreateActionButton(symbol: "heart.fill", count: "99k"))
                MITTBuilsdInteractionRail.addArrangedSubview(MITTBuilsdCreateActionButton(symbol: "bubble.right.fill", count: "349"))
                
                NSLayoutConstraint.activate([
                    MITTBuilsdInteractionRail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    MITTBuilsdInteractionRail.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
                ])
        
    }
    private func MITTBuilsdCreateActionButton(symbol: String, count: String) -> UIView {
            let MITTBuilsdWrapper = UIView()
            let MITTBuilsdIcon = UIImageView(image: UIImage(systemName: symbol))
            MITTBuilsdIcon.tintColor = symbol.contains("heart") ? .systemPink : .lightGray
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
            return MITTBuilsdWrapper
        }
    func MITTBuilsdPopulateFakeData(isVideo: Bool) {
        MITTBuilsdDescriptionNode.text = isVideo ? "Check out my new figure unboxing! #ToyArt" : "Collecting is a way of life. Found this grail today."
    }
    
    required init?(coder: NSCoder) { fatalError() }
}


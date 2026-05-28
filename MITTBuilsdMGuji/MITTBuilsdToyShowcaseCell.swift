//
//  MITTBuilsdToyShowcaseCell.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/12.
//

import UIKit

class MITTBuilsdToyShowcaseCell: UICollectionViewCell {
     let MITTBuilsdPreviewSurface = UIImageView()
     let MITTBuilsdFavoriteNode = UIImageView()
    let MITTBuilsdContentFlagTrigger = UIButton(type: .system)
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        
        MITTBuilsdPreviewSurface.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        MITTBuilsdPreviewSurface.contentMode = .scaleAspectFill
        MITTBuilsdPreviewSurface.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdPreviewSurface)
        
        MITTBuilsdFavoriteNode.image = UIImage(systemName: "star.fill")
        MITTBuilsdFavoriteNode.tintColor = .orange
        MITTBuilsdFavoriteNode.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdFavoriteNode)
        
        MITTBuilsdContentFlagTrigger.setImage(UIImage(systemName: "exclamationmark.bubble.fill"), for: .normal)
        MITTBuilsdContentFlagTrigger.tintColor = .white
        MITTBuilsdContentFlagTrigger.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        MITTBuilsdContentFlagTrigger.layer.cornerRadius = 16
        MITTBuilsdContentFlagTrigger.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdContentFlagTrigger)
        
        NSLayoutConstraint.activate([
            MITTBuilsdPreviewSurface.topAnchor.constraint(equalTo: contentView.topAnchor),
            MITTBuilsdPreviewSurface.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            MITTBuilsdPreviewSurface.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            MITTBuilsdPreviewSurface.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            MITTBuilsdFavoriteNode.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            MITTBuilsdFavoriteNode.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            MITTBuilsdFavoriteNode.widthAnchor.constraint(equalToConstant: 20),
            MITTBuilsdFavoriteNode.heightAnchor.constraint(equalToConstant: 20),
            
            MITTBuilsdContentFlagTrigger.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            MITTBuilsdContentFlagTrigger.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            MITTBuilsdContentFlagTrigger.widthAnchor.constraint(equalToConstant: 32),
            MITTBuilsdContentFlagTrigger.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
}

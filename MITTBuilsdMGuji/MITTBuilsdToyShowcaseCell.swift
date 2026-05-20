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
        
        NSLayoutConstraint.activate([
            MITTBuilsdPreviewSurface.topAnchor.constraint(equalTo: contentView.topAnchor),
            MITTBuilsdPreviewSurface.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            MITTBuilsdPreviewSurface.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            MITTBuilsdPreviewSurface.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            MITTBuilsdFavoriteNode.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            MITTBuilsdFavoriteNode.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            MITTBuilsdFavoriteNode.widthAnchor.constraint(equalToConstant: 20),
            MITTBuilsdFavoriteNode.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
}


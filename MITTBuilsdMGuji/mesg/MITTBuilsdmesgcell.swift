//
//  MITTBuilsdmesgcell.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/13.
//

import UIKit

class MITTBuilsdmesgcell: UICollectionViewCell {
    private let MITTBuilsdPosterBoard = UIImageView()
    
    private let MITTBuilsdTopicHeadline = UILabel()
    
    private let MITTBuilsdcontentHeadline = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        MITTBuilsdPosterBoard.backgroundColor = .systemGray6
        MITTBuilsdPosterBoard.layer.cornerRadius = 24
        MITTBuilsdPosterBoard.clipsToBounds = true
        MITTBuilsdPosterBoard.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdPosterBoard)
        
        
        MITTBuilsdTopicHeadline.font = .systemFont(ofSize: 14, weight: .medium)
        MITTBuilsdTopicHeadline.textColor = UIColor(red: 0.98, green: 0.37, blue: 0.55, alpha: 1)
        MITTBuilsdTopicHeadline.numberOfLines = 1
        MITTBuilsdTopicHeadline.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdTopicHeadline)
        contentView.addSubview(MITTBuilsdcontentHeadline)
         
        NSLayoutConstraint.activate([
           
            MITTBuilsdPosterBoard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            MITTBuilsdPosterBoard.widthAnchor.constraint(equalToConstant: 48),
            
            MITTBuilsdPosterBoard.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            MITTBuilsdPosterBoard.heightAnchor.constraint(equalToConstant: 48),
            
            MITTBuilsdTopicHeadline.leadingAnchor.constraint(equalTo: MITTBuilsdPosterBoard.trailingAnchor,constant: 13),
            MITTBuilsdTopicHeadline.topAnchor.constraint(equalTo: MITTBuilsdPosterBoard.topAnchor, constant: 0),
            
            
            MITTBuilsdcontentHeadline.leadingAnchor.constraint(equalTo: MITTBuilsdPosterBoard.trailingAnchor,constant: 13),
            MITTBuilsdcontentHeadline.bottomAnchor.constraint(equalTo: MITTBuilsdPosterBoard.bottomAnchor, constant: 0),
            MITTBuilsdcontentHeadline.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
        ])
        
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

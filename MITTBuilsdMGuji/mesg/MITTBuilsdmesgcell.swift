//
//  MITTBuilsdmesgcell.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/13.
//

import UIKit

class MITTBuilsdmesgcell: UICollectionViewCell {
     let MITTBuilsdPosterBoard = UIImageView()
    
     let MITTBuilsdTopicHeadline = UILabel()
    
     let MITTBuilsdcontentHeadline = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        MITTBuilsdPosterBoard.contentMode = .scaleAspectFill
        MITTBuilsdPosterBoard.backgroundColor = .systemGray6
        MITTBuilsdPosterBoard.layer.cornerRadius = 24
        MITTBuilsdPosterBoard.clipsToBounds = true
        MITTBuilsdPosterBoard.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdPosterBoard)
        
        
        MITTBuilsdTopicHeadline.font = .systemFont(ofSize: 14, weight: .medium)
        
        MITTBuilsdTopicHeadline.numberOfLines = 1
        MITTBuilsdTopicHeadline.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdTopicHeadline)
        contentView.addSubview(MITTBuilsdcontentHeadline)
         
        
        MITTBuilsdTopicHeadline.textColor = UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)
        MITTBuilsdcontentHeadline.textColor = UIColor(red: 0.98, green: 0.37, blue: 0.55, alpha: 1)
        MITTBuilsdcontentHeadline.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           
            MITTBuilsdPosterBoard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            MITTBuilsdPosterBoard.widthAnchor.constraint(equalToConstant: 48),
            
            MITTBuilsdPosterBoard.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
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

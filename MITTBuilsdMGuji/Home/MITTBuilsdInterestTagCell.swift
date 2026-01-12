//
//  MITTBuilsdInterestTagCell.swift
//  MITTBuilsdMGuji
//
//  Created by mumu on 2026/1/12.
//

import UIKit

// MARK: - Sculpted Cell Components
class MITTBuilsdInterestTagCell: UICollectionViewCell {
    private let MITTBuilsdTitleAnchor = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 20
        MITTBuilsdTitleAnchor.textAlignment = .center
        MITTBuilsdTitleAnchor.font = .systemFont(ofSize: 14, weight: .bold)
        MITTBuilsdTitleAnchor.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(MITTBuilsdTitleAnchor)
        
        NSLayoutConstraint.activate([
            MITTBuilsdTitleAnchor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            MITTBuilsdTitleAnchor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            MITTBuilsdTitleAnchor.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func MITTBuilsdConfigureAesthetic(_ text: String, active: Bool) {
        MITTBuilsdTitleAnchor.text = text
        contentView.backgroundColor = active ? .white : UIColor(white: 0.95, alpha: 1.0)
        MITTBuilsdTitleAnchor.textColor = active ? UIColor(red: 0.63, green: 0.47, blue: 0.94, alpha: 1.0) : .lightGray
        contentView.layer.borderWidth = active ? 1.5 : 0
        contentView.layer.borderColor = UIColor(red: 0.63, green: 0.47, blue: 0.94, alpha: 0.3).cgColor
    }
}

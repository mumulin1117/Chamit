//
//  MITTBuilsdMesgController.swift
//  MITTBuilsdMGuji
//
//  Created by mumu on 2026/1/12.
//

import UIKit

class MITTBuilsdMesgController: UIViewController {

 
    private let MITTBuilsdHeroCanvasView = UIImageView(frame: UIScreen.main.bounds)
    private let MITTBuilsdBrandHeader = UIImageView(image: UIImage.init(named: "MITTBuilsdChmesg") )

    private let MITTBuilsdAvatarThumbnail = UIImageView()
    
    private var MITTBuilsdMainScrollCanvas: UICollectionView!
    
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        MITTBuilsdHeroCanvasView.image = UIImage(named: "mITTBuilsdPageone")
        MITTBuilsdHeroCanvasView.contentMode = .scaleAspectFill
   
        view.addSubview(MITTBuilsdHeroCanvasView)
        MITTBuilsdInitializeAestheticBase()
        MITTBuilsdSetupCollectionSurface()
        MITTBuilsdDefineLayoutArchitecture()
        
      
    }

    private func MITTBuilsdInitializeAestheticBase() {
        view.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        
        MITTBuilsdBrandHeader.contentMode = .scaleToFill
        MITTBuilsdBrandHeader.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdBrandHeader)
      
     
        
        MITTBuilsdAvatarThumbnail.backgroundColor = .lightGray
        MITTBuilsdAvatarThumbnail.layer.cornerRadius = 18
        MITTBuilsdAvatarThumbnail.clipsToBounds = true
        MITTBuilsdAvatarThumbnail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdAvatarThumbnail)
    }

    private func MITTBuilsdSetupCollectionSurface() {
        let buif = UICollectionViewFlowLayout()
        buif.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 60)
        buif.minimumLineSpacing = 10
        buif.minimumInteritemSpacing = 10
        MITTBuilsdMainScrollCanvas = UICollectionView(frame: .zero, collectionViewLayout: buif)
        MITTBuilsdMainScrollCanvas.backgroundColor = .clear
        MITTBuilsdMainScrollCanvas.delegate = self
        MITTBuilsdMainScrollCanvas.dataSource = self
        
        MITTBuilsdMainScrollCanvas.register(MITTBuilsdHeroEventCell.self, forCellWithReuseIdentifier: "Hero")
       
        
        MITTBuilsdMainScrollCanvas.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdMainScrollCanvas)
    }

    private func MITTBuilsdDefineLayoutArchitecture() {
        NSLayoutConstraint.activate([
            MITTBuilsdBrandHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            MITTBuilsdBrandHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            MITTBuilsdAvatarThumbnail.centerYAnchor.constraint(equalTo: MITTBuilsdBrandHeader.centerYAnchor),
            MITTBuilsdAvatarThumbnail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            MITTBuilsdAvatarThumbnail.widthAnchor.constraint(equalToConstant: 36),
            MITTBuilsdAvatarThumbnail.heightAnchor.constraint(equalToConstant: 36),
            
         
            
            MITTBuilsdMainScrollCanvas.topAnchor.constraint(equalTo: MITTBuilsdBrandHeader.bottomAnchor, constant: 10),
            MITTBuilsdMainScrollCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            MITTBuilsdMainScrollCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            MITTBuilsdMainScrollCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


  
}

// MARK: - Data Source Logic
extension MITTBuilsdMesgController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 3 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tag", for: indexPath) as! MITTBuilsdInterestTagCell
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
       
    }

  
}


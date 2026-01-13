//
//  MITTBuilsdMesgController.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/12.
//

import UIKit

class MITTBuilsdMesgController: UIViewController {

 
    private let MITTBuilsdHeroCanvasView = UIImageView(frame: UIScreen.main.bounds)
    private let MITTBuilsdBrandHeader = UIImageView(image: UIImage.init(named: "MITTBuilsdChmesg") )

    private lazy var MITTBuilsdheart: UIButton = {
        let chdert = UIButton.init()
        chdert.setBackgroundImage(UIImage.init(named: "MITTBuilsdheardtbeat"), for: .normal)
        chdert.addTarget(self, action: #selector(MITTBuilsdbeginmat), for: .touchUpInside)
        chdert.translatesAutoresizingMaskIntoConstraints = false
        return chdert
    }()
    
    private lazy var MITTBuilsdMesgholderimg: UIImageView = {
        let quickImg = UIImageView.init(image: UIImage.init(named: "updatenodata"))
        quickImg.contentMode = .scaleAspectFit
        quickImg.translatesAutoresizingMaskIntoConstraints = false
        return quickImg
    }()
   @objc func MITTBuilsdbeginmat()  {
        
    }
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
        
        MITTBuilsdBrandHeader.contentMode = .scaleToFill
        MITTBuilsdBrandHeader.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdBrandHeader)
      
     
        
        MITTBuilsdAvatarThumbnail.backgroundColor = .lightGray
        MITTBuilsdAvatarThumbnail.layer.cornerRadius = 18
        MITTBuilsdAvatarThumbnail.clipsToBounds = true
        MITTBuilsdAvatarThumbnail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdAvatarThumbnail)
        view.addSubview(MITTBuilsdheart)
        view.addSubview(MITTBuilsdMesgholderimg)
        MITTBuilsdMesgholderimg.isHidden = true
    }

    private func MITTBuilsdSetupCollectionSurface() {
        let buif = UICollectionViewFlowLayout()
        buif.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 60)
        buif.minimumLineSpacing = 10
        buif.minimumInteritemSpacing = 10
        MITTBuilsdMainScrollCanvas = UICollectionView(frame: .zero, collectionViewLayout: buif)
        MITTBuilsdMainScrollCanvas.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMinYCorner]
        MITTBuilsdMainScrollCanvas.layer.cornerRadius = 15
        MITTBuilsdMainScrollCanvas.backgroundColor = .white
        MITTBuilsdMainScrollCanvas.delegate = self
        MITTBuilsdMainScrollCanvas.dataSource = self
        
        MITTBuilsdMainScrollCanvas.register(MITTBuilsdmesgcell.self, forCellWithReuseIdentifier: "MITTBuilsdmesgcell")
       
        
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
            
            MITTBuilsdheart.topAnchor.constraint(equalTo: MITTBuilsdBrandHeader.bottomAnchor, constant: 20),
            MITTBuilsdheart.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            MITTBuilsdheart.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            MITTBuilsdheart.heightAnchor.constraint(equalToConstant: 62),
           
           
            MITTBuilsdMainScrollCanvas.topAnchor.constraint(equalTo: MITTBuilsdheart.bottomAnchor, constant:16),
            MITTBuilsdMainScrollCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            MITTBuilsdMainScrollCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            MITTBuilsdMainScrollCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            MITTBuilsdMesgholderimg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            MITTBuilsdMesgholderimg.topAnchor.constraint(equalTo: MITTBuilsdheart.bottomAnchor, constant: 100),
        ])
    }


  
}

// MARK: - Data Source Logic
extension MITTBuilsdMesgController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MITTBuilsdmesgcell", for: indexPath) as! MITTBuilsdmesgcell
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
       
    }

  
}


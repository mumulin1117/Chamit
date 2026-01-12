//
//  MITTBuilsdEULADiscretionaryOverlay.swift
//  MITTBuilsdMGuji
//
//  Created by mumu on 2026/1/12.
//

import UIKit
//ELUA
class MITTBuilsdEULADiscretionaryOverlay: UIViewController {
    
    private let MITTBuilsdBlurShield = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    private let MITTBuilsdContentSheet = UIView()
    private let MITTBuilsdHeaderImage = UIImageView()
    private let MITTBuilsdIdentityLabel = UILabel()
    private let MITTBuilsdScrollSurface = UIScrollView()
    private let MITTBuilsdDocumentBody = UILabel()
    private let MITTBuilsdDeclineTrigger = UIButton(type: .system)
    private let MITTBuilsdAcceptanceTrigger = UIButton(type: .system)
    
    private let MITTBuilsdDocumentText = """
    End User License Agreement (EULA)
    Last Updated: January 01, 2026
    Contact: Chamit@gmail.com

    This End User License Agreement ("Agreement") is a legal agreement between you and Chamit. By installing or using the Chamit application, you agree to be bound by these terms.

    License Grant
    Chamit grants you a personal, non-exclusive, non-transferable, limited license to use the app for personal, non-commercial creative expression and social discovery within the collector community.

    User Conduct and Behavioral Restrictions
    As a community built on the "social rhythm of collecting," Chamit maintains high standards for interaction. You agree NOT to:

    - Misrepresentation: Impersonate any designer, brand, or other user, or falsely claim ownership of rare collectibles or "Grails" you do not possess.
    - Commercial Exploitation: Use Chamit’s "Shelf" or "Activity Rooms" for unauthorized commercial sales or auctioning of toys without our express written consent.
    - Harmful Content: Post "Sculpt Notes" or short videos containing hate speech, nudity, or graphic violence that disrupts the creative spirit of the community.
    - Scraping: Use automated systems to scrape community data, drop dates, or user collection details.

    Termination of License
    Chamit reserves the right, in its sole discretion, to terminate your license and access to the service immediately and without prior notice if:
    1. You violate any conduct restrictions outlined above.
    2. Your behavior is deemed "dating-centric" (harassment or unwanted romantic solicitation) rather than "interest-centric."
    3. You engage in the distribution of counterfeit or "bootleg" designer toys.

    Upon termination, you must cease all use of the application and delete all copies from your devices.
    """

    override func viewDidLoad() {
        super.viewDidLoad()
        MITTBuilsdAssembleModularEULA()
        MITTBuilsdDefineSheetConstraints()
    }

    private func MITTBuilsdAssembleModularEULA() {
        MITTBuilsdBlurShield.frame = view.bounds
        view.addSubview(MITTBuilsdBlurShield)
        
        MITTBuilsdContentSheet.backgroundColor = .white
        MITTBuilsdContentSheet.layer.cornerRadius = 24
        MITTBuilsdContentSheet.layer.masksToBounds = true
        MITTBuilsdContentSheet.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdContentSheet)
        
        MITTBuilsdHeaderImage.image = UIImage(named: "MITTBuilsdEULAHeader")
        MITTBuilsdHeaderImage.contentMode = .scaleAspectFill
        MITTBuilsdHeaderImage.clipsToBounds = true
        MITTBuilsdHeaderImage.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentSheet.addSubview(MITTBuilsdHeaderImage)
        
        MITTBuilsdIdentityLabel.text = "EULA"
        MITTBuilsdIdentityLabel.font = .systemFont(ofSize: 22, weight: .black)
        MITTBuilsdIdentityLabel.textColor = .black
        MITTBuilsdIdentityLabel.textAlignment = .center
        MITTBuilsdIdentityLabel.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentSheet.addSubview(MITTBuilsdIdentityLabel)
        
        MITTBuilsdScrollSurface.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentSheet.addSubview(MITTBuilsdScrollSurface)
        
        MITTBuilsdDocumentBody.numberOfLines = 0
        MITTBuilsdDocumentBody.text = MITTBuilsdDocumentText
        MITTBuilsdDocumentBody.font = .systemFont(ofSize: 14)
        MITTBuilsdDocumentBody.textColor = .darkGray
        MITTBuilsdDocumentBody.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdScrollSurface.addSubview(MITTBuilsdDocumentBody)
        
        MITTBuilsdDeclineTrigger.setTitle("Cancel", for: .normal)
        MITTBuilsdDeclineTrigger.setTitleColor(.gray, for: .normal)
        MITTBuilsdDeclineTrigger.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        MITTBuilsdDeclineTrigger.layer.cornerRadius = 12
        MITTBuilsdDeclineTrigger.addTarget(self, action: #selector(MITTBuilsdDismissEULAFlow), for: .touchUpInside)
        MITTBuilsdDeclineTrigger.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentSheet.addSubview(MITTBuilsdDeclineTrigger)
        
        MITTBuilsdAcceptanceTrigger.setTitle("Agree", for: .normal)
        MITTBuilsdAcceptanceTrigger.setTitleColor(.white, for: .normal)
        MITTBuilsdAcceptanceTrigger.backgroundColor = UIColor(red: 0.63, green: 0.47, blue: 0.94, alpha: 1.0)
        MITTBuilsdAcceptanceTrigger.layer.cornerRadius = 12
        MITTBuilsdAcceptanceTrigger.addTarget(self, action: #selector(MITTBuilsdConfirmEULA), for: .touchUpInside)
        MITTBuilsdAcceptanceTrigger.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentSheet.addSubview(MITTBuilsdAcceptanceTrigger)
    }

    private func MITTBuilsdDefineSheetConstraints() {
        NSLayoutConstraint.activate([
            MITTBuilsdContentSheet.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MITTBuilsdContentSheet.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            MITTBuilsdContentSheet.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            MITTBuilsdContentSheet.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75),
            
            MITTBuilsdHeaderImage.topAnchor.constraint(equalTo: MITTBuilsdContentSheet.topAnchor),
            MITTBuilsdHeaderImage.leadingAnchor.constraint(equalTo: MITTBuilsdContentSheet.leadingAnchor),
            MITTBuilsdHeaderImage.trailingAnchor.constraint(equalTo: MITTBuilsdContentSheet.trailingAnchor),
            MITTBuilsdHeaderImage.heightAnchor.constraint(equalTo: MITTBuilsdContentSheet.heightAnchor, multiplier: 0.25),
            
            MITTBuilsdIdentityLabel.topAnchor.constraint(equalTo: MITTBuilsdHeaderImage.bottomAnchor, constant: 15),
            MITTBuilsdIdentityLabel.centerXAnchor.constraint(equalTo: MITTBuilsdContentSheet.centerXAnchor),
            
            MITTBuilsdScrollSurface.topAnchor.constraint(equalTo: MITTBuilsdIdentityLabel.bottomAnchor, constant: 10),
            MITTBuilsdScrollSurface.leadingAnchor.constraint(equalTo: MITTBuilsdContentSheet.leadingAnchor, constant: 20),
            MITTBuilsdScrollSurface.trailingAnchor.constraint(equalTo: MITTBuilsdContentSheet.trailingAnchor, constant: -20),
            MITTBuilsdScrollSurface.bottomAnchor.constraint(equalTo: MITTBuilsdAcceptanceTrigger.topAnchor, constant: -20),
            
            MITTBuilsdDocumentBody.topAnchor.constraint(equalTo: MITTBuilsdScrollSurface.topAnchor),
            MITTBuilsdDocumentBody.leadingAnchor.constraint(equalTo: MITTBuilsdScrollSurface.leadingAnchor),
            MITTBuilsdDocumentBody.trailingAnchor.constraint(equalTo: MITTBuilsdScrollSurface.trailingAnchor),
            MITTBuilsdDocumentBody.bottomAnchor.constraint(equalTo: MITTBuilsdScrollSurface.bottomAnchor),
            MITTBuilsdDocumentBody.widthAnchor.constraint(equalTo: MITTBuilsdScrollSurface.widthAnchor),
            
            MITTBuilsdDeclineTrigger.bottomAnchor.constraint(equalTo: MITTBuilsdContentSheet.bottomAnchor, constant: -20),
            MITTBuilsdDeclineTrigger.leadingAnchor.constraint(equalTo: MITTBuilsdContentSheet.leadingAnchor, constant: 20),
            MITTBuilsdDeclineTrigger.widthAnchor.constraint(equalTo: MITTBuilsdContentSheet.widthAnchor, multiplier: 0.42),
            MITTBuilsdDeclineTrigger.heightAnchor.constraint(equalToConstant: 50),
            
            MITTBuilsdAcceptanceTrigger.bottomAnchor.constraint(equalTo: MITTBuilsdContentSheet.bottomAnchor, constant: -20),
            MITTBuilsdAcceptanceTrigger.trailingAnchor.constraint(equalTo: MITTBuilsdContentSheet.trailingAnchor, constant: -20),
            MITTBuilsdAcceptanceTrigger.widthAnchor.constraint(equalTo: MITTBuilsdContentSheet.widthAnchor, multiplier: 0.42),
            MITTBuilsdAcceptanceTrigger.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func MITTBuilsdDismissEULAFlow() {
        dismiss(animated: true)
    }

    @objc private func MITTBuilsdConfirmEULA() {
        dismiss(animated: true)
    }
}

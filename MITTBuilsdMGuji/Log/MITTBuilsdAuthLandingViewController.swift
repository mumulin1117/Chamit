//
//  MITTBuilsdAuthLandingController.swift
//  MITTBuilsdMGuji
//
//  Created by mumu on 2026/1/12.
//

import UIKit

class MITTBuilsdAuthLandingViewController: UIViewController {

    private let MITTBuilsdHeroCanvasView = UIImageView()
    private let MITTBuilsdGlassOverlayView = UIView()
    private let MITTBuilsdEntryActionTrigger = UIButton(type: .system)
    private let MITTBuilsdAgreementComplianceStack = UIStackView()
    private let MITTBuilsdComplianceToggle = UIButton(type: .custom)
    private let MITTBuilsdLegalRichTextAnchor = UITextView()
    private let MITTBuilsdEULADirectAccessLink = UIButton(type: .system)
    
    private var MITTBuilsdIsComplianceVerified: Bool = false
    private let MITTBuilsdActiveAccentColor = UIColor(red: 0.58, green: 0.44, blue: 0.95, alpha: 1.0)
    private let MITTBuilsdInactiveShadeColor = UIColor.white.withAlphaComponent(0.6)

    override func viewDidLoad() {
        super.viewDidLoad()
        MITTBuilsdInitializeCoreInterface()
        MITTBuilsdApplySculptedLayoutConstraints()
    }

    private func MITTBuilsdInitializeCoreInterface() {
        view.backgroundColor = .black
        
        MITTBuilsdHeroCanvasView.image = UIImage(named: "MITTBuilsdLoginHero")
        MITTBuilsdHeroCanvasView.contentMode = .scaleAspectFill
        MITTBuilsdHeroCanvasView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdHeroCanvasView)

        MITTBuilsdEULADirectAccessLink.setBackgroundImage(UIImage.init(named: "MITTBuilsdEULA"), for: .normal)
        MITTBuilsdEULADirectAccessLink.addTarget(self, action: #selector(MITTBuilsdRouteToEULADisplay), for: .touchUpInside)
        MITTBuilsdEULADirectAccessLink.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdEULADirectAccessLink)

        MITTBuilsdEntryActionTrigger.setBackgroundImage(UIImage.init(named: "MITTBuilsdlogbg"), for: .normal)
        MITTBuilsdEntryActionTrigger.addTarget(self, action: #selector(MITTBuilsdExecuteSessionIgnition), for: .touchUpInside)
        MITTBuilsdEntryActionTrigger.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdEntryActionTrigger)

        MITTBuilsdComplianceToggle.setImage(UIImage(named: "MITTBuilsdunsel"), for: .normal)
        MITTBuilsdComplianceToggle.setImage(UIImage(named: "MITTBuilsdun"), for: .selected)
        MITTBuilsdComplianceToggle.tintColor = .white
        MITTBuilsdComplianceToggle.addTarget(self, action: #selector(MITTBuilsdUpdateComplianceState), for: .touchUpInside)
        MITTBuilsdComplianceToggle.translatesAutoresizingMaskIntoConstraints = false

        MITTBuilsdSetupLegalTextCanvas()
        
        MITTBuilsdAgreementComplianceStack.axis = .horizontal
        MITTBuilsdAgreementComplianceStack.spacing = 8
        MITTBuilsdAgreementComplianceStack.alignment = .center
        MITTBuilsdAgreementComplianceStack.addArrangedSubview(MITTBuilsdComplianceToggle)
        MITTBuilsdAgreementComplianceStack.addArrangedSubview(MITTBuilsdLegalRichTextAnchor)
        MITTBuilsdAgreementComplianceStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdAgreementComplianceStack)
    }

    private func MITTBuilsdSetupLegalTextCanvas() {
        let MITTBuilsdBaseAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: MITTBuilsdInactiveShadeColor
        ]
        
        let MITTBuilsdAttributedPrompt = NSMutableAttributedString(string: "By continuing you agree to our <Terms of Service> and <Privacy Policy>.", attributes: MITTBuilsdBaseAttributes)
        
        let MITTBuilsdLinkAttribute: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.white
        ]
        
        MITTBuilsdAttributedPrompt.addAttributes(MITTBuilsdLinkAttribute, range: (MITTBuilsdAttributedPrompt.string as NSString).range(of: "<Terms of Service>"))
        MITTBuilsdAttributedPrompt.addAttributes(MITTBuilsdLinkAttribute, range: (MITTBuilsdAttributedPrompt.string as NSString).range(of: "<Privacy Policy>"))
        
        MITTBuilsdLegalRichTextAnchor.attributedText = MITTBuilsdAttributedPrompt
        MITTBuilsdLegalRichTextAnchor.backgroundColor = .clear
        MITTBuilsdLegalRichTextAnchor.isEditable = false
        MITTBuilsdLegalRichTextAnchor.isScrollEnabled = false
        MITTBuilsdLegalRichTextAnchor.textContainerInset = .zero
        MITTBuilsdLegalRichTextAnchor.textContainer.lineFragmentPadding = 0
        
        let MITTBuilsdGestureDetector = UITapGestureRecognizer(target: self, action: #selector(MITTBuilsdHandleLegalAnchorTap(_:)))
        MITTBuilsdLegalRichTextAnchor.addGestureRecognizer(MITTBuilsdGestureDetector)
    }

    private func MITTBuilsdApplySculptedLayoutConstraints() {
        NSLayoutConstraint.activate([
            MITTBuilsdHeroCanvasView.topAnchor.constraint(equalTo: view.topAnchor),
            MITTBuilsdHeroCanvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            MITTBuilsdHeroCanvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            MITTBuilsdHeroCanvasView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            MITTBuilsdEULADirectAccessLink.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            MITTBuilsdEULADirectAccessLink.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            MITTBuilsdEULADirectAccessLink.widthAnchor.constraint(equalToConstant: 80),
            MITTBuilsdEULADirectAccessLink.heightAnchor.constraint(equalToConstant: 36),

            MITTBuilsdEntryActionTrigger.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            MITTBuilsdEntryActionTrigger.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            MITTBuilsdEntryActionTrigger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            MITTBuilsdEntryActionTrigger.heightAnchor.constraint(equalToConstant: 54),

            MITTBuilsdAgreementComplianceStack.topAnchor.constraint(equalTo: MITTBuilsdEntryActionTrigger.bottomAnchor, constant: 25),
            MITTBuilsdAgreementComplianceStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            MITTBuilsdAgreementComplianceStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            MITTBuilsdComplianceToggle.widthAnchor.constraint(equalToConstant: 24),
            MITTBuilsdComplianceToggle.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    @objc private func MITTBuilsdUpdateComplianceState() {
        MITTBuilsdIsComplianceVerified.toggle()
        MITTBuilsdComplianceToggle.isSelected = MITTBuilsdIsComplianceVerified
    }

    @objc private func MITTBuilsdRouteToEULADisplay() {
        let MITTBuilsdMockOverlay = MITTBuilsdEULADiscretionaryOverlay()
//        MITTBuilsdMockOverlay.view.backgroundColor = .darkGray
        MITTBuilsdMockOverlay.title = "Chamit EULA"
        present(UINavigationController(rootViewController: MITTBuilsdMockOverlay), animated: true)
    }

    @objc private func MITTBuilsdExecuteSessionIgnition() {
        guard MITTBuilsdIsComplianceVerified else {
            let MITTBuilsdFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
            MITTBuilsdFeedbackGenerator.impactOccurred()
            return
        }
        
        self.navigationController?.pushViewController(MITTBuilsdCredentialEntryViewController(), animated: true)
        print("MITTBuilsd: Initiating hobbyist connection sequence...")
    }

    @objc private func MITTBuilsdHandleLegalAnchorTap(_ MITTBuilsdGesture: UITapGestureRecognizer) {
        let MITTBuilsdTapLocation = MITTBuilsdGesture.location(in: MITTBuilsdLegalRichTextAnchor)
        let MITTBuilsdCharacterIndex = MITTBuilsdLegalRichTextAnchor.layoutManager.characterIndex(for: MITTBuilsdTapLocation, in: MITTBuilsdLegalRichTextAnchor.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        let MITTBuilsdFullString = MITTBuilsdLegalRichTextAnchor.text ?? ""
        if let MITTBuilsdTermsRange = MITTBuilsdFullString.range(of: "<Terms of Service>") {
            let MITTBuilsdNsRange = NSRange(MITTBuilsdTermsRange, in: MITTBuilsdFullString)
            if NSLocationInRange(MITTBuilsdCharacterIndex, MITTBuilsdNsRange) {
                print("MITTBuilsd: Routing to Community Terms")
            }
        }
        
        if let MITTBuilsdPrivacyRange = MITTBuilsdFullString.range(of: "<Privacy Policy>") {
            let MITTBuilsdNsRange = NSRange(MITTBuilsdPrivacyRange, in: MITTBuilsdFullString)
            if NSLocationInRange(MITTBuilsdCharacterIndex, MITTBuilsdNsRange) {
                print("MITTBuilsd: Routing to Privacy Shield")
            }
        }
    }
}

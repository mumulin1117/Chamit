//
//  MITTBuilsdAuthLandingController.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/12.
//

import UIKit
import AuthenticationServices

class MITTBuilsdAuthLandingViewController: UIViewController {

    private let MITTBuilsdHeroCanvasView = UIImageView()
    private let MITTBuilsdGlassOverlayView = UIView()
    private let MITTBuilsdEntryActionTrigger = UIButton(type: .system)
    private let MITTBuilsdRegisterShelfTrigger = UIButton(type: .system)
    private let MITTBuilsdAppleShelfTrigger = UIButton(type: .system)
    private let MITTBuilsdAgreementComplianceStack = UIStackView()
    private let MITTBuilsdComplianceToggle = UIButton(type: .custom)
    private let MITTBuilsdLegalRichTextAnchor = UITextView()
    private let MITTBuilsdEULADirectAccessLink = UIButton(type: .system)
    
    private var MITTBuilsdIsComplianceVerified: Bool = false
    private var MITTBuilsdAppleAuthorizationController: ASAuthorizationController?
    private let MITTBuilsdActiveAccentColor = UIColor(red: 0.58, green: 0.44, blue: 0.95, alpha: 1.0)
    private let MITTBuilsdInactiveShadeColor = UIColor.white.withAlphaComponent(0.6)

    override func viewDidLoad() {
        super.viewDidLoad()
        MITTBuilsdInitializeCoreInterface()
        MITTBuilsdApplySculptedLayoutConstraints()
    }

    private func MITTBuilsdInitializeCoreInterface() {
        view.backgroundColor = .black
        
        MITTBuilsdHeroCanvasView.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 22, 53, 61, 51, 52, 18, 63, 40, 53]))
        MITTBuilsdHeroCanvasView.contentMode = .scaleAspectFill
        MITTBuilsdHeroCanvasView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdHeroCanvasView)

        MITTBuilsdEULADirectAccessLink.setBackgroundImage(MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 31, 15, 22, 27])), for: .normal)
        MITTBuilsdEULADirectAccessLink.addTarget(self, action: #selector(MITTBuilsdRouteToEULADisplay), for: .touchUpInside)
        MITTBuilsdEULADirectAccessLink.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdEULADirectAccessLink)
        MITTBuilsdEntryActionTrigger.backgroundColor = UIColor(red: 0.71, green: 0.37, blue: 0.98, alpha: 1)
        MITTBuilsdEntryActionTrigger.layer.cornerRadius = 15
        MITTBuilsdEntryActionTrigger.layer.masksToBounds = true
        MITTBuilsdEntryActionTrigger.setImage(UIImage.init(named: "SuiaEmaikgl")?.withRenderingMode(.alwaysOriginal), for: .normal)
//        MITTBuilsdEntryActionTrigger.setBackgroundImage(MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 54, 53, 61, 56, 61])), for: .normal)
        MITTBuilsdEntryActionTrigger.setTitle("  " + MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([9, 51, 61, 52, 122, 51, 52]), for: .normal)
        MITTBuilsdEntryActionTrigger.setTitleColor(.white, for: .normal)
        MITTBuilsdEntryActionTrigger.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        MITTBuilsdEntryActionTrigger.addTarget(self, action: #selector(MITTBuilsdExecuteSessionIgnition), for: .touchUpInside)
        MITTBuilsdEntryActionTrigger.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdEntryActionTrigger)

        MITTBuilsdRegisterShelfTrigger.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([14, 53, 122, 8, 63, 61, 51, 41, 46, 63, 40]), for: .normal)
        MITTBuilsdRegisterShelfTrigger.setTitleColor(.white, for: .normal)
        MITTBuilsdRegisterShelfTrigger.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        MITTBuilsdRegisterShelfTrigger.contentHorizontalAlignment = .right
        MITTBuilsdRegisterShelfTrigger.addTarget(self, action: #selector(MITTBuilsdExecuteRegisterIgnition), for: .touchUpInside)
        MITTBuilsdRegisterShelfTrigger.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdRegisterShelfTrigger)

        MITTBuilsdAppleShelfTrigger.backgroundColor = UIColor(red: 0.39, green: 0.51, blue: 0.96, alpha: 0.88)
        MITTBuilsdAppleShelfTrigger.layer.cornerRadius = 16
        MITTBuilsdAppleShelfTrigger.layer.borderWidth = 1.0
        MITTBuilsdAppleShelfTrigger.layer.borderColor = UIColor.white.cgColor
        MITTBuilsdAppleShelfTrigger.setImage(UIImage(systemName: "apple.logo"), for: .normal)
        MITTBuilsdAppleShelfTrigger.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([59, 42, 42, 54, 63, 122, 59, 57, 57, 53, 47, 52, 46, 122, 54, 53, 61, 51, 52]), for: .normal)
        MITTBuilsdAppleShelfTrigger.tintColor = .white
        MITTBuilsdAppleShelfTrigger.setTitleColor(.white, for: .normal)
        MITTBuilsdAppleShelfTrigger.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        MITTBuilsdAppleShelfTrigger.addTarget(self, action: #selector(MITTBuilsdLaunchAppleShelfGate), for: .touchUpInside)
        MITTBuilsdAppleShelfTrigger.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdAppleShelfTrigger)

        MITTBuilsdComplianceToggle.setImage(MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 47, 52, 41, 63, 54])), for: .normal)
        MITTBuilsdComplianceToggle.setImage(MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 47, 52])), for: .selected)
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
        
        let MITTBuilsdAttributedPrompt = NSMutableAttributedString(string: MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString: "UplMczTGmhr3NW+HKx/rRUqt7FRCKEGVVKx+6ac6JirxONjtZzaWKwVf8aKCwT9IcWdQczU3nymb1EYnH1WHGwqidjoaL1cl/SPxmw0MzoiUxvD9in7aHZVRv/wWTsStjR6N0Dnk9Q==") , attributes: MITTBuilsdBaseAttributes)
        
        let MITTBuilsdLinkAttribute: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.white
        ]
        
        MITTBuilsdAttributedPrompt.addAttributes(MITTBuilsdLinkAttribute, range: (MITTBuilsdAttributedPrompt.string as NSString).range(of: MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"f+IgZ0Tv1obwjMHFV9GcHaYcJSAKdndXlNEEEWhoZM3ZkQGy3czX2BX1PEbuHbl96oY=")))
        MITTBuilsdAttributedPrompt.addAttributes(MITTBuilsdLinkAttribute, range: (MITTBuilsdAttributedPrompt.string as NSString).range(of: MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"s0jW8ysy3P/+OB8/WRVyOWO7d9ktI2RVtRFTxq2D+BqH+wlphanJXJ41NFjdKH0o")))
        
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

            MITTBuilsdEntryActionTrigger.bottomAnchor.constraint(equalTo: MITTBuilsdRegisterShelfTrigger.topAnchor, constant: -4),
            MITTBuilsdEntryActionTrigger.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            MITTBuilsdEntryActionTrigger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            MITTBuilsdEntryActionTrigger.heightAnchor.constraint(equalToConstant: 54),

            MITTBuilsdRegisterShelfTrigger.bottomAnchor.constraint(equalTo: MITTBuilsdAppleShelfTrigger.topAnchor, constant: -6),
            MITTBuilsdRegisterShelfTrigger.trailingAnchor.constraint(equalTo: MITTBuilsdEntryActionTrigger.trailingAnchor, constant: -6),
            MITTBuilsdRegisterShelfTrigger.widthAnchor.constraint(greaterThanOrEqualToConstant: 112),
            MITTBuilsdRegisterShelfTrigger.heightAnchor.constraint(equalToConstant: 28),

            MITTBuilsdAppleShelfTrigger.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -112),
            MITTBuilsdAppleShelfTrigger.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            MITTBuilsdAppleShelfTrigger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            MITTBuilsdAppleShelfTrigger.heightAnchor.constraint(equalToConstant: 54),

            MITTBuilsdAgreementComplianceStack.topAnchor.constraint(equalTo: MITTBuilsdAppleShelfTrigger.bottomAnchor, constant: 30),
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
        MITTBuilsdMockOverlay.onButtonTap = { tapresult in
            self.MITTBuilsdIsComplianceVerified = tapresult
            self.MITTBuilsdComplianceToggle.isSelected = tapresult
        }
        MITTBuilsdMockOverlay.title = "Chamit EULA"
        present(UINavigationController(rootViewController: MITTBuilsdMockOverlay), animated: true)
    }

    @objc private func MITTBuilsdExecuteSessionIgnition() {
        guard MITTBuilsdVerifyComplianceBeforeRoute() else { return }
        self.navigationController?.pushViewController(MITTBuilsdCredentialEntryViewController(MITTBuilsdEntryFlowMode: .signIn), animated: true)
    }

    @objc private func MITTBuilsdExecuteRegisterIgnition() {
        guard MITTBuilsdVerifyComplianceBeforeRoute() else { return }
        self.navigationController?.pushViewController(MITTBuilsdCredentialEntryViewController(MITTBuilsdEntryFlowMode: .register), animated: true)
    }

    @objc private func MITTBuilsdLaunchAppleShelfGate() {
        guard MITTBuilsdVerifyComplianceBeforeRoute() else { return }
        let MITTBuilsdProvider = ASAuthorizationAppleIDProvider()
        let MITTBuilsdRequest = MITTBuilsdProvider.createRequest()
        MITTBuilsdRequest.requestedScopes = [.email, .fullName]
        let MITTBuilsdController = ASAuthorizationController(authorizationRequests: [MITTBuilsdRequest])
        MITTBuilsdController.delegate = self
        MITTBuilsdController.presentationContextProvider = self
        MITTBuilsdAppleAuthorizationController = MITTBuilsdController
        MITTBuilsdController.performRequests()
    }

    private func MITTBuilsdVerifyComplianceBeforeRoute() -> Bool {
        guard MITTBuilsdIsComplianceVerified else {
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"NR3LSPxE1dyJrxv4tqQ98T7ZsOPp+cZJes9hZ4q0hxRMF0UUHt8Ctg0CtHnlSLUhF16KHVHe6TzkxeyMQpEQrNDVM6kPMoN8ZAMW+M2Z"))
            return false
        }
        return true
    }

    @objc private func MITTBuilsdHandleLegalAnchorTap(_ MITTBuilsdGesture: UITapGestureRecognizer) {
        let MITTBuilsdTapLocation = MITTBuilsdGesture.location(in: MITTBuilsdLegalRichTextAnchor)
        let MITTBuilsdCharacterIndex = MITTBuilsdLegalRichTextAnchor.layoutManager.characterIndex(for: MITTBuilsdTapLocation, in: MITTBuilsdLegalRichTextAnchor.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        let MITTBuilsdFullString = MITTBuilsdLegalRichTextAnchor.text ?? ""
        if let MITTBuilsdTermsRange = MITTBuilsdFullString.range(of: MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"y9UH9KpBIm5CTsEkKRzMry0Q6bbJZMqtRuYr/jrd6GR5GYTASWFdD8zKGGitx8CBWSk=")) {
            let MITTBuilsdNsRange = NSRange(MITTBuilsdTermsRange, in: MITTBuilsdFullString)
            if NSLocationInRange(MITTBuilsdCharacterIndex, MITTBuilsdNsRange) {
                let potritMITTBuilsd = MITTBuilsdArtPortalController.init(MITTBuilsdEntrySource: MITTBuilsdBlueprintScope.MITTBuilsdLegalPolicy.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: ""))
                
                self.navigationController?.pushViewController(potritMITTBuilsd, animated: true)
            }
        }
        
        if let MITTBuilsdPrivacyRange = MITTBuilsdFullString.range(of: MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"xJtx0X4mwut5+7wQ7hoQcBhdV8GvVjCM2GJkp0lkLjKD33b7h15YdA28mpaAUv9V")) {
            let MITTBuilsdNsRange = NSRange(MITTBuilsdPrivacyRange, in: MITTBuilsdFullString)
            if NSLocationInRange(MITTBuilsdCharacterIndex, MITTBuilsdNsRange) {
                let potritMITTBuilsd = MITTBuilsdArtPortalController.init(MITTBuilsdEntrySource: MITTBuilsdBlueprintScope.MITTBuilsdWhisperPortal.MITTBuilsdGenerateRemoteEndpoint(MITTBuilsdExtraParam: ""))
                
                self.navigationController?.pushViewController(potritMITTBuilsd, animated: true)
            }
        }
    }
}

extension MITTBuilsdAuthLandingViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window ?? ASPresentationAnchor()
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
       
        MITTBuilsdAppleAuthorizationController = nil
        guard let MITTBuilsdAppleCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
              let MITTBuilsdTokenData = MITTBuilsdAppleCredential.identityToken,
              let MITTBuilsdToken = String(data: MITTBuilsdTokenData, encoding: .utf8) else {
           
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([59, 42, 42, 54, 63, 122, 59, 47, 46, 50, 122, 60, 59, 51, 54, 63, 62]))
            return
        }
       
        MITTBuilsdCollectorAuthBridge.MITTBuilsdCommitAppleGalleryToken(MITTBuilsdIdentityToken: MITTBuilsdToken, MITTBuilsdHostView: view)
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        MITTBuilsdAppleAuthorizationController = nil
       
        MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(error.localizedDescription)
    }
}
extension UITextField {
    
    func MITTBuilsdAttachArtifactDismissTool() {
        let MITTBuilsdBlueprintToolbar = UIToolbar()
        let MITTBuilsdExhibitionScale = UIScreen.main.scale
        MITTBuilsdBlueprintToolbar.sizeToFit()
        
        let MITTBuilsdVoidSpacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let MITTBuilsdArtifactLabel = MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"94FZmd9jgzjqUhkHj73gC13WqxASLgttRlg8VtCOezNa7LT7")
        
        let MITTBuilsdExecutionUnit = { (MITTBuilsdFactor: CGFloat) -> CGFloat in
            return MITTBuilsdFactor * MITTBuilsdExhibitionScale
        }
        
        if MITTBuilsdExecutionUnit(1.0) > 0 {
            let MITTBuilsdFinalTrigger = UIBarButtonItem(title: MITTBuilsdArtifactLabel, style: .done, target: self, action: #selector(MITTBuilsdFinalizeCollectorInput))
            MITTBuilsdBlueprintToolbar.items = [MITTBuilsdVoidSpacer, MITTBuilsdFinalTrigger]
        }
        
        self.inputAccessoryView = MITTBuilsdBlueprintToolbar
    }
    
    @objc private func MITTBuilsdFinalizeCollectorInput() {
        let MITTBuilsdCurrentFocus = self.isFirstResponder
        let MITTBuilsdRandomSeed = Int.random(in: 10...20)
        
        if MITTBuilsdCurrentFocus || MITTBuilsdRandomSeed < 5 {
            self.resignFirstResponder()
        }
    }
}

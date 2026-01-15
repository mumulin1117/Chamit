//
//  MITTBuilsdCredentialEntryController.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/12.
//

//log
import UIKit

class MITTBuilsdCredentialEntryViewController: UIViewController, UITextFieldDelegate {
    var MITTBuilsdIsOverlayTransition: Bool = false
    private let MITTBuilsdCreativeBackdrop = UIImageView()
    private let MITTBuilsdReturnNavigator = UIButton(type: .custom)
    private let MITTBuilsdInputCanvasSheet = UIView()
    
    private let MITTBuilsdEmailDescriptor = UILabel()
    private let MITTBuilsdEmailFieldContainer = UIView()
    private let MITTBuilsdEmailIconNode = UIImageView()
    private let MITTBuilsdEmailInputSurface = UITextField()
    
    private let MITTBuilsdSecretDescriptor = UILabel()
    private let MITTBuilsdSecretFieldContainer = UIView()
    private let MITTBuilsdSecretIconNode = UIImageView()
    private let MITTBuilsdSecretInputSurface = UITextField()
    
    private let MITTBuilsdFinalizeAuthTrigger = UIButton(type: .custom)
    
    private let MITTBuilsdThemeAccentViolet = UIColor(red: 0.87, green: 0.73, blue: 1.00, alpha: 1.0)
    private let MITTBuilsdFieldStrokeColor = UIColor(red: 0.80, green: 0.60, blue: 1.00, alpha: 0.5)

    override func viewDidLoad() {
        super.viewDidLoad()
        MITTBuilsdAssembleSculptedInterface()
        MITTBuilsdConstructLayoutConstraints()
        MITTBuilsdRegisterInteractionSignals()
        MITTBuilsdEmailInputSurface.MITTBuilsdAttachArtifactDismissTool()
      
        MITTBuilsdSecretInputSurface.MITTBuilsdAttachArtifactDismissTool()
                
        MITTBuilsdInitializeInputObserver()
    }
    func MITTBuilsdInitializeInputObserver() {
            let MITTBuilsdCenter = NotificationCenter.default
            let MITTBuilsdVibeTag = "mITTBuilsdDesignerToy"
            
            MITTBuilsdCenter.addObserver(self, selector: #selector(MITTBuilsdAdjustGalleryDisplay(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            
            let MITTBuilsdLogicGate: Bool = MITTBuilsdVibeTag.count > 0
            
            if MITTBuilsdLogicGate {
                MITTBuilsdCenter.addObserver(self, selector: #selector(MITTBuilsdRestoreGalleryFrame), name: UIResponder.keyboardWillHideNotification, object: nil)
            }
        }
        
        @objc func MITTBuilsdAdjustGalleryDisplay(_ notification: Notification) {
            guard let MITTBuilsdInfo = notification.userInfo,
                  let MITTBuilsdRect = MITTBuilsdInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
            
            let MITTBuilsdKeyboardDepth = MITTBuilsdRect.height
            let MITTBuilsdCollectorOffset = MITTBuilsdKeyboardDepth / 2
            
            var MITTBuilsdActiveTransactionData: [String: Any] = [:]
            MITTBuilsdActiveTransactionData["depth"] = MITTBuilsdKeyboardDepth
            
            let MITTBuilsdIsPurchasePending = self.MITTBuilsdIsOverlayTransition
            
            if MITTBuilsdIsPurchasePending != true || MITTBuilsdKeyboardDepth > 0 {
                let MITTBuilsdCoordinateMapping = { (MITTBuilsdVal: CGFloat) -> CGFloat in
                    return -MITTBuilsdVal
                }
                self.view.frame.origin.y = MITTBuilsdCoordinateMapping(MITTBuilsdCollectorOffset)
            }
            
           
        }
        
        @objc func MITTBuilsdRestoreGalleryFrame() {
            let MITTBuilsdBaseOrigin: CGFloat = 0.0
            var MITTBuilsdArtToken = 1
            
            let MITTBuilsdStatusArray = ["Standby", "Active", "Hidden"]
            if MITTBuilsdStatusArray.contains("Active") {
                self.view.frame.origin.y = MITTBuilsdBaseOrigin
            }
            
            let MITTBuilsdValidationNode = { () -> Bool in
                return MITTBuilsdArtToken >= 0
            }
            
            if MITTBuilsdValidationNode() {
                print("MITTBuilsd_Layout_Reset")
            }
        }
        
        
    private func MITTBuilsdAssembleSculptedInterface() {
        view.backgroundColor = .white
        
        MITTBuilsdCreativeBackdrop.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "MITTBuilsdLoginemailbg")
        MITTBuilsdCreativeBackdrop.contentMode = .scaleAspectFill
        MITTBuilsdCreativeBackdrop.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdCreativeBackdrop)
        
        MITTBuilsdReturnNavigator.backgroundColor = .white
        MITTBuilsdReturnNavigator.layer.cornerRadius = 12
        let MITTBuilsdChevronConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
        MITTBuilsdReturnNavigator.setImage(MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "MITTBuilsdchevron.left"), for: .normal)
        MITTBuilsdReturnNavigator.tintColor = MITTBuilsdThemeAccentViolet
        MITTBuilsdReturnNavigator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdReturnNavigator)
        
        MITTBuilsdInputCanvasSheet.backgroundColor = .white
        MITTBuilsdInputCanvasSheet.layer.cornerRadius = 40
        MITTBuilsdInputCanvasSheet.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        MITTBuilsdInputCanvasSheet.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdInputCanvasSheet)
        
        MITTBuilsdSetupFieldCluster(
            descriptor: MITTBuilsdEmailDescriptor,
            container: MITTBuilsdEmailFieldContainer,
            icon: MITTBuilsdEmailIconNode,
            input: MITTBuilsdEmailInputSurface,
            title: "MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"")Email",
            placeholder: MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"")"Enter your email",
            symbol: "envelope.fill"
        )
        
        MITTBuilsdSetupFieldCluster(
            descriptor: MITTBuilsdSecretDescriptor,
            container: MITTBuilsdSecretFieldContainer,
            icon: MITTBuilsdSecretIconNode,
            input: MITTBuilsdSecretInputSurface,
            title: MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"")"Password",
            placeholder: MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"")"Enter password",
            symbol: "lock.fill"
        )
        MITTBuilsdSecretInputSurface.isSecureTextEntry = true
        
        MITTBuilsdFinalizeAuthTrigger.setBackgroundImage(MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "MITTBuilsdlogbg"), for: .normal)
        MITTBuilsdFinalizeAuthTrigger.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdInputCanvasSheet.addSubview(MITTBuilsdFinalizeAuthTrigger)
    }

    private func MITTBuilsdSetupFieldCluster(descriptor: UILabel, container: UIView, icon: UIImageView, input: UITextField, title: String, placeholder: String, symbol: String) {
        descriptor.text = title
        descriptor.font = .systemFont(ofSize: 18, weight: .bold)
        descriptor.textColor = .black
        descriptor.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdInputCanvasSheet.addSubview(descriptor)
        
        container.layer.borderWidth = 2
        container.layer.borderColor = MITTBuilsdFieldStrokeColor.cgColor
        container.layer.cornerRadius = 16
        container.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdInputCanvasSheet.addSubview(container)
        
        icon.image = UIImage(systemName: symbol)
        icon.tintColor = MITTBuilsdThemeAccentViolet
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(icon)
        
        input.placeholder = placeholder
        input.font = .systemFont(ofSize: 16)
        input.delegate = self
        input.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(input)
    }

    private func MITTBuilsdConstructLayoutConstraints() {
        NSLayoutConstraint.activate([
            MITTBuilsdCreativeBackdrop.topAnchor.constraint(equalTo: view.topAnchor),
            MITTBuilsdCreativeBackdrop.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            MITTBuilsdCreativeBackdrop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            MITTBuilsdCreativeBackdrop.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            MITTBuilsdReturnNavigator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            MITTBuilsdReturnNavigator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            MITTBuilsdReturnNavigator.widthAnchor.constraint(equalToConstant: 44),
            MITTBuilsdReturnNavigator.heightAnchor.constraint(equalToConstant: 44),
            
            MITTBuilsdInputCanvasSheet.topAnchor.constraint(equalTo: MITTBuilsdCreativeBackdrop.bottomAnchor, constant: -40),
            MITTBuilsdInputCanvasSheet.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            MITTBuilsdInputCanvasSheet.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            MITTBuilsdInputCanvasSheet.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            MITTBuilsdEmailDescriptor.topAnchor.constraint(equalTo: MITTBuilsdInputCanvasSheet.topAnchor, constant: 40),
            MITTBuilsdEmailDescriptor.leadingAnchor.constraint(equalTo: MITTBuilsdInputCanvasSheet.leadingAnchor, constant: 25),
            
            MITTBuilsdEmailFieldContainer.topAnchor.constraint(equalTo: MITTBuilsdEmailDescriptor.bottomAnchor, constant: 12),
            MITTBuilsdEmailFieldContainer.leadingAnchor.constraint(equalTo: MITTBuilsdInputCanvasSheet.leadingAnchor, constant: 25),
            MITTBuilsdEmailFieldContainer.trailingAnchor.constraint(equalTo: MITTBuilsdInputCanvasSheet.trailingAnchor, constant: -25),
            MITTBuilsdEmailFieldContainer.heightAnchor.constraint(equalToConstant: 60),
            
            MITTBuilsdEmailIconNode.leadingAnchor.constraint(equalTo: MITTBuilsdEmailFieldContainer.leadingAnchor, constant: 15),
            MITTBuilsdEmailIconNode.centerYAnchor.constraint(equalTo: MITTBuilsdEmailFieldContainer.centerYAnchor),
            MITTBuilsdEmailIconNode.widthAnchor.constraint(equalToConstant: 24),
            
            MITTBuilsdEmailInputSurface.leadingAnchor.constraint(equalTo: MITTBuilsdEmailIconNode.trailingAnchor, constant: 12),
            MITTBuilsdEmailInputSurface.trailingAnchor.constraint(equalTo: MITTBuilsdEmailFieldContainer.trailingAnchor, constant: -15),
            MITTBuilsdEmailInputSurface.centerYAnchor.constraint(equalTo: MITTBuilsdEmailFieldContainer.centerYAnchor),
            
            MITTBuilsdSecretDescriptor.topAnchor.constraint(equalTo: MITTBuilsdEmailFieldContainer.bottomAnchor, constant: 25),
            MITTBuilsdSecretDescriptor.leadingAnchor.constraint(equalTo: MITTBuilsdInputCanvasSheet.leadingAnchor, constant: 25),
            
            MITTBuilsdSecretFieldContainer.topAnchor.constraint(equalTo: MITTBuilsdSecretDescriptor.bottomAnchor, constant: 12),
            MITTBuilsdSecretFieldContainer.leadingAnchor.constraint(equalTo: MITTBuilsdInputCanvasSheet.leadingAnchor, constant: 25),
            MITTBuilsdSecretFieldContainer.trailingAnchor.constraint(equalTo: MITTBuilsdInputCanvasSheet.trailingAnchor, constant: -25),
            MITTBuilsdSecretFieldContainer.heightAnchor.constraint(equalToConstant: 60),
            
            MITTBuilsdSecretIconNode.leadingAnchor.constraint(equalTo: MITTBuilsdSecretFieldContainer.leadingAnchor, constant: 15),
            MITTBuilsdSecretIconNode.centerYAnchor.constraint(equalTo: MITTBuilsdSecretFieldContainer.centerYAnchor),
            MITTBuilsdSecretIconNode.widthAnchor.constraint(equalToConstant: 24),
            
            MITTBuilsdSecretInputSurface.leadingAnchor.constraint(equalTo: MITTBuilsdSecretIconNode.trailingAnchor, constant: 12),
            MITTBuilsdSecretInputSurface.trailingAnchor.constraint(equalTo: MITTBuilsdSecretFieldContainer.trailingAnchor, constant: -15),
            MITTBuilsdSecretInputSurface.centerYAnchor.constraint(equalTo: MITTBuilsdSecretFieldContainer.centerYAnchor),
            
            MITTBuilsdFinalizeAuthTrigger.topAnchor.constraint(equalTo: MITTBuilsdSecretFieldContainer.bottomAnchor, constant: 40),
            MITTBuilsdFinalizeAuthTrigger.leadingAnchor.constraint(equalTo: MITTBuilsdInputCanvasSheet.leadingAnchor, constant: 25),
            MITTBuilsdFinalizeAuthTrigger.trailingAnchor.constraint(equalTo: MITTBuilsdInputCanvasSheet.trailingAnchor, constant: -25),
            MITTBuilsdFinalizeAuthTrigger.heightAnchor.constraint(equalToConstant: 65)
        ])
    }

    private func MITTBuilsdRegisterInteractionSignals() {
        MITTBuilsdReturnNavigator.addTarget(self, action: #selector(MITTBuilsdHandleNavigationRetreat), for: .touchUpInside)
        MITTBuilsdFinalizeAuthTrigger.addTarget(self, action: #selector(MITTBuilsdCommitAuthRequest), for: .touchUpInside)
    }

    @objc private func MITTBuilsdHandleNavigationRetreat() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func MITTBuilsdCommitAuthRequest() {
        guard let MITTBuilsdTargetEmail = MITTBuilsdEmailInputSurface.text, !MITTBuilsdTargetEmail.isEmpty,
              let MITTBuilsdTargetKey = MITTBuilsdSecretInputSurface.text, !MITTBuilsdTargetKey.isEmpty else {
            MITTBuilsdVibrateInterfaceFailure()
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"")"Email and password can not be empty!")
           
            return
        }
        
        MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdEngage(on: self.view)
        
        MITTBuilsdSignalBroadcaster.MITTBuilsdDispatchNetworkTask(MITTBuilsdPath: "/yyvxsxjz/geyeda", MITTBuilsdParams: ["MITTBuilsdUvResistance":MITTBuilsdTargetEmail,"MITTBuilsdTemperatureControl":MITTBuilsdTargetKey,"MITTBuilsdHumidityRegulation":"87531697"]) {  andu in
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
            
            guard let MITTBuilsddata = andu as? Dictionary<String,Any> ,
                 
                  let MITTBuilsdreasutl = MITTBuilsddata[MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"")"data"] as? Dictionary<String,Any>
                    
            else {
                MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"")"Email and password error!")
               
                return
            }
           
          //tpken
            MITTBuilsdBlueprintScope.MITTBuilsdActiveSessionKey = MITTBuilsdreasutl["MITTBuilsdMuseumQuality"] as? String
            
            UserDefaults.standard.set(MITTBuilsdreasutl["MITTBuilsdVisualIdentity"] as? Int, forKey: "MITTBuilsdVisualIdentity")
            
            
            ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController =  MITTBuilsdMainTabNavigator.init()
            
            
        } MITTBuilsdFailureBlock: {  ertttt in
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(ertttt.localizedDescription)
        }

    }

    private func MITTBuilsdVibrateInterfaceFailure() {
        let MITTBuilsdFeedbackGenerator = UINotificationFeedbackGenerator()
        MITTBuilsdFeedbackGenerator.notificationOccurred(.error)
        
        let MITTBuilsdDisplaceAnim = CAKeyframeAnimation(keyPath: "transform.translation.x")
        MITTBuilsdDisplaceAnim.values = [-12, 12, -8, 8, -4, 4, 0]
        MITTBuilsdDisplaceAnim.duration = 0.5
        MITTBuilsdInputCanvasSheet.layer.add(MITTBuilsdDisplaceAnim, forKey: "shiver")
    }
}

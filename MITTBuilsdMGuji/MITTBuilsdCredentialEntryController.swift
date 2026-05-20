//
//  MITTBuilsdCredentialEntryController.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/12.
//

import UIKit
import AuthenticationServices
import AVFoundation

enum MITTBuilsdCollectorObscura {
    static func MITTBuilsdRevealShelfCopy(_ MITTBuilsdUnits: [UInt8]) -> String {
        String(bytes: MITTBuilsdUnits.map { $0 ^ 90 }, encoding: .utf8) ?? ""
    }
}

struct MITTBuilsdCollectorAuthRecord: Codable {
    let MITTBuilsdShelfMail: String
    var MITTBuilsdShelfPassword: String
    var MITTBuilsdShelfName: String
    var MITTBuilsdShelfAge: Int
    var MITTBuilsdShelfBirthYear: Int
    var MITTBuilsdShelfAvatarArchive: Data?
    var MITTBuilsdShelfInterests: [String]
    var MITTBuilsdShelfAppleIdentity: String?
    var MITTBuilsdShelfGenderMark: String?
}

enum MITTBuilsdCollectorAuthVault {
    private static let MITTBuilsdShelfRosterKey = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 5, 25, 50, 59, 55, 51, 46, 5, 9, 50, 63, 54, 60, 5, 8, 53, 41, 46, 63, 40])
    static let MITTBuilsdTestingMail = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([107, 104, 105, 110, 111, 108, 109, 98, 99, 26, 61, 55, 59, 51, 54, 116, 57, 53, 55])
    static let MITTBuilsdTestingSecret = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([107, 104, 105, 110, 111, 108, 109, 98, 99])

    static func MITTBuilsdStoredCollector(MITTBuilsdMail: String) -> MITTBuilsdCollectorAuthRecord? {
        let MITTBuilsdToken = MITTBuilsdMail.lowercased()
        guard let MITTBuilsdData = UserDefaults.standard.data(forKey: MITTBuilsdShelfRosterKey),
              let MITTBuilsdDecoded = try? JSONDecoder().decode([String: MITTBuilsdCollectorAuthRecord].self, from: MITTBuilsdData) else {
            return nil
        }
        return MITTBuilsdDecoded[MITTBuilsdToken]
    }

    static func MITTBuilsdHasCollector(MITTBuilsdMail: String) -> Bool {
        MITTBuilsdStoredCollector(MITTBuilsdMail: MITTBuilsdMail) != nil
    }

    static func MITTBuilsdStoreCollector(_ MITTBuilsdRecord: MITTBuilsdCollectorAuthRecord) {
        var MITTBuilsdRoster = [String: MITTBuilsdCollectorAuthRecord]()
        if let MITTBuilsdData = UserDefaults.standard.data(forKey: MITTBuilsdShelfRosterKey),
           let MITTBuilsdDecoded = try? JSONDecoder().decode([String: MITTBuilsdCollectorAuthRecord].self, from: MITTBuilsdData) {
            MITTBuilsdRoster = MITTBuilsdDecoded
        }
        MITTBuilsdRoster[MITTBuilsdRecord.MITTBuilsdShelfMail.lowercased()] = MITTBuilsdRecord
        if let MITTBuilsdEncoded = try? JSONEncoder().encode(MITTBuilsdRoster) {
            UserDefaults.standard.set(MITTBuilsdEncoded, forKey: MITTBuilsdShelfRosterKey)
        }
        UserDefaults.standard.set(MITTBuilsdRecord.MITTBuilsdShelfName, forKey: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 25, 53, 54, 54, 63, 57, 46, 53, 40, 9, 50, 63, 54, 60, 20, 59, 55, 63]))
        UserDefaults.standard.set(MITTBuilsdRecord.MITTBuilsdShelfAge, forKey: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 25, 53, 54, 54, 63, 57, 46, 53, 40, 9, 50, 63, 54, 60, 27, 61, 63]))
        UserDefaults.standard.set(MITTBuilsdRecord.MITTBuilsdShelfBirthYear, forKey: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 25, 53, 54, 54, 63, 57, 46, 53, 40, 9, 50, 63, 54, 60, 24, 51, 40, 46, 50, 3, 63, 59, 40]))
        UserDefaults.standard.set(MITTBuilsdRecord.MITTBuilsdShelfAvatarArchive, forKey: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 25, 53, 54, 54, 63, 57, 46, 53, 40, 9, 50, 63, 54, 60, 27, 44, 59, 46, 59, 40, 27, 40, 57, 50, 51, 44, 63]))
        UserDefaults.standard.set(MITTBuilsdRecord.MITTBuilsdShelfInterests, forKey: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 25, 53, 54, 54, 63, 57, 46, 53, 40, 9, 50, 63, 54, 60, 19, 52, 46, 63, 40, 63, 41, 46, 41]))
    }
}

enum MITTBuilsdCollectorAuthBridge {
    static func MITTBuilsdEnterLocalCollectorDeck(MITTBuilsdIdentity: Int = 87531697, MITTBuilsdToken: String = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 22, 53, 57, 59, 54, 9, 50, 63, 54, 60, 9, 63, 41, 41, 51, 53, 52])) {
        MITTBuilsdBlueprintScope.MITTBuilsdActiveSessionKey = MITTBuilsdToken
        UserDefaults.standard.set(MITTBuilsdIdentity, forKey: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 12, 51, 41, 47, 59, 54, 19, 62, 63, 52, 46, 51, 46, 35]))
        ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController = MITTBuilsdMainTabNavigator()
    }

    static func MITTBuilsdCommitOriginalLogin(MITTBuilsdEmail: String, MITTBuilsdSecret: String, MITTBuilsdHostView: UIView, MITTBuilsdFailureFallback: (() -> Void)? = nil) {
        MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdEngage(on: MITTBuilsdHostView)
        let MITTBuilsdParcel: [String: Any] = [
            MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 15, 44, 8, 63, 41, 51, 41, 46, 59, 52, 57, 63]): MITTBuilsdEmail,
            MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 14, 63, 55, 42, 63, 40, 59, 46, 47, 40, 63, 25, 53, 52, 46, 40, 53, 54]): MITTBuilsdSecret,
            MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 18, 47, 55, 51, 62, 51, 46, 35, 8, 63, 61, 47, 54, 59, 46, 51, 53, 52]): MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([98, 109, 111, 105, 107, 108, 99, 109])
        ]
        MITTBuilsdSignalBroadcaster.MITTBuilsdDispatchNetworkTask(MITTBuilsdPath: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([117, 35, 35, 44, 34, 41, 34, 48, 32, 117, 61, 63, 35, 63, 62, 59]), MITTBuilsdParams: MITTBuilsdParcel) { MITTBuilsdResponse in
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
            guard let MITTBuilsdEnvelope = MITTBuilsdResponse as? [String: Any],
                  let MITTBuilsdPayload = MITTBuilsdEnvelope[MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"F1bzWVlQR23QNIizXBsRqkSTejejNaUGU5sU8xb1gtW7okva")] as? [String: Any] else {
                MITTBuilsdFailureFallback?()
                return
            }
            MITTBuilsdBlueprintScope.MITTBuilsdActiveSessionKey = MITTBuilsdPayload[MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 23, 47, 41, 63, 47, 55, 11, 47, 59, 54, 51, 46, 35])] as? String
            UserDefaults.standard.set(MITTBuilsdPayload[MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 12, 51, 41, 47, 59, 54, 19, 62, 63, 52, 46, 51, 46, 35])] as? Int, forKey: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 12, 51, 41, 47, 59, 54, 19, 62, 63, 52, 46, 51, 46, 35]))
            ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController = MITTBuilsdMainTabNavigator()
        } MITTBuilsdFailureBlock: { MITTBuilsdError in
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
            if let MITTBuilsdFallback = MITTBuilsdFailureFallback {
                MITTBuilsdFallback()
            } else {
                MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(MITTBuilsdError.localizedDescription)
            }
        }
    }

    static func MITTBuilsdCommitAppleGalleryToken(MITTBuilsdIdentityToken: String, MITTBuilsdHostView: UIView) {
        MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdEngage(on: MITTBuilsdHostView)
        let MITTBuilsdPacket: [String: Any] = [
            MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([51, 62, 63, 52, 46, 51, 46, 35, 14, 53, 49, 63, 52]): MITTBuilsdIdentityToken,
            MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 18, 47, 55, 51, 62, 51, 46, 35, 8, 63, 61, 47, 54, 59, 46, 51, 53, 52]): MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([98, 109, 111, 105, 107, 108, 99, 109]),
            MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 30, 40, 53, 42, 25, 50, 59, 52, 52, 63, 54]): MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([51, 53, 41])
        ]
        MITTBuilsdSignalBroadcaster.MITTBuilsdDispatchNetworkTask(MITTBuilsdPath: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([117, 59, 42, 42, 54, 53, 9, 41, 53, 22, 53, 61, 51, 52]), MITTBuilsdParams: MITTBuilsdPacket) { MITTBuilsdResponse in
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
            if let MITTBuilsdEnvelope = MITTBuilsdResponse as? [String: Any],
               let MITTBuilsdPayload = MITTBuilsdEnvelope[MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"F1bzWVlQR23QNIizXBsRqkSTejejNaUGU5sU8xb1gtW7okva")] as? [String: Any] {
                MITTBuilsdBlueprintScope.MITTBuilsdActiveSessionKey = MITTBuilsdPayload[MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 23, 47, 41, 63, 47, 55, 11, 47, 59, 54, 51, 46, 35])] as? String
                UserDefaults.standard.set(MITTBuilsdPayload[MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 12, 51, 41, 47, 59, 54, 19, 62, 63, 52, 46, 51, 46, 35])] as? Int, forKey: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 12, 51, 41, 47, 59, 54, 19, 62, 63, 52, 46, 51, 46, 35]))
                if let MITTBuilsdMail = MITTBuilsdPayload[MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([63, 55, 59, 51, 54])] as? String {
                    var MITTBuilsdRecord = MITTBuilsdCollectorAuthRecord(MITTBuilsdShelfMail: MITTBuilsdMail, MITTBuilsdShelfPassword: "", MITTBuilsdShelfName: MITTBuilsdMail.components(separatedBy: "@").first ?? MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([9, 50, 63, 54, 60, 122, 25, 53, 54, 54, 63, 57, 46, 53, 40]), MITTBuilsdShelfAge: 25, MITTBuilsdShelfBirthYear: Calendar.current.component(.year, from: Date()) - 25, MITTBuilsdShelfAvatarArchive: nil, MITTBuilsdShelfInterests: [MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([24, 54, 51, 52, 62, 56, 53, 34]), MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([30, 63, 41, 51, 61, 52, 63, 40])], MITTBuilsdShelfAppleIdentity: MITTBuilsdPayload[MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([19, 62])] as? String, MITTBuilsdShelfGenderMark: MITTBuilsdPayload[MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([61, 61, 63, 52, 62, 63, 40])] as? String)
                    MITTBuilsdRecord.MITTBuilsdShelfAppleIdentity = MITTBuilsdPayload[MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([51, 62])] as? String ?? MITTBuilsdRecord.MITTBuilsdShelfAppleIdentity
                    MITTBuilsdCollectorAuthVault.MITTBuilsdStoreCollector(MITTBuilsdRecord)
                }
                ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController = MITTBuilsdMainTabNavigator()
            } else {
                MITTBuilsdCollectorAuthBridge.MITTBuilsdEnterLocalCollectorDeck(MITTBuilsdToken: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 27, 42, 42, 54, 63, 9, 50, 63, 54, 60, 9, 63, 41, 41, 51, 53, 52]))
            }
        } MITTBuilsdFailureBlock: { MITTBuilsdError in
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdDismiss()
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(MITTBuilsdError.localizedDescription)
        }
    }
}

final class MITTBuilsdCredentialEntryViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVCapturePhotoCaptureDelegate {
    private enum MITTBuilsdGalleryStage {
        case credentials
        case profile
        case interests
        case identityIntro
        case identityCamera
        case identityProgress
        case identityFailure
        case identitySuccess
        case complete
    }

    enum MITTBuilsdEntryFlow {
        case signIn
        case register
    }

    private let MITTBuilsdBackdropCanvas = UIImageView()
    private let MITTBuilsdScrollFrame = UIScrollView()
    private let MITTBuilsdContentShelf = UIView()
    private let MITTBuilsdBackCapsule = UIButton(type: .custom)
    private let MITTBuilsdSkipThread = UIButton(type: .system)
    private let MITTBuilsdTitleLabel = UILabel()
    private let MITTBuilsdSubtitleLabel = UILabel()
    private let MITTBuilsdEmailLabel = UILabel()
    private let MITTBuilsdEmailField = UITextField()
    private let MITTBuilsdSecretLabel = UILabel()
    private let MITTBuilsdSecretField = UITextField()
    private let MITTBuilsdNameLabel = UILabel()
    private let MITTBuilsdNameField = UITextField()
    private let MITTBuilsdAgeLabel = UILabel()
    private let MITTBuilsdAgePicker = UIPickerView()
    private let MITTBuilsdAgeUpperRule = UIView()
    private let MITTBuilsdAgeLowerRule = UIView()
    private let MITTBuilsdAvatarTrigger = UIButton(type: .system)
    private let MITTBuilsdTagGrid = UIStackView()
    private let MITTBuilsdIdentityImage = UIImageView()
    private let MITTBuilsdIdentityIcon = UIImageView()
    private let MITTBuilsdIdentityNotice = UILabel()
    private let MITTBuilsdRuleStack = UIStackView()
    private let MITTBuilsdContinueTrigger = UIButton(type: .system)
    private let MITTBuilsdDismissTap = UITapGestureRecognizer()
    private let MITTBuilsdLensQueue = DispatchQueue(label: "MITTBuilsdFigureLensQueue")
    private let MITTBuilsdPhotoOutput = AVCapturePhotoOutput()
    private let MITTBuilsdFaceGuideLayer = CAShapeLayer()

    private var MITTBuilsdCurrentStage: MITTBuilsdGalleryStage = .credentials
    private var MITTBuilsdSelectedAge = 32
    private var MITTBuilsdSelectedAvatar: Data?
    private var MITTBuilsdIdentityAttemptCount = 0
    private var MITTBuilsdCaptureSession: AVCaptureSession?
    private var MITTBuilsdPreviewLayer: AVCaptureVideoPreviewLayer?
    private var MITTBuilsdCameraReady = false
    private var MITTBuilsdSelectedInterests = Set([MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([24, 54, 51, 52, 62, 56, 53, 34]), MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([9, 46, 40, 63, 63, 46, 46, 53, 35]), MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([30, 40, 53, 42, 41])])
    private var MITTBuilsdDraftEmail = ""
    private var MITTBuilsdDraftSecret = ""
    private let MITTBuilsdAgeTracks = Array(18...65)
    private let MITTBuilsdAccentPurple = UIColor(red: 0.69, green: 0.33, blue: 0.95, alpha: 1)
    private let MITTBuilsdActionOrange = UIColor(red: 1, green: 0.39, blue: 0.22, alpha: 1)
    private let MITTBuilsdTextInk = UIColor(red: 0.17, green: 0.17, blue: 0.18, alpha: 1)
    private let MITTBuilsdEntryFlowMode: MITTBuilsdEntryFlow
    private var MITTBuilsdContentBottomConstraint: NSLayoutConstraint?
    private var MITTBuilsdSafeActionBottomConstraint: NSLayoutConstraint?
    private var MITTBuilsdCredentialSureTopConstraint: NSLayoutConstraint?
    private var MITTBuilsdProfileSureTopConstraint: NSLayoutConstraint?
    private var MITTBuilsdInterestSureTopConstraint: NSLayoutConstraint?
    private var MITTBuilsdIdentityIntroSureTopConstraint: NSLayoutConstraint?
    private var MITTBuilsdIdentityNoticeSureTopConstraint: NSLayoutConstraint?
    private var MITTBuilsdCompleteSureTopConstraint: NSLayoutConstraint?

    init(MITTBuilsdEntryFlowMode: MITTBuilsdEntryFlow = .register) {
        self.MITTBuilsdEntryFlowMode = MITTBuilsdEntryFlowMode
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.MITTBuilsdEntryFlowMode = .register
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        MITTBuilsdAssembleSculptedInterface()
        MITTBuilsdConstructLayoutConstraints()
        MITTBuilsdRegisterInteractionSignals()
        MITTBuilsdRenderStage(.credentials)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        MITTBuilsdPreviewLayer?.frame = MITTBuilsdIdentityImage.bounds
        MITTBuilsdRefreshFaceGuidePath()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        MITTBuilsdStopFigureLens()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func MITTBuilsdAssembleSculptedInterface() {
        view.backgroundColor = .white
        MITTBuilsdBackdropCanvas.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 22, 53, 61, 51, 52, 63, 55, 59, 51, 54, 56, 61]))
        MITTBuilsdBackdropCanvas.contentMode = .scaleAspectFill
        MITTBuilsdBackdropCanvas.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdBackdropCanvas)

        MITTBuilsdScrollFrame.keyboardDismissMode = .interactive
        MITTBuilsdScrollFrame.alwaysBounceVertical = true
        MITTBuilsdScrollFrame.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(MITTBuilsdScrollFrame)

        MITTBuilsdContentShelf.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdScrollFrame.addSubview(MITTBuilsdContentShelf)

        MITTBuilsdBackCapsule.backgroundColor = .white
        MITTBuilsdBackCapsule.layer.cornerRadius = 24
        MITTBuilsdBackCapsule.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        MITTBuilsdBackCapsule.tintColor = MITTBuilsdAccentPurple
        MITTBuilsdBackCapsule.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentShelf.addSubview(MITTBuilsdBackCapsule)

        MITTBuilsdSkipThread.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([9, 49, 51, 42]), for: .normal)
        MITTBuilsdSkipThread.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        MITTBuilsdSkipThread.setTitleColor(MITTBuilsdAccentPurple, for: .normal)
        MITTBuilsdSkipThread.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentShelf.addSubview(MITTBuilsdSkipThread)

        [MITTBuilsdTitleLabel, MITTBuilsdSubtitleLabel, MITTBuilsdEmailLabel, MITTBuilsdSecretLabel, MITTBuilsdNameLabel, MITTBuilsdAgeLabel, MITTBuilsdIdentityNotice].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            MITTBuilsdContentShelf.addSubview($0)
        }

        MITTBuilsdTitleLabel.font = .systemFont(ofSize: 34, weight: .heavy)
        MITTBuilsdTitleLabel.textColor = MITTBuilsdTextInk
        MITTBuilsdTitleLabel.textAlignment = .center
        MITTBuilsdTitleLabel.numberOfLines = 2

        MITTBuilsdSubtitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        MITTBuilsdSubtitleLabel.textColor = UIColor(white: 0.28, alpha: 1)
        MITTBuilsdSubtitleLabel.numberOfLines = 0

        [MITTBuilsdEmailLabel, MITTBuilsdSecretLabel, MITTBuilsdNameLabel, MITTBuilsdAgeLabel].forEach {
            $0.font = .systemFont(ofSize: 17, weight: .bold)
            $0.textColor = MITTBuilsdTextInk
        }

        MITTBuilsdConfigureTextField(MITTBuilsdEmailField, MITTBuilsdPlaceholder: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([31, 52, 46, 63, 40, 122, 35, 53, 47, 40, 122, 63, 55, 59, 51, 54]), MITTBuilsdIcon: "envelope.fill")
        MITTBuilsdEmailField.keyboardType = .emailAddress
        MITTBuilsdEmailField.autocapitalizationType = .none
        MITTBuilsdConfigureTextField(MITTBuilsdSecretField, MITTBuilsdPlaceholder: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([31, 52, 46, 63, 40, 122, 42, 59, 41, 41, 45, 53, 40, 62]), MITTBuilsdIcon: "lock.fill")
        MITTBuilsdSecretField.isSecureTextEntry = true
        MITTBuilsdConfigureTextField(MITTBuilsdNameField, MITTBuilsdPlaceholder: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([31, 52, 46, 63, 40, 122, 35, 53, 47, 40, 122, 52, 59, 55, 63]), MITTBuilsdIcon: nil)
        [MITTBuilsdEmailField, MITTBuilsdSecretField, MITTBuilsdNameField].forEach {
            $0.delegate = self
            $0.MITTBuilsdAttachArtifactDismissTool()
            $0.translatesAutoresizingMaskIntoConstraints = false
            MITTBuilsdContentShelf.addSubview($0)
        }

        MITTBuilsdAvatarTrigger.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([27, 62, 62, 122, 41, 50, 63, 54, 60, 122, 59, 44, 59, 46, 59, 40]), for: .normal)
        MITTBuilsdAvatarTrigger.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        MITTBuilsdAvatarTrigger.tintColor = MITTBuilsdAccentPurple
        MITTBuilsdAvatarTrigger.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        MITTBuilsdAvatarTrigger.layer.cornerRadius = 16
        MITTBuilsdAvatarTrigger.layer.borderWidth = 1.5
        MITTBuilsdAvatarTrigger.layer.borderColor = MITTBuilsdAccentPurple.cgColor
        MITTBuilsdAvatarTrigger.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentShelf.addSubview(MITTBuilsdAvatarTrigger)

        MITTBuilsdAgePicker.dataSource = self
        MITTBuilsdAgePicker.delegate = self
        MITTBuilsdAgePicker.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentShelf.addSubview(MITTBuilsdAgePicker)
        if let MITTBuilsdDefaultAgeIndex = MITTBuilsdAgeTracks.firstIndex(of: MITTBuilsdSelectedAge) {
            MITTBuilsdAgePicker.selectRow(MITTBuilsdDefaultAgeIndex, inComponent: 0, animated: false)
        }

        [MITTBuilsdAgeUpperRule, MITTBuilsdAgeLowerRule].forEach {
            $0.backgroundColor = MITTBuilsdAccentPurple
            $0.layer.cornerRadius = 1
            $0.translatesAutoresizingMaskIntoConstraints = false
            MITTBuilsdContentShelf.addSubview($0)
        }

        MITTBuilsdTagGrid.axis = .vertical
        MITTBuilsdTagGrid.spacing = 13
        MITTBuilsdTagGrid.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentShelf.addSubview(MITTBuilsdTagGrid)
        MITTBuilsdBuildInterestChips()

        MITTBuilsdIdentityImage.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([55, 19, 14, 14, 24, 47, 51, 54, 41, 62, 8, 59, 52, 62, 53, 55, 106])) ?? MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 22, 53, 61, 51, 52, 18, 63, 40, 53]))
        MITTBuilsdIdentityImage.contentMode = .scaleAspectFill
        MITTBuilsdIdentityImage.clipsToBounds = true
        MITTBuilsdIdentityImage.layer.cornerRadius = 18
        MITTBuilsdIdentityImage.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentShelf.addSubview(MITTBuilsdIdentityImage)

        MITTBuilsdFaceGuideLayer.fillColor = UIColor.clear.cgColor
        MITTBuilsdFaceGuideLayer.strokeColor = UIColor.white.cgColor
        MITTBuilsdFaceGuideLayer.lineWidth = 4
        MITTBuilsdFaceGuideLayer.lineCap = .round
        MITTBuilsdFaceGuideLayer.lineJoin = .round

        MITTBuilsdIdentityIcon.contentMode = .scaleAspectFit
        MITTBuilsdIdentityIcon.tintColor = UIColor(white: 0.76, alpha: 1)
        MITTBuilsdIdentityIcon.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentShelf.addSubview(MITTBuilsdIdentityIcon)

        MITTBuilsdIdentityNotice.font = .systemFont(ofSize: 17, weight: .semibold)
        MITTBuilsdIdentityNotice.textColor = MITTBuilsdAccentPurple
        MITTBuilsdIdentityNotice.textAlignment = .center
        MITTBuilsdIdentityNotice.numberOfLines = 0

        MITTBuilsdRuleStack.axis = .vertical
        MITTBuilsdRuleStack.spacing = 23
        MITTBuilsdRuleStack.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentShelf.addSubview(MITTBuilsdRuleStack)
        MITTBuilsdBuildWelcomeRules()

        MITTBuilsdContinueTrigger.setTitleColor(.white, for: .normal)
        MITTBuilsdContinueTrigger.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        MITTBuilsdContinueTrigger.backgroundColor = MITTBuilsdAccentPurple
        MITTBuilsdContinueTrigger.layer.cornerRadius = 14
        MITTBuilsdContinueTrigger.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdContentShelf.addSubview(MITTBuilsdContinueTrigger)
    }

    private func MITTBuilsdConstructLayoutConstraints() {
        MITTBuilsdContentBottomConstraint = MITTBuilsdContinueTrigger.bottomAnchor.constraint(lessThanOrEqualTo: MITTBuilsdContentShelf.bottomAnchor, constant: -26)
        MITTBuilsdSafeActionBottomConstraint = MITTBuilsdContinueTrigger.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        MITTBuilsdCredentialSureTopConstraint = MITTBuilsdContinueTrigger.topAnchor.constraint(equalTo: MITTBuilsdSecretField.bottomAnchor, constant: 25)
        MITTBuilsdProfileSureTopConstraint = MITTBuilsdContinueTrigger.topAnchor.constraint(greaterThanOrEqualTo: MITTBuilsdAgePicker.bottomAnchor, constant: 24)
        MITTBuilsdInterestSureTopConstraint = MITTBuilsdContinueTrigger.topAnchor.constraint(greaterThanOrEqualTo: MITTBuilsdTagGrid.bottomAnchor, constant: 36)
        MITTBuilsdIdentityIntroSureTopConstraint = MITTBuilsdContinueTrigger.topAnchor.constraint(greaterThanOrEqualTo: MITTBuilsdIdentityIcon.bottomAnchor, constant: 32)
        MITTBuilsdIdentityNoticeSureTopConstraint = MITTBuilsdContinueTrigger.topAnchor.constraint(greaterThanOrEqualTo: MITTBuilsdIdentityNotice.bottomAnchor, constant: 26)
        MITTBuilsdCompleteSureTopConstraint = MITTBuilsdContinueTrigger.topAnchor.constraint(greaterThanOrEqualTo: MITTBuilsdRuleStack.bottomAnchor, constant: 24)
        NSLayoutConstraint.activate([
            MITTBuilsdBackdropCanvas.topAnchor.constraint(equalTo: view.topAnchor),
            MITTBuilsdBackdropCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            MITTBuilsdBackdropCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            MITTBuilsdBackdropCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            MITTBuilsdScrollFrame.topAnchor.constraint(equalTo: view.topAnchor),
            MITTBuilsdScrollFrame.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            MITTBuilsdScrollFrame.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            MITTBuilsdScrollFrame.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            MITTBuilsdContentShelf.topAnchor.constraint(equalTo: MITTBuilsdScrollFrame.contentLayoutGuide.topAnchor),
            MITTBuilsdContentShelf.leadingAnchor.constraint(equalTo: MITTBuilsdScrollFrame.contentLayoutGuide.leadingAnchor),
            MITTBuilsdContentShelf.trailingAnchor.constraint(equalTo: MITTBuilsdScrollFrame.contentLayoutGuide.trailingAnchor),
            MITTBuilsdContentShelf.bottomAnchor.constraint(equalTo: MITTBuilsdScrollFrame.contentLayoutGuide.bottomAnchor),
            MITTBuilsdContentShelf.widthAnchor.constraint(equalTo: MITTBuilsdScrollFrame.frameLayoutGuide.widthAnchor),
            MITTBuilsdContentShelf.heightAnchor.constraint(greaterThanOrEqualTo: MITTBuilsdScrollFrame.frameLayoutGuide.heightAnchor, multiplier: 1.02),
            MITTBuilsdBackCapsule.topAnchor.constraint(equalTo: MITTBuilsdContentShelf.safeAreaLayoutGuide.topAnchor, constant: 18),
            MITTBuilsdBackCapsule.leadingAnchor.constraint(equalTo: MITTBuilsdContentShelf.leadingAnchor, constant: 16),
            MITTBuilsdBackCapsule.widthAnchor.constraint(equalToConstant: 52),
            MITTBuilsdBackCapsule.heightAnchor.constraint(equalToConstant: 52),
            MITTBuilsdSkipThread.centerYAnchor.constraint(equalTo: MITTBuilsdBackCapsule.centerYAnchor),
            MITTBuilsdSkipThread.trailingAnchor.constraint(equalTo: MITTBuilsdContentShelf.trailingAnchor, constant: -24),
            MITTBuilsdTitleLabel.topAnchor.constraint(equalTo: MITTBuilsdBackCapsule.bottomAnchor, constant: 38),
            MITTBuilsdTitleLabel.leadingAnchor.constraint(equalTo: MITTBuilsdContentShelf.leadingAnchor, constant: 24),
            MITTBuilsdTitleLabel.trailingAnchor.constraint(equalTo: MITTBuilsdContentShelf.trailingAnchor, constant: -24),
            MITTBuilsdSubtitleLabel.topAnchor.constraint(equalTo: MITTBuilsdTitleLabel.bottomAnchor, constant: 14),
            MITTBuilsdSubtitleLabel.leadingAnchor.constraint(equalTo: MITTBuilsdContentShelf.leadingAnchor, constant: 24),
            MITTBuilsdSubtitleLabel.trailingAnchor.constraint(equalTo: MITTBuilsdContentShelf.trailingAnchor, constant: -24),
            MITTBuilsdEmailLabel.topAnchor.constraint(equalTo: MITTBuilsdTitleLabel.bottomAnchor, constant: 42),
            MITTBuilsdEmailLabel.leadingAnchor.constraint(equalTo: MITTBuilsdContentShelf.leadingAnchor, constant: 16),
            MITTBuilsdEmailField.topAnchor.constraint(equalTo: MITTBuilsdEmailLabel.bottomAnchor, constant: 12),
            MITTBuilsdEmailField.leadingAnchor.constraint(equalTo: MITTBuilsdContentShelf.leadingAnchor, constant: 16),
            MITTBuilsdEmailField.trailingAnchor.constraint(equalTo: MITTBuilsdContentShelf.trailingAnchor, constant: -16),
            MITTBuilsdEmailField.heightAnchor.constraint(equalToConstant: 60),
            MITTBuilsdSecretLabel.topAnchor.constraint(equalTo: MITTBuilsdEmailField.bottomAnchor, constant: 26),
            MITTBuilsdSecretLabel.leadingAnchor.constraint(equalTo: MITTBuilsdEmailLabel.leadingAnchor),
            MITTBuilsdSecretField.topAnchor.constraint(equalTo: MITTBuilsdSecretLabel.bottomAnchor, constant: 12),
            MITTBuilsdSecretField.leadingAnchor.constraint(equalTo: MITTBuilsdEmailField.leadingAnchor),
            MITTBuilsdSecretField.trailingAnchor.constraint(equalTo: MITTBuilsdEmailField.trailingAnchor),
            MITTBuilsdSecretField.heightAnchor.constraint(equalToConstant: 60),
            MITTBuilsdNameLabel.topAnchor.constraint(equalTo: MITTBuilsdTitleLabel.bottomAnchor, constant: 42),
            MITTBuilsdNameLabel.leadingAnchor.constraint(equalTo: MITTBuilsdEmailLabel.leadingAnchor),
            MITTBuilsdNameField.topAnchor.constraint(equalTo: MITTBuilsdNameLabel.bottomAnchor, constant: 12),
            MITTBuilsdNameField.leadingAnchor.constraint(equalTo: MITTBuilsdEmailField.leadingAnchor),
            MITTBuilsdNameField.trailingAnchor.constraint(equalTo: MITTBuilsdEmailField.trailingAnchor),
            MITTBuilsdNameField.heightAnchor.constraint(equalToConstant: 60),
            MITTBuilsdAvatarTrigger.topAnchor.constraint(equalTo: MITTBuilsdNameField.bottomAnchor, constant: 16),
            MITTBuilsdAvatarTrigger.leadingAnchor.constraint(equalTo: MITTBuilsdEmailField.leadingAnchor),
            MITTBuilsdAvatarTrigger.trailingAnchor.constraint(equalTo: MITTBuilsdEmailField.trailingAnchor),
            MITTBuilsdAvatarTrigger.heightAnchor.constraint(equalToConstant: 48),
            MITTBuilsdAgeLabel.topAnchor.constraint(equalTo: MITTBuilsdNameField.bottomAnchor, constant: 28),
            MITTBuilsdAgeLabel.leadingAnchor.constraint(equalTo: MITTBuilsdEmailLabel.leadingAnchor),
            MITTBuilsdAgePicker.topAnchor.constraint(equalTo: MITTBuilsdAgeLabel.bottomAnchor, constant: 6),
            MITTBuilsdAgePicker.leadingAnchor.constraint(equalTo: MITTBuilsdContentShelf.leadingAnchor, constant: 42),
            MITTBuilsdAgePicker.trailingAnchor.constraint(equalTo: MITTBuilsdContentShelf.trailingAnchor, constant: -42),
            MITTBuilsdAgePicker.heightAnchor.constraint(equalToConstant: 158),
            MITTBuilsdAgeUpperRule.centerXAnchor.constraint(equalTo: MITTBuilsdAgePicker.centerXAnchor),
            MITTBuilsdAgeUpperRule.centerYAnchor.constraint(equalTo: MITTBuilsdAgePicker.centerYAnchor, constant: -21),
            MITTBuilsdAgeUpperRule.widthAnchor.constraint(equalToConstant: 137),
            MITTBuilsdAgeUpperRule.heightAnchor.constraint(equalToConstant: 2),
            MITTBuilsdAgeLowerRule.centerXAnchor.constraint(equalTo: MITTBuilsdAgePicker.centerXAnchor),
            MITTBuilsdAgeLowerRule.centerYAnchor.constraint(equalTo: MITTBuilsdAgePicker.centerYAnchor, constant: 21),
            MITTBuilsdAgeLowerRule.widthAnchor.constraint(equalTo: MITTBuilsdAgeUpperRule.widthAnchor),
            MITTBuilsdAgeLowerRule.heightAnchor.constraint(equalTo: MITTBuilsdAgeUpperRule.heightAnchor),
            MITTBuilsdTagGrid.topAnchor.constraint(equalTo: MITTBuilsdSubtitleLabel.bottomAnchor, constant: 38),
            MITTBuilsdTagGrid.leadingAnchor.constraint(equalTo: MITTBuilsdContentShelf.leadingAnchor, constant: 32),
            MITTBuilsdTagGrid.trailingAnchor.constraint(equalTo: MITTBuilsdContentShelf.trailingAnchor, constant: -32),
            MITTBuilsdIdentityImage.topAnchor.constraint(equalTo: MITTBuilsdBackCapsule.bottomAnchor, constant: 44),
            MITTBuilsdIdentityImage.leadingAnchor.constraint(equalTo: MITTBuilsdContentShelf.leadingAnchor, constant: 20),
            MITTBuilsdIdentityImage.trailingAnchor.constraint(equalTo: MITTBuilsdContentShelf.trailingAnchor, constant: -20),
            MITTBuilsdIdentityImage.heightAnchor.constraint(lessThanOrEqualTo: MITTBuilsdContentShelf.heightAnchor, multiplier: 0.58),
            MITTBuilsdIdentityImage.heightAnchor.constraint(equalTo: MITTBuilsdContentShelf.widthAnchor, multiplier: 1.52).withPriority(.defaultHigh),
            MITTBuilsdIdentityIcon.centerXAnchor.constraint(equalTo: MITTBuilsdContentShelf.centerXAnchor),
            MITTBuilsdIdentityIcon.topAnchor.constraint(equalTo: MITTBuilsdSubtitleLabel.bottomAnchor, constant: 58),
            MITTBuilsdIdentityIcon.widthAnchor.constraint(equalToConstant: 130),
            MITTBuilsdIdentityIcon.heightAnchor.constraint(equalToConstant: 130),
            MITTBuilsdIdentityNotice.topAnchor.constraint(equalTo: MITTBuilsdIdentityImage.bottomAnchor, constant: 24),
            MITTBuilsdIdentityNotice.leadingAnchor.constraint(equalTo: MITTBuilsdContentShelf.leadingAnchor, constant: 28),
            MITTBuilsdIdentityNotice.trailingAnchor.constraint(equalTo: MITTBuilsdContentShelf.trailingAnchor, constant: -28),
            MITTBuilsdRuleStack.topAnchor.constraint(equalTo: MITTBuilsdSubtitleLabel.bottomAnchor, constant: 46),
            MITTBuilsdRuleStack.leadingAnchor.constraint(equalTo: MITTBuilsdContentShelf.leadingAnchor, constant: 25),
            MITTBuilsdRuleStack.trailingAnchor.constraint(equalTo: MITTBuilsdContentShelf.trailingAnchor, constant: -22),
            MITTBuilsdContinueTrigger.leadingAnchor.constraint(equalTo: MITTBuilsdContentShelf.leadingAnchor, constant: 16),
            MITTBuilsdContinueTrigger.trailingAnchor.constraint(equalTo: MITTBuilsdContentShelf.trailingAnchor, constant: -16),
            MITTBuilsdContinueTrigger.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    private func MITTBuilsdRegisterInteractionSignals() {
        MITTBuilsdBackCapsule.addTarget(self, action: #selector(MITTBuilsdHandleNavigationRetreat), for: .touchUpInside)
        MITTBuilsdSkipThread.addTarget(self, action: #selector(MITTBuilsdSkipShelfStep), for: .touchUpInside)
        MITTBuilsdContinueTrigger.addTarget(self, action: #selector(MITTBuilsdCommitStageAction), for: .touchUpInside)
        MITTBuilsdAvatarTrigger.addTarget(self, action: #selector(MITTBuilsdOpenAvatarPicker), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(MITTBuilsdKeyboardWillShift(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MITTBuilsdKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        MITTBuilsdDismissTap.addTarget(self, action: #selector(MITTBuilsdDismissEditing))
        MITTBuilsdDismissTap.cancelsTouchesInView = false
        view.addGestureRecognizer(MITTBuilsdDismissTap)
    }

    private func MITTBuilsdConfigureTextField(_ MITTBuilsdField: UITextField, MITTBuilsdPlaceholder: String, MITTBuilsdIcon: String?) {
        MITTBuilsdField.backgroundColor = .white
        MITTBuilsdField.layer.cornerRadius = 16
        MITTBuilsdField.layer.borderWidth = 1.2
        MITTBuilsdField.layer.borderColor = UIColor(red: 0.54, green: 0.31, blue: 1, alpha: 1).cgColor
        MITTBuilsdField.font = .systemFont(ofSize: 16)
        MITTBuilsdField.textColor = MITTBuilsdTextInk
        MITTBuilsdField.attributedPlaceholder = NSAttributedString(string: MITTBuilsdPlaceholder, attributes: [.foregroundColor: UIColor(white: 0.76, alpha: 1)])
        let MITTBuilsdInset = UIView(frame: CGRect(x: 0, y: 0, width: MITTBuilsdIcon == nil ? 16 : 54, height: 54))
        if let MITTBuilsdIcon {
            let MITTBuilsdGlyph = UIImageView(image: UIImage(systemName: MITTBuilsdIcon))
            MITTBuilsdGlyph.tintColor = MITTBuilsdAccentPurple
            MITTBuilsdGlyph.frame = CGRect(x: 17, y: 16, width: 22, height: 22)
            MITTBuilsdInset.addSubview(MITTBuilsdGlyph)
        }
        MITTBuilsdField.leftView = MITTBuilsdInset
        MITTBuilsdField.leftViewMode = .always
    }

    private func MITTBuilsdBuildInterestChips() {
        [MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([24, 54, 51, 52, 62, 56, 53, 34]), MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([12, 51, 52, 35, 54]), MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([30, 63, 41, 51, 61, 52, 63, 40]), MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([9, 46, 40, 63, 63, 46, 46, 53, 35]), MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([30, 40, 53, 42, 41]), MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([14, 53, 35, 41, 50, 53, 46])].chunked(into: 2).forEach { MITTBuilsdRowNames in
            let MITTBuilsdRow = UIStackView()
            MITTBuilsdRow.axis = .horizontal
            MITTBuilsdRow.spacing = 22
            MITTBuilsdRow.distribution = .fillEqually
            MITTBuilsdRowNames.forEach { MITTBuilsdName in
                let MITTBuilsdChip = UIButton(type: .system)
                MITTBuilsdChip.setTitle(MITTBuilsdName, for: .normal)
                MITTBuilsdChip.titleLabel?.font = .systemFont(ofSize: 19, weight: .medium)
                MITTBuilsdChip.layer.cornerRadius = 24
                MITTBuilsdChip.layer.borderWidth = 1.0
                MITTBuilsdChip.heightAnchor.constraint(equalToConstant: 48).isActive = true
                MITTBuilsdChip.addTarget(self, action: #selector(MITTBuilsdToggleInterestChip(_:)), for: .touchUpInside)
                MITTBuilsdRow.addArrangedSubview(MITTBuilsdChip)
            }
            MITTBuilsdTagGrid.addArrangedSubview(MITTBuilsdRow)
        }
    }

    private func MITTBuilsdBuildWelcomeRules() {
        [
            (MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([24, 63, 122, 3, 53, 47, 40, 41, 63, 54, 60]), MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([27, 47, 46, 50, 63, 52, 46, 51, 57, 51, 46, 35, 122, 51, 41, 122, 46, 50, 63, 122, 49, 63, 35, 122, 46, 53, 122, 40, 63, 59, 54, 122, 57, 53, 52, 52, 63, 57, 46, 51, 53, 52])),
            (MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([24, 63, 122, 17, 51, 52, 62]), MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([18, 63, 54, 42, 122, 47, 41, 122, 57, 40, 63, 59, 46, 63, 122, 59, 122, 41, 59, 60, 63, 122, 59, 52, 62, 122, 40, 63, 41, 42, 63, 57, 46, 60, 47, 54, 122, 41, 42, 59, 57, 63])),
            (MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([8, 63, 41, 42, 63, 57, 46, 122, 30, 51, 44, 63, 40, 41, 51, 46, 35]), MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([14, 40, 63, 59, 46, 122, 63, 44, 63, 40, 35, 122, 47, 41, 63, 40, 122, 45, 51, 46, 50, 122, 62, 51, 61, 52, 51, 46, 35])),
            (MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([107, 98, 113, 21, 52, 54, 35]), MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([9, 46, 40, 51, 57, 46, 54, 35, 122, 60, 53, 40, 122, 59, 62, 47, 54, 46, 41, 116, 122, 20, 53, 122, 55, 51, 52, 53, 40, 41, 122, 59, 54, 54, 53, 45, 63, 62])),
            (MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([9, 46, 59, 35, 122, 51, 52, 60, 53, 40, 55, 63, 62]), MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([8, 63, 44, 51, 63, 45, 122, 53, 47, 40, 122, 10, 40, 51, 44, 59, 57, 35, 122, 27, 61, 40, 63, 63, 55, 63, 52, 46, 122, 56, 63, 60, 53, 40, 63, 122, 41, 46, 59, 40, 46, 51, 52, 61]))
        ].forEach { MITTBuilsdRule in
            let MITTBuilsdRow = UIStackView()
            MITTBuilsdRow.axis = .horizontal
            MITTBuilsdRow.spacing = 12
            MITTBuilsdRow.alignment = .top
            let MITTBuilsdGlyph = UILabel()
            MITTBuilsdGlyph.text = ">>"
            MITTBuilsdGlyph.font = .systemFont(ofSize: 18, weight: .heavy)
            MITTBuilsdGlyph.textColor = MITTBuilsdAccentPurple
            MITTBuilsdGlyph.widthAnchor.constraint(equalToConstant: 28).isActive = true
            let MITTBuilsdCopy = UILabel()
            MITTBuilsdCopy.numberOfLines = 0
            let MITTBuilsdText = NSMutableAttributedString(string: MITTBuilsdRule.0 + "\n", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .heavy), .foregroundColor: UIColor.black])
            MITTBuilsdText.append(NSAttributedString(string: MITTBuilsdRule.1, attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .regular), .foregroundColor: UIColor(white: 0.32, alpha: 1)]))
            MITTBuilsdCopy.attributedText = MITTBuilsdText
            MITTBuilsdRow.addArrangedSubview(MITTBuilsdGlyph)
            MITTBuilsdRow.addArrangedSubview(MITTBuilsdCopy)
            MITTBuilsdRuleStack.addArrangedSubview(MITTBuilsdRow)
        }
    }

    private func MITTBuilsdRenderStage(_ MITTBuilsdStage: MITTBuilsdGalleryStage) {
        MITTBuilsdCurrentStage = MITTBuilsdStage
        view.endEditing(true)
        MITTBuilsdApplyGalleryBackdrop(MITTBuilsdStage)
        MITTBuilsdAlignContinueTrigger(MITTBuilsdStage)
        MITTBuilsdSyncLensForStage(MITTBuilsdStage)
        let MITTBuilsdCredentialViews: [UIView] = [MITTBuilsdEmailLabel, MITTBuilsdEmailField, MITTBuilsdSecretLabel, MITTBuilsdSecretField]
        let MITTBuilsdProfileViews: [UIView] = [MITTBuilsdNameLabel, MITTBuilsdNameField, MITTBuilsdAgeLabel, MITTBuilsdAgePicker, MITTBuilsdAgeUpperRule, MITTBuilsdAgeLowerRule]
        let MITTBuilsdIdentityViews: [UIView] = [MITTBuilsdIdentityImage, MITTBuilsdIdentityIcon, MITTBuilsdIdentityNotice]
        let MITTBuilsdAllSwitchable = MITTBuilsdCredentialViews + MITTBuilsdProfileViews + [MITTBuilsdAvatarTrigger, MITTBuilsdTagGrid, MITTBuilsdRuleStack] + MITTBuilsdIdentityViews + [MITTBuilsdSubtitleLabel]
        MITTBuilsdAllSwitchable.forEach { $0.isHidden = true }
        MITTBuilsdIdentityImage.subviews.forEach { $0.removeFromSuperview() }
        MITTBuilsdSkipThread.isHidden = true
        MITTBuilsdIdentityImage.isHidden = true
        MITTBuilsdIdentityIcon.isHidden = true
        MITTBuilsdIdentityNotice.isHidden = true
        MITTBuilsdRuleStack.isHidden = true
        MITTBuilsdTitleLabel.textAlignment = .center
        MITTBuilsdTitleLabel.font = .systemFont(ofSize: 34, weight: .heavy)
        MITTBuilsdTitleLabel.textColor = MITTBuilsdTextInk

        switch MITTBuilsdStage {
        case .credentials:
            MITTBuilsdCredentialViews.forEach { $0.isHidden = false }
            MITTBuilsdTitleLabel.text = MITTBuilsdEntryFlowMode == .signIn ? MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([9, 51, 61, 52]) : MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([8, 63, 61, 51, 41, 46, 63, 40, 123])
            MITTBuilsdEmailLabel.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([31, 55, 59, 51, 54])
            MITTBuilsdSecretLabel.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([10, 59, 41, 41, 45, 53, 40, 62])
            MITTBuilsdContinueTrigger.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([9, 47, 40, 63]), for: .normal)
        case .profile:
            MITTBuilsdProfileViews.forEach { $0.isHidden = false }
            MITTBuilsdTitleLabel.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([25, 53, 55, 42, 54, 63, 46, 63, 122, 10, 40, 53, 60, 51, 54, 63])
            MITTBuilsdTitleLabel.textAlignment = .center
            MITTBuilsdNameLabel.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([20, 51, 57, 49, 52, 59, 55, 63])
            MITTBuilsdAgeLabel.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([27, 61, 63])
            MITTBuilsdContinueTrigger.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([31, 52, 46, 63, 40]), for: .normal)
        case .interests:
            MITTBuilsdSubtitleLabel.isHidden = false
            MITTBuilsdTagGrid.isHidden = false
            MITTBuilsdSkipThread.isHidden = false
            MITTBuilsdTitleLabel.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([3, 53, 47, 40, 122, 51, 52, 46, 63, 40, 63, 41, 46, 41])
            MITTBuilsdTitleLabel.textAlignment = .left
            MITTBuilsdSubtitleLabel.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([9, 63, 54, 63, 57, 46, 122, 59, 122, 60, 63, 45, 122, 53, 60, 122, 35, 53, 47, 40, 122, 51, 52, 46, 63, 40, 63, 41, 46, 41, 122, 59, 52, 62, 122, 54, 63, 46, 122, 63, 44, 63, 40, 35, 53, 52, 63, 122, 49, 52, 53, 45, 122, 45, 50, 59, 46, 122, 35, 53, 47, 122, 59, 40, 63, 122, 42, 59, 41, 41, 51, 53, 52, 59, 46, 63, 122, 59, 56, 53, 47, 46, 116])
            MITTBuilsdContinueTrigger.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([25, 53, 52, 46, 51, 52, 47, 63]), for: .normal)
            MITTBuilsdRefreshInterestChips()
        case .identityIntro:
            MITTBuilsdSubtitleLabel.isHidden = false
            MITTBuilsdIdentityIcon.isHidden = false
            MITTBuilsdTitleLabel.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([12, 63, 40, 51, 60, 35, 122, 3, 53, 47, 40, 122, 19, 62, 63, 52, 46, 51, 46, 35])
            MITTBuilsdTitleLabel.textAlignment = .left
            MITTBuilsdSubtitleLabel.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([14, 59, 49, 63, 122, 59, 122, 57, 54, 63, 59, 40, 122, 41, 63, 54, 60, 51, 63, 122, 41, 53, 122, 45, 63, 122, 57, 59, 52, 122, 44, 63, 40, 51, 60, 35, 122, 35, 53, 47, 40, 122, 59, 61, 63, 122, 59, 52, 62, 122, 50, 63, 54, 42, 122, 49, 63, 63, 42, 122, 46, 50, 63, 122, 57, 53, 55, 55, 47, 52, 51, 46, 35, 122, 41, 59, 60, 63, 116])
            MITTBuilsdIdentityIcon.image = UIImage(systemName: "person.crop.rectangle")
            MITTBuilsdContinueTrigger.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([14, 59, 49, 63, 122, 59, 122, 9, 63, 54, 60, 51, 63]), for: .normal)
        case .identityCamera:
            MITTBuilsdIdentityImage.isHidden = false
            MITTBuilsdIdentityNotice.isHidden = false
            MITTBuilsdTitleLabel.text = ""
            MITTBuilsdIdentityImage.image = MITTBuilsdCameraReady ? nil : MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([55, 19, 14, 14, 24, 47, 51, 54, 41, 62, 8, 59, 52, 62, 53, 55, 106])) ?? MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 22, 53, 61, 51, 52, 18, 63, 40, 53]))
            MITTBuilsdIdentityNotice.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([10, 54, 63, 59, 41, 63, 122, 55, 59, 49, 63, 122, 41, 47, 40, 63, 122, 35, 53, 47, 40, 122, 63, 52, 46, 51, 40, 63, 122, 60, 59, 57, 63, 122, 51, 41, 122, 63, 34, 42, 53, 41, 63, 62, 122, 45, 51, 46, 50, 53, 47, 46, 122, 59, 52, 35, 122, 53, 56, 41, 46, 40, 47, 57, 46, 51, 53, 52, 41, 116])
            MITTBuilsdContinueTrigger.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([14, 59, 49, 63, 122, 59, 122, 42, 51, 57, 46, 47, 40, 63, 116]), for: .normal)
            MITTBuilsdAttachFaceGuideLayer()
        case .identityProgress:
            MITTBuilsdIdentityImage.isHidden = false
            MITTBuilsdIdentityNotice.isHidden = false
            MITTBuilsdTitleLabel.text = ""
            MITTBuilsdIdentityImage.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([55, 19, 14, 14, 24, 47, 51, 54, 41, 62, 8, 59, 52, 62, 53, 55, 110])) ?? MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([55, 19, 14, 14, 24, 47, 51, 54, 41, 62, 8, 59, 52, 62, 53, 55, 106]))
            MITTBuilsdIdentityNotice.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([10, 54, 63, 59, 41, 63, 122, 55, 59, 49, 63, 122, 41, 47, 40, 63, 122, 35, 53, 47, 40, 122, 63, 52, 46, 51, 40, 63, 122, 60, 59, 57, 63, 122, 51, 41, 122, 63, 34, 42, 53, 41, 63, 62, 122, 45, 51, 46, 50, 53, 47, 46, 122, 59, 52, 35, 122, 53, 56, 41, 46, 40, 47, 57, 46, 51, 53, 52, 41, 116])
            MITTBuilsdContinueTrigger.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([25, 53, 52, 46, 51, 52, 47, 63]), for: .normal)
            MITTBuilsdShowIdentityOverlay(MITTBuilsdSymbol: "arrow.triangle.2.circlepath", MITTBuilsdText: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([3, 53, 47, 40, 122, 60, 59, 57, 51, 59, 54, 122, 44, 63, 40, 51, 60, 51, 57, 59, 46, 51, 53, 52, 122, 51, 41, 122, 57, 47, 40, 40, 63, 52, 46, 54, 35, 122, 51, 52, 122, 42, 40, 53, 61, 40, 63, 41, 41, 116]), MITTBuilsdColor: .white)
        case .identityFailure:
            MITTBuilsdIdentityImage.isHidden = false
            MITTBuilsdIdentityNotice.isHidden = false
            MITTBuilsdTitleLabel.text = ""
            MITTBuilsdIdentityImage.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([55, 19, 14, 14, 24, 47, 51, 54, 41, 62, 8, 59, 52, 62, 53, 55, 110])) ?? MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([55, 19, 14, 14, 24, 47, 51, 54, 41, 62, 8, 59, 52, 62, 53, 55, 106]))
            MITTBuilsdIdentityNotice.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([10, 54, 63, 59, 41, 63, 122, 55, 59, 49, 63, 122, 41, 47, 40, 63, 122, 35, 53, 47, 40, 122, 63, 52, 46, 51, 40, 63, 122, 60, 59, 57, 63, 122, 51, 41, 122, 63, 34, 42, 53, 41, 63, 62, 122, 45, 51, 46, 50, 53, 47, 46, 122, 59, 52, 35, 122, 53, 56, 41, 46, 40, 47, 57, 46, 51, 53, 52, 41, 116])
            MITTBuilsdContinueTrigger.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([8, 63, 55, 59, 49, 63]), for: .normal)
            MITTBuilsdShowIdentityOverlay(MITTBuilsdSymbol: "xmark.circle", MITTBuilsdText: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([27, 47, 46, 50, 63, 52, 46, 51, 57, 59, 46, 51, 53, 52, 122, 60, 59, 51, 54, 63, 62, 116, 122, 10, 54, 63, 59, 41, 63, 122, 46, 59, 49, 63, 122, 46, 50, 63, 122, 42, 50, 53, 46, 53, 122, 59, 61, 59, 51, 52, 116]), MITTBuilsdColor: UIColor(red: 0.96, green: 0.12, blue: 0.18, alpha: 1))
        case .identitySuccess:
            MITTBuilsdIdentityImage.isHidden = false
            MITTBuilsdIdentityNotice.isHidden = false
            MITTBuilsdTitleLabel.text = ""
            MITTBuilsdIdentityImage.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([55, 19, 14, 14, 24, 47, 51, 54, 41, 62, 8, 59, 52, 62, 53, 55, 110])) ?? MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([55, 19, 14, 14, 24, 47, 51, 54, 41, 62, 8, 59, 52, 62, 53, 55, 106]))
            MITTBuilsdIdentityNotice.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([10, 54, 63, 59, 41, 63, 122, 55, 59, 49, 63, 122, 41, 47, 40, 63, 122, 35, 53, 47, 40, 122, 63, 52, 46, 51, 40, 63, 122, 60, 59, 57, 63, 122, 51, 41, 122, 63, 34, 42, 53, 41, 63, 62, 122, 45, 51, 46, 50, 53, 47, 46, 122, 59, 52, 35, 122, 53, 56, 41, 46, 40, 47, 57, 46, 51, 53, 52, 41, 116])
            MITTBuilsdContinueTrigger.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([25, 53, 52, 46, 51, 52, 47, 63]), for: .normal)
            MITTBuilsdShowIdentityOverlay(MITTBuilsdSymbol: "checkmark.circle", MITTBuilsdText: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([3, 53, 47, 40, 122, 60, 59, 57, 51, 59, 54, 122, 44, 63, 40, 51, 60, 51, 57, 59, 46, 51, 53, 52, 122, 45, 59, 41, 122, 41, 47, 57, 57, 63, 41, 41, 60, 47, 54, 116]), MITTBuilsdColor: UIColor(red: 0.04, green: 0.82, blue: 0.12, alpha: 1))
        case .complete:
            MITTBuilsdSubtitleLabel.isHidden = false
            MITTBuilsdRuleStack.isHidden = false
            MITTBuilsdTitleLabel.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([13, 63, 54, 57, 53, 55, 63, 122, 27, 56, 53, 59, 40, 62])
            MITTBuilsdTitleLabel.textColor = MITTBuilsdAccentPurple
            MITTBuilsdTitleLabel.textAlignment = .left
            MITTBuilsdSubtitleLabel.text = MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([27, 122, 60, 63, 45, 122, 46, 50, 51, 52, 61, 41, 122, 46, 53, 122, 40, 63, 55, 63, 55, 56, 63, 40, 116, 116, 116])
            MITTBuilsdContinueTrigger.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([29, 53, 122, 46, 53]), for: .normal)
        }
        MITTBuilsdScrollFrame.setContentOffset(.zero, animated: false)
    }

    private func MITTBuilsdApplyGalleryBackdrop(_ MITTBuilsdStage: MITTBuilsdGalleryStage) {
        let MITTBuilsdBackdropKey: [UInt8]
        switch MITTBuilsdStage {
        case .credentials:
            MITTBuilsdBackdropKey = [23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 22, 53, 61, 51, 52, 63, 55, 59, 51, 54, 56, 61]
            MITTBuilsdScrollFrame.isScrollEnabled = true
            MITTBuilsdScrollFrame.alwaysBounceVertical = true
        default:
            MITTBuilsdBackdropKey = [55, 19, 14, 14, 24, 47, 51, 54, 41, 62, 10, 59, 61, 63, 53, 52, 63]
            MITTBuilsdScrollFrame.isScrollEnabled = false
            MITTBuilsdScrollFrame.alwaysBounceVertical = false
        }
        MITTBuilsdBackdropCanvas.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy(MITTBuilsdBackdropKey))
    }

    private func MITTBuilsdAlignContinueTrigger(_ MITTBuilsdStage: MITTBuilsdGalleryStage) {
        let MITTBuilsdTopGallery = [
            MITTBuilsdCredentialSureTopConstraint,
            MITTBuilsdProfileSureTopConstraint,
            MITTBuilsdInterestSureTopConstraint,
            MITTBuilsdIdentityIntroSureTopConstraint,
            MITTBuilsdIdentityNoticeSureTopConstraint,
            MITTBuilsdCompleteSureTopConstraint
        ].compactMap { $0 }
        NSLayoutConstraint.deactivate(MITTBuilsdTopGallery)
        [MITTBuilsdContentBottomConstraint, MITTBuilsdSafeActionBottomConstraint].compactMap { $0 }.forEach { $0.isActive = false }
        switch MITTBuilsdStage {
        case .credentials:
            MITTBuilsdContentBottomConstraint?.isActive = true
            MITTBuilsdCredentialSureTopConstraint?.isActive = true
        case .profile:
            MITTBuilsdSafeActionBottomConstraint?.isActive = true
            MITTBuilsdProfileSureTopConstraint?.isActive = true
        case .interests:
            MITTBuilsdSafeActionBottomConstraint?.isActive = true
            MITTBuilsdInterestSureTopConstraint?.isActive = true
        case .identityIntro:
            MITTBuilsdSafeActionBottomConstraint?.isActive = true
            MITTBuilsdIdentityIntroSureTopConstraint?.isActive = true
        case .identityCamera, .identityProgress, .identityFailure, .identitySuccess:
            MITTBuilsdSafeActionBottomConstraint?.isActive = true
            MITTBuilsdIdentityNoticeSureTopConstraint?.isActive = true
        case .complete:
            MITTBuilsdSafeActionBottomConstraint?.isActive = true
            MITTBuilsdCompleteSureTopConstraint?.isActive = true
        }
    }

    private func MITTBuilsdShowIdentityOverlay(MITTBuilsdSymbol: String, MITTBuilsdText: String, MITTBuilsdColor: UIColor) {
        MITTBuilsdIdentityImage.subviews.forEach { $0.removeFromSuperview() }
        let MITTBuilsdPanel = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
        MITTBuilsdPanel.layer.cornerRadius = 18
        MITTBuilsdPanel.clipsToBounds = true
        MITTBuilsdPanel.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdIdentityImage.addSubview(MITTBuilsdPanel)
        let MITTBuilsdStack = UIStackView()
        MITTBuilsdStack.axis = .vertical
        MITTBuilsdStack.spacing = 14
        MITTBuilsdStack.alignment = .center
        MITTBuilsdStack.translatesAutoresizingMaskIntoConstraints = false
        MITTBuilsdPanel.contentView.addSubview(MITTBuilsdStack)
        let MITTBuilsdIcon = UIImageView(image: UIImage(systemName: MITTBuilsdSymbol))
        MITTBuilsdIcon.tintColor = MITTBuilsdColor
        MITTBuilsdIcon.contentMode = .scaleAspectFit
        MITTBuilsdIcon.widthAnchor.constraint(equalToConstant: 48).isActive = true
        MITTBuilsdIcon.heightAnchor.constraint(equalToConstant: 48).isActive = true
        let MITTBuilsdLabel = UILabel()
        MITTBuilsdLabel.text = MITTBuilsdText
        MITTBuilsdLabel.font = .systemFont(ofSize: 17, weight: .bold)
        MITTBuilsdLabel.textColor = .white
        MITTBuilsdLabel.textAlignment = .center
        MITTBuilsdLabel.numberOfLines = 0
        MITTBuilsdStack.addArrangedSubview(MITTBuilsdIcon)
        MITTBuilsdStack.addArrangedSubview(MITTBuilsdLabel)
        NSLayoutConstraint.activate([
            MITTBuilsdPanel.centerXAnchor.constraint(equalTo: MITTBuilsdIdentityImage.centerXAnchor),
            MITTBuilsdPanel.centerYAnchor.constraint(equalTo: MITTBuilsdIdentityImage.centerYAnchor),
            MITTBuilsdPanel.widthAnchor.constraint(equalTo: MITTBuilsdIdentityImage.widthAnchor, multiplier: 0.78),
            MITTBuilsdPanel.heightAnchor.constraint(greaterThanOrEqualToConstant: 150),
            MITTBuilsdStack.leadingAnchor.constraint(equalTo: MITTBuilsdPanel.contentView.leadingAnchor, constant: 20),
            MITTBuilsdStack.trailingAnchor.constraint(equalTo: MITTBuilsdPanel.contentView.trailingAnchor, constant: -20),
            MITTBuilsdStack.centerYAnchor.constraint(equalTo: MITTBuilsdPanel.contentView.centerYAnchor)
        ])
    }

    private func MITTBuilsdSyncLensForStage(_ MITTBuilsdStage: MITTBuilsdGalleryStage) {
        if MITTBuilsdStage == .identityCamera {
            MITTBuilsdPrepareFigureLens()
        } else {
            MITTBuilsdStopFigureLens()
        }
    }

    private func MITTBuilsdPrepareFigureLens() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            MITTBuilsdBuildFigureLensIfNeeded()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] MITTBuilsdGranted in
                DispatchQueue.main.async {
                    if MITTBuilsdGranted {
                        self?.MITTBuilsdBuildFigureLensIfNeeded()
                    } else {
                        self?.MITTBuilsdCameraReady = false
                    }
                }
            }
        default:
            MITTBuilsdCameraReady = false
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([25, 59, 55, 63, 40, 59, 122, 59, 57, 57, 63, 41, 41, 122, 51, 41, 122, 52, 63, 63, 62, 63, 62, 122, 60, 53, 40, 122, 44, 63, 40, 51, 60, 51, 57, 59, 46, 51, 53, 52, 116]))
        }
    }

    private func MITTBuilsdBuildFigureLensIfNeeded() {
        if let MITTBuilsdCaptureSession {
            MITTBuilsdCameraReady = true
            MITTBuilsdAttachPreviewLayer(MITTBuilsdSession: MITTBuilsdCaptureSession)
            MITTBuilsdStartFigureLens()
            return
        }
        MITTBuilsdLensQueue.async { [weak self] in
            guard let self else { return }
            let MITTBuilsdSession = AVCaptureSession()
            MITTBuilsdSession.beginConfiguration()
            MITTBuilsdSession.sessionPreset = .photo
            guard let MITTBuilsdDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
                  let MITTBuilsdInput = try? AVCaptureDeviceInput(device: MITTBuilsdDevice),
                  MITTBuilsdSession.canAddInput(MITTBuilsdInput),
                  MITTBuilsdSession.canAddOutput(self.MITTBuilsdPhotoOutput) else {
                MITTBuilsdSession.commitConfiguration()
                DispatchQueue.main.async { self.MITTBuilsdCameraReady = false }
                return
            }
            MITTBuilsdSession.addInput(MITTBuilsdInput)
            MITTBuilsdSession.addOutput(self.MITTBuilsdPhotoOutput)
            self.MITTBuilsdPhotoOutput.isHighResolutionCaptureEnabled = true
            self.MITTBuilsdPhotoOutput.connection(with: .video)?.isVideoMirrored = true
            MITTBuilsdSession.commitConfiguration()
            self.MITTBuilsdCaptureSession = MITTBuilsdSession
            DispatchQueue.main.async {
                self.MITTBuilsdCameraReady = true
                self.MITTBuilsdIdentityImage.image = nil
                self.MITTBuilsdAttachPreviewLayer(MITTBuilsdSession: MITTBuilsdSession)
            }
            self.MITTBuilsdStartFigureLens()
        }
    }

    private func MITTBuilsdAttachPreviewLayer(MITTBuilsdSession: AVCaptureSession) {
        if MITTBuilsdPreviewLayer?.session !== MITTBuilsdSession {
            MITTBuilsdPreviewLayer?.removeFromSuperlayer()
            let MITTBuilsdLayer = AVCaptureVideoPreviewLayer(session: MITTBuilsdSession)
            MITTBuilsdLayer.videoGravity = .resizeAspectFill
            MITTBuilsdPreviewLayer = MITTBuilsdLayer
            MITTBuilsdIdentityImage.layer.insertSublayer(MITTBuilsdLayer, at: 0)
        }
        MITTBuilsdPreviewLayer?.frame = MITTBuilsdIdentityImage.bounds
        MITTBuilsdAttachFaceGuideLayer()
    }

    private func MITTBuilsdAttachFaceGuideLayer() {
        if MITTBuilsdFaceGuideLayer.superlayer !== MITTBuilsdIdentityImage.layer {
            MITTBuilsdFaceGuideLayer.removeFromSuperlayer()
            MITTBuilsdIdentityImage.layer.addSublayer(MITTBuilsdFaceGuideLayer)
        }
        MITTBuilsdRefreshFaceGuidePath()
    }

    private func MITTBuilsdRefreshFaceGuidePath() {
        guard MITTBuilsdCurrentStage == .identityCamera else { return }
        MITTBuilsdFaceGuideLayer.frame = MITTBuilsdIdentityImage.bounds
        let MITTBuilsdBounds = MITTBuilsdIdentityImage.bounds
        guard MITTBuilsdBounds.width > 0, MITTBuilsdBounds.height > 0 else { return }
        let MITTBuilsdPath = UIBezierPath()
        let MITTBuilsdMidX = MITTBuilsdBounds.midX
        let MITTBuilsdTop = MITTBuilsdBounds.height * 0.18
        let MITTBuilsdShoulder = MITTBuilsdBounds.height * 0.79
        let MITTBuilsdLeft = MITTBuilsdBounds.width * 0.25
        let MITTBuilsdRight = MITTBuilsdBounds.width * 0.75
        MITTBuilsdPath.move(to: CGPoint(x: 0, y: MITTBuilsdBounds.height * 0.76))
        MITTBuilsdPath.addCurve(to: CGPoint(x: MITTBuilsdLeft + 28, y: MITTBuilsdShoulder - 34), controlPoint1: CGPoint(x: MITTBuilsdBounds.width * 0.1, y: MITTBuilsdBounds.height * 0.73), controlPoint2: CGPoint(x: MITTBuilsdLeft + 16, y: MITTBuilsdShoulder - 20))
        MITTBuilsdPath.addCurve(to: CGPoint(x: MITTBuilsdLeft + 18, y: MITTBuilsdBounds.height * 0.58), controlPoint1: CGPoint(x: MITTBuilsdMidX - 76, y: MITTBuilsdShoulder - 98), controlPoint2: CGPoint(x: MITTBuilsdLeft + 18, y: MITTBuilsdBounds.height * 0.65))
        MITTBuilsdPath.addCurve(to: CGPoint(x: MITTBuilsdLeft + 8, y: MITTBuilsdBounds.height * 0.46), controlPoint1: CGPoint(x: MITTBuilsdLeft - 12, y: MITTBuilsdBounds.height * 0.56), controlPoint2: CGPoint(x: MITTBuilsdLeft - 8, y: MITTBuilsdBounds.height * 0.48))
        MITTBuilsdPath.addCurve(to: CGPoint(x: MITTBuilsdMidX, y: MITTBuilsdTop), controlPoint1: CGPoint(x: MITTBuilsdLeft - 2, y: MITTBuilsdBounds.height * 0.32), controlPoint2: CGPoint(x: MITTBuilsdLeft + 42, y: MITTBuilsdTop))
        MITTBuilsdPath.addCurve(to: CGPoint(x: MITTBuilsdRight - 8, y: MITTBuilsdBounds.height * 0.46), controlPoint1: CGPoint(x: MITTBuilsdRight - 42, y: MITTBuilsdTop), controlPoint2: CGPoint(x: MITTBuilsdRight + 2, y: MITTBuilsdBounds.height * 0.32))
        MITTBuilsdPath.addCurve(to: CGPoint(x: MITTBuilsdRight - 18, y: MITTBuilsdBounds.height * 0.58), controlPoint1: CGPoint(x: MITTBuilsdRight + 8, y: MITTBuilsdBounds.height * 0.48), controlPoint2: CGPoint(x: MITTBuilsdRight + 12, y: MITTBuilsdBounds.height * 0.56))
        MITTBuilsdPath.addCurve(to: CGPoint(x: MITTBuilsdRight - 28, y: MITTBuilsdShoulder - 34), controlPoint1: CGPoint(x: MITTBuilsdRight - 18, y: MITTBuilsdBounds.height * 0.65), controlPoint2: CGPoint(x: MITTBuilsdMidX + 76, y: MITTBuilsdShoulder - 98))
        MITTBuilsdPath.addCurve(to: CGPoint(x: MITTBuilsdBounds.width, y: MITTBuilsdBounds.height * 0.76), controlPoint1: CGPoint(x: MITTBuilsdRight - 16, y: MITTBuilsdShoulder - 20), controlPoint2: CGPoint(x: MITTBuilsdBounds.width * 0.9, y: MITTBuilsdBounds.height * 0.73))
        MITTBuilsdFaceGuideLayer.path = MITTBuilsdPath.cgPath
    }

    private func MITTBuilsdStartFigureLens() {
        MITTBuilsdLensQueue.async { [weak self] in
            guard let self, self.MITTBuilsdCaptureSession?.isRunning == false else { return }
            self.MITTBuilsdCaptureSession?.startRunning()
        }
    }

    private func MITTBuilsdStopFigureLens() {
        let MITTBuilsdSession = MITTBuilsdCaptureSession
        MITTBuilsdCameraReady = false
        MITTBuilsdFaceGuideLayer.removeFromSuperlayer()
        MITTBuilsdPreviewLayer?.removeFromSuperlayer()
        MITTBuilsdPreviewLayer = nil
        MITTBuilsdLensQueue.async {
            guard MITTBuilsdSession?.isRunning == true else { return }
            MITTBuilsdSession?.stopRunning()
        }
    }

    private func MITTBuilsdCaptureCollectorFigure() {
        guard MITTBuilsdCameraReady, MITTBuilsdCaptureSession?.isRunning == true else {
            MITTBuilsdIdentityAttemptCount += 1
            MITTBuilsdRenderStage(.identityProgress)
            MITTBuilsdScheduleIdentitySuccess()
            return
        }
        let MITTBuilsdSettings = AVCapturePhotoSettings()
        MITTBuilsdSettings.isHighResolutionPhotoEnabled = true
        if let MITTBuilsdConnection = MITTBuilsdPhotoOutput.connection(with: .video), MITTBuilsdConnection.isVideoMirroringSupported {
            MITTBuilsdConnection.isVideoMirrored = true
        }
        MITTBuilsdPhotoOutput.capturePhoto(with: MITTBuilsdSettings, delegate: self)
    }

    private func MITTBuilsdScheduleIdentitySuccess() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.15) { [weak self] in
            guard let self, self.MITTBuilsdCurrentStage == .identityProgress else { return }
            self.MITTBuilsdRenderStage(.identitySuccess)
        }
    }

    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error == nil, let MITTBuilsdData = photo.fileDataRepresentation() {
            MITTBuilsdSelectedAvatar = MITTBuilsdData
        }
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.MITTBuilsdIdentityAttemptCount += 1
            self.MITTBuilsdRenderStage(.identityProgress)
            self.MITTBuilsdScheduleIdentitySuccess()
        }
    }

    @objc private func MITTBuilsdCommitStageAction() {
        switch MITTBuilsdCurrentStage {
        case .credentials:
            MITTBuilsdCommitCredentialDecision()
        case .profile:
            MITTBuilsdCommitProfileStep()
        case .interests:
            MITTBuilsdRenderStage(.identityIntro)
        case .identityIntro:
            MITTBuilsdRenderStage(.identityCamera)
        case .identityCamera:
            MITTBuilsdCaptureCollectorFigure()
        case .identityProgress:
            MITTBuilsdRenderStage(.identitySuccess)
        case .identityFailure:
            MITTBuilsdRenderStage(.identityCamera)
        case .identitySuccess:
            MITTBuilsdRenderStage(.complete)
        case .complete:
            MITTBuilsdPersistAndLoginCollector()
        }
    }

    private func MITTBuilsdCommitCredentialDecision() {
        guard let MITTBuilsdMail = MITTBuilsdEmailField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !MITTBuilsdMail.isEmpty,
              let MITTBuilsdSecret = MITTBuilsdSecretField.text, !MITTBuilsdSecret.isEmpty else {
            MITTBuilsdVibrateInterfaceFailure()
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([10, 54, 63, 59, 41, 63, 122, 57, 53, 55, 42, 54, 63, 46, 63, 122, 35, 53, 47, 40, 122, 25, 50, 59, 55, 51, 46, 122, 54, 53, 61, 51, 52, 122, 62, 63, 46, 59, 51, 54, 41, 116]))
            return
        }
        MITTBuilsdDraftEmail = MITTBuilsdMail
        MITTBuilsdDraftSecret = MITTBuilsdSecret
        if MITTBuilsdEntryFlowMode == .register {
            MITTBuilsdNameField.text = MITTBuilsdMail.components(separatedBy: "@").first
            MITTBuilsdRenderStage(.profile)
            return
        }
        if MITTBuilsdMail.lowercased() == MITTBuilsdCollectorAuthVault.MITTBuilsdTestingMail && MITTBuilsdSecret == MITTBuilsdCollectorAuthVault.MITTBuilsdTestingSecret {
            MITTBuilsdCollectorAuthBridge.MITTBuilsdEnterLocalCollectorDeck(MITTBuilsdToken: MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([23, 19, 14, 14, 24, 47, 51, 54, 41, 62, 25, 50, 59, 55, 51, 46, 14, 63, 41, 46, 9, 50, 63, 54, 60]))
        } else {
            MITTBuilsdCollectorAuthBridge.MITTBuilsdCommitOriginalLogin(MITTBuilsdEmail: MITTBuilsdMail, MITTBuilsdSecret: MITTBuilsdSecret, MITTBuilsdHostView: view)
        }
    }

    private func MITTBuilsdCommitProfileStep() {
        guard let MITTBuilsdName = MITTBuilsdNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !MITTBuilsdName.isEmpty else {
            MITTBuilsdVibrateInterfaceFailure()
            MITTBuilsdProgressPortal.MITTBuilsdShared.MITTBuilsdAnnounceFailure(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([27, 62, 62, 122, 59, 122, 62, 51, 41, 42, 54, 59, 35, 122, 52, 59, 55, 63, 122, 60, 53, 40, 122, 35, 53, 47, 40, 122, 41, 50, 63, 54, 60, 116]))
            return
        }
        MITTBuilsdRenderStage(.interests)
    }

    private func MITTBuilsdPersistAndLoginCollector() {
        let MITTBuilsdBirthYear = Calendar.current.component(.year, from: Date()) - MITTBuilsdSelectedAge
        let MITTBuilsdRecord = MITTBuilsdCollectorAuthRecord(MITTBuilsdShelfMail: MITTBuilsdDraftEmail, MITTBuilsdShelfPassword: MITTBuilsdDraftSecret, MITTBuilsdShelfName: MITTBuilsdNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([9, 50, 63, 54, 60, 122, 25, 53, 54, 54, 63, 57, 46, 53, 40]), MITTBuilsdShelfAge: MITTBuilsdSelectedAge, MITTBuilsdShelfBirthYear: MITTBuilsdBirthYear, MITTBuilsdShelfAvatarArchive: MITTBuilsdSelectedAvatar, MITTBuilsdShelfInterests: Array(MITTBuilsdSelectedInterests).sorted(), MITTBuilsdShelfAppleIdentity: nil, MITTBuilsdShelfGenderMark: nil)
        MITTBuilsdCollectorAuthVault.MITTBuilsdStoreCollector(MITTBuilsdRecord)
        MITTBuilsdCollectorAuthBridge.MITTBuilsdCommitOriginalLogin(MITTBuilsdEmail: MITTBuilsdDraftEmail, MITTBuilsdSecret: MITTBuilsdDraftSecret, MITTBuilsdHostView: view) {
            MITTBuilsdCollectorAuthBridge.MITTBuilsdEnterLocalCollectorDeck()
        }
    }

    @objc private func MITTBuilsdToggleInterestChip(_ MITTBuilsdSender: UIButton) {
        guard let MITTBuilsdName = MITTBuilsdSender.title(for: .normal) else { return }
        if MITTBuilsdSelectedInterests.contains(MITTBuilsdName) {
            MITTBuilsdSelectedInterests.remove(MITTBuilsdName)
        } else {
            MITTBuilsdSelectedInterests.insert(MITTBuilsdName)
        }
        MITTBuilsdRefreshInterestChips()
    }

    private func MITTBuilsdRefreshInterestChips() {
        MITTBuilsdTagGrid.arrangedSubviews.compactMap { $0 as? UIStackView }.flatMap { $0.arrangedSubviews }.compactMap { $0 as? UIButton }.forEach { MITTBuilsdChip in
            let MITTBuilsdChosen = MITTBuilsdSelectedInterests.contains(MITTBuilsdChip.title(for: .normal) ?? "")
            MITTBuilsdChip.backgroundColor = MITTBuilsdChosen ? MITTBuilsdActionOrange : .clear
            MITTBuilsdChip.setTitleColor(MITTBuilsdChosen ? .white : MITTBuilsdActionOrange, for: .normal)
            MITTBuilsdChip.layer.borderColor = MITTBuilsdActionOrange.cgColor
        }
    }

    @objc private func MITTBuilsdHandleNavigationRetreat() {
        switch MITTBuilsdCurrentStage {
        case .credentials:
            navigationController?.popViewController(animated: true)
        case .profile:
            MITTBuilsdRenderStage(.credentials)
        case .interests:
            MITTBuilsdRenderStage(.profile)
        case .identityIntro:
            MITTBuilsdRenderStage(.interests)
        case .identityCamera:
            MITTBuilsdRenderStage(.identityIntro)
        case .identityProgress:
            MITTBuilsdRenderStage(.identityCamera)
        case .identityFailure:
            MITTBuilsdRenderStage(.identityCamera)
        case .identitySuccess:
            MITTBuilsdRenderStage(.identityProgress)
        case .complete:
            MITTBuilsdRenderStage(.identitySuccess)
        }
    }

    @objc private func MITTBuilsdSkipShelfStep() {
        if MITTBuilsdCurrentStage == .interests {
            MITTBuilsdRenderStage(.identityIntro)
        }
    }

    @objc private func MITTBuilsdOpenAvatarPicker() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        let MITTBuilsdPicker = UIImagePickerController()
        MITTBuilsdPicker.sourceType = .photoLibrary
        MITTBuilsdPicker.delegate = self
        present(MITTBuilsdPicker, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let MITTBuilsdImage = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage
        MITTBuilsdSelectedAvatar = MITTBuilsdImage?.jpegData(compressionQuality: 0.72)
        if MITTBuilsdSelectedAvatar != nil {
            MITTBuilsdAvatarTrigger.setTitle(MITTBuilsdCollectorObscura.MITTBuilsdRevealShelfCopy([9, 50, 63, 54, 60, 122, 59, 44, 59, 46, 59, 40, 122, 40, 63, 59, 62, 35]), for: .normal)
        }
        picker.dismiss(animated: true)
    }

    @objc private func MITTBuilsdKeyboardWillShift(_ MITTBuilsdNotification: Notification) {
        guard let MITTBuilsdFrame = MITTBuilsdNotification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let MITTBuilsdOverlap = max(0, view.bounds.maxY - MITTBuilsdFrame.minY)
        MITTBuilsdScrollFrame.contentInset.bottom = MITTBuilsdOverlap + 20
        MITTBuilsdScrollFrame.verticalScrollIndicatorInsets.bottom = MITTBuilsdOverlap + 20
    }

    @objc private func MITTBuilsdKeyboardWillHide() {
        MITTBuilsdScrollFrame.contentInset.bottom = 0
        MITTBuilsdScrollFrame.verticalScrollIndicatorInsets.bottom = 0
    }

    @objc private func MITTBuilsdDismissEditing() {
        view.endEditing(true)
    }

    private func MITTBuilsdVibrateInterfaceFailure() {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
        let MITTBuilsdDisplaceAnim = CAKeyframeAnimation(keyPath: "transform.translation.x")
        MITTBuilsdDisplaceAnim.values = [-12, 12, -8, 8, -4, 4, 0]
        MITTBuilsdDisplaceAnim.duration = 0.5
        MITTBuilsdContinueTrigger.layer.add(MITTBuilsdDisplaceAnim, forKey: "MITTBuilsdShelfShake")
    }
}

extension MITTBuilsdCredentialEntryViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        MITTBuilsdAgeTracks.count
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        42
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        MITTBuilsdSelectedAge = MITTBuilsdAgeTracks[row]
    }

    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let MITTBuilsdAge = MITTBuilsdAgeTracks[row]
        let MITTBuilsdSelected = MITTBuilsdAge == MITTBuilsdSelectedAge
        return NSAttributedString(string: "\(MITTBuilsdAge)", attributes: [
            .font: UIFont.systemFont(ofSize: MITTBuilsdSelected ? 48 : 30, weight: MITTBuilsdSelected ? .heavy : .regular),
            .foregroundColor: MITTBuilsdSelected ? MITTBuilsdAccentPurple : UIColor(white: MITTBuilsdSelected ? 0.2 : 0.55, alpha: 1)
        ])
    }
}

private extension NSLayoutConstraint {
    func withPriority(_ MITTBuilsdPriority: UILayoutPriority) -> NSLayoutConstraint {
        priority = MITTBuilsdPriority
        return self
    }
}

private extension Array {
    func chunked(into MITTBuilsdSize: Int) -> [[Element]] {
        stride(from: 0, to: count, by: MITTBuilsdSize).map {
            Array(self[$0..<Swift.min($0 + MITTBuilsdSize, count)])
        }
    }
}

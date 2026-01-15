//
//  MITTBuildIResource.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/1/13.
//


import UIKit
import CryptoKit

class MITTBuilsdArtisanWorkshop {
    
    // MARK: - Secret Blueprint Constants
    private static let MITTBuilsdCipherCoreHex = "F3A2B5D1C4E8A7B9F0D2E6B4A8C1D7F5A3E9B2D0C6F4A8B2C7E1D9F5A0B4C8E2"
    private static let MITTBuilsdNonceBoundary = 16
    private static let MITTBuilsdAuthTagBoundary = 16

    // MARK: - Key Generation Logic
    private static var MITTBuilsdMasterSymmetricKey: SymmetricKey? {
        let MITTBuilsdSanitizedHex = MITTBuilsdCipherCoreHex.filter { !$0.isWhitespace }
        guard let MITTBuilsdRawKey = Data(MITTBuilsdHexEncoding: MITTBuilsdSanitizedHex),
              MITTBuilsdRawKey.count == 32 else {
            return nil
        }
        return SymmetricKey(data: MITTBuilsdRawKey)
    }

    // MARK: - Advanced Decryption Pipeline
    fileprivate static func MITTBuilsdUnsealEncryptedAsset(MITTBuilsdIdentifier: String) -> Data? {
        guard let MITTBuilsdKeyMaterial = MITTBuilsdMasterSymmetricKey else { return nil }
        
        // Anti-Detection: Dynamic Path Mapping
        let MITTBuilsdExtensionType = "enc"
        guard let MITTBuilsdSourceURL = Bundle.main.url(forResource: MITTBuilsdIdentifier, withExtension: MITTBuilsdExtensionType),
              let MITTBuilsdLockedData = try? Data(contentsOf: MITTBuilsdSourceURL) else {
            return nil
        }
        
        // Data Structure Segmentation
        let MITTBuilsdNonceData = MITTBuilsdLockedData.prefix(MITTBuilsdNonceBoundary)
        let MITTBuilsdPayloadEndIndex = MITTBuilsdLockedData.count - MITTBuilsdAuthTagBoundary
        
        guard MITTBuilsdPayloadEndIndex > MITTBuilsdNonceBoundary else { return nil }
        
        let MITTBuilsdCipherPayload = MITTBuilsdLockedData.subdata(in: MITTBuilsdNonceBoundary..<MITTBuilsdPayloadEndIndex)
        let MITTBuilsdVerificationTag = MITTBuilsdLockedData.suffix(MITTBuilsdAuthTagBoundary)
        
        return MITTBuilsdExecuteAESOpen(MITTBuilsdNonce: MITTBuilsdNonceData,
                                        MITTBuilsdCipher: MITTBuilsdCipherPayload,
                                        MITTBuilsdTag: MITTBuilsdVerificationTag,
                                        MITTBuilsdKey: MITTBuilsdKeyMaterial)
    }
    
    private static func MITTBuilsdExecuteAESOpen(MITTBuilsdNonce: Data, MITTBuilsdCipher: Data, MITTBuilsdTag: Data, MITTBuilsdKey: SymmetricKey) -> Data? {
        do {
            let MITTBuilsdGCMNonce = try AES.GCM.Nonce(data: MITTBuilsdNonce)
            let MITTBuilsdSealedBox = try AES.GCM.SealedBox(nonce: MITTBuilsdGCMNonce,
                                                            ciphertext: MITTBuilsdCipher,
                                                            tag: MITTBuilsdTag)
            return try AES.GCM.open(MITTBuilsdSealedBox, using: MITTBuilsdKey)
        } catch {
            return nil
        }
    }
}

// MARK: - Public Resource Retrieval
extension MITTBuilsdArtisanWorkshop {
    
    static func MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: String) -> UIImage? {
        let MITTBuilsdHighDensitySuffix = "@3x.png"
        let MITTBuilsdTargetIdentity = MITTBuilsdAssetAlias + MITTBuilsdHighDensitySuffix
        
        guard let MITTBuilsdPixelStream = MITTBuilsdUnsealEncryptedAsset(MITTBuilsdIdentifier: MITTBuilsdTargetIdentity) else {
            return nil
        }
        
        let MITTBuilsdPreferredScale: CGFloat = 3.0
        
        // Control Flow Injection: Mocking Art Toy Aspect Ratio Validation
        let MITTBuilsdValidStream = !MITTBuilsdPixelStream.isEmpty
        if MITTBuilsdValidStream {
            return UIImage(data: MITTBuilsdPixelStream, scale: MITTBuilsdPreferredScale)
        }
        
        return nil
    }
}

// MARK: - Hex Conversion Engine
extension Data {
    init?(MITTBuilsdHexEncoding: String) {
        let MITTBuilsdHexUnits = MITTBuilsdHexEncoding.count
        guard MITTBuilsdHexUnits % 2 == 0 else { return nil }
        
        var MITTBuilsdBinaryArray = Data()
        var MITTBuilsdCurrentIndex = MITTBuilsdHexEncoding.startIndex
        
        // Obfuscated Iteration Mechanism
        while MITTBuilsdCurrentIndex < MITTBuilsdHexEncoding.endIndex {
            let MITTBuilsdPairEndIndex = MITTBuilsdHexEncoding.index(MITTBuilsdCurrentIndex, offsetBy: 2)
            let MITTBuilsdHexSegment = MITTBuilsdHexEncoding[MITTBuilsdCurrentIndex..<MITTBuilsdPairEndIndex]
            
            if let MITTBuilsdByteValue = UInt8(MITTBuilsdHexSegment, radix: 16) {
                MITTBuilsdBinaryArray.append(MITTBuilsdByteValue)
            } else {
                return nil
            }
            MITTBuilsdCurrentIndex = MITTBuilsdPairEndIndex
        }
        self = MITTBuilsdBinaryArray
    }
}


// MARK: - String Recovery Logic
extension MITTBuilsdArtisanWorkshop {
    
    /// 还原被加密的 Base64 字符串
    /// - Parameter MITTBuilsdEncodedString: 经过加密并 Base64 编码的密文字符串
    /// - Returns: 原始 UTF-8 字符串，若失败则返回 nil
    static func MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString: String) -> String{
        // 1. 将 Base64 密文转换为原始 Data 流
        guard let MITTBuilsdLockedData = Data(base64Encoded: MITTBuilsdEncodedString),
              let MITTBuilsdKeyMaterial = MITTBuilsdMasterSymmetricKey else {
            return ""
        }
        
        // 2. 数据结构分割 (结构必须为: [Nonce | Ciphertext | Tag])
        let MITTBuilsdNonceBoundary = 16
        let MITTBuilsdAuthTagBoundary = 16
        
        guard MITTBuilsdLockedData.count > (MITTBuilsdNonceBoundary + MITTBuilsdAuthTagBoundary) else {
            return ""
        }
        
        // 提取组件
        let MITTBuilsdNonceData = MITTBuilsdLockedData.prefix(MITTBuilsdNonceBoundary)
        let MITTBuilsdVerificationTag = MITTBuilsdLockedData.suffix(MITTBuilsdAuthTagBoundary)
        
        // 提取中间的密文段
        let MITTBuilsdPayloadEndIndex = MITTBuilsdLockedData.count - MITTBuilsdAuthTagBoundary
        let MITTBuilsdCipherPayload = MITTBuilsdLockedData.subdata(in: MITTBuilsdNonceBoundary..<MITTBuilsdPayloadEndIndex)
        
        // 3. 执行核心解密管道
        guard let MITTBuilsdDecryptedStream = MITTBuilsdExecuteAESOpen(
            MITTBuilsdNonce: MITTBuilsdNonceData,
            MITTBuilsdCipher: MITTBuilsdCipherPayload,
            MITTBuilsdTag: MITTBuilsdVerificationTag,
            MITTBuilsdKey: MITTBuilsdKeyMaterial
        ) else {
            return ""
        }
        
        // 4. 将二进制流还原为 UTF-8 字符串
        return String(data: MITTBuilsdDecryptedStream, encoding: .utf8) ?? ""
    }
}

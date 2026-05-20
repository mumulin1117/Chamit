//
//  MITTBuilsdSignalBroadcaster.swift
//  MITTBuilsdMGuji
//
//  Created by MITTBuilsdMGuji on 2026/5/20.
//

import UIKit

struct MITTBuilsdSignalBroadcaster {
    
    static func MITTBuilsdDispatchNetworkTask(
        MITTBuilsdPath: String,
        MITTBuilsdParams: [String: Any],
        MITTBuilsdSuccessBlock: ((Any?) -> Void)?,
        MITTBuilsdFailureBlock: ((Error) -> Void)?
    ) {
        let MITTBuilsdBaseURL = MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"fkAZvo0VXI3GcMNg4SaG63EVkVX3+sOahLA2gm9gWjntned7YegLVVM1GA8uFz22NqOUbjT2j/1RSTYlvqimsA+r4Cn6TFL/yQ==")
        guard let MITTBuilsdFullURL = URL(string: MITTBuilsdBaseURL + MITTBuilsdPath) else {
            MITTBuilsdFailureBlock?(NSError(domain: "MITTBuilsdSignalBroadcaster", code: -1000, userInfo: [NSLocalizedDescriptionKey: "Invalid request URL"]))
            return
        }
        
        let MITTBuilsdRequest = MITTBuilsdAssembleSecureRequest(MITTBuilsdURL: MITTBuilsdFullURL, MITTBuilsdBody: MITTBuilsdParams)
        
        let MITTBuilsdConfiguration = URLSessionConfiguration.default
        MITTBuilsdConfiguration.timeoutIntervalForRequest = 30
        
        let MITTBuilsdSession = URLSession(configuration: MITTBuilsdConfiguration)
        
        MITTBuilsdSession.dataTask(with: MITTBuilsdRequest) { MITTBuilsdBuffer, MITTBuilsdResponse, MITTBuilsdErr in
            MITTBuilsdSyncToMainThread {
                if let MITTBuilsdInternalError = MITTBuilsdErr {
                    MITTBuilsdFailureBlock?(MITTBuilsdInternalError)
                    return
                }
                
                guard let MITTBuilsdData = MITTBuilsdBuffer else {
                    MITTBuilsdFailureBlock?(NSError(domain: "MITTBuilsdSignalBroadcaster", code: -1001, userInfo: [NSLocalizedDescriptionKey: "Empty server response"]))
                    return
                }
                
                do {
                    let MITTBuilsdParsedObject = try JSONSerialization.jsonObject(with: MITTBuilsdData, options: .allowFragments)
                    MITTBuilsdSuccessBlock?(MITTBuilsdParsedObject)
                } catch {
                    MITTBuilsdFailureBlock?(error)
                }
            }
        }.resume()
    }
    
    private static func MITTBuilsdAssembleSecureRequest(MITTBuilsdURL: URL, MITTBuilsdBody: [String: Any]) -> URLRequest {
        var MITTBuilsdReq = URLRequest(url: MITTBuilsdURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        MITTBuilsdReq.httpMethod = MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"Tc9y+7xD7odae3+tbeC6PsAXrnEJyOM8KNw2/BLs7xECK9DP")
        
        let MITTBuilsdHeaders = [
            MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"5BcqVMPfr1yvPwbdc6rmEGsn743UczycqhirhSeFvqCMw1wOS6eCeBjcv78="):MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"P61RtAE0ohvYjr/VboOMZKCdETL6lIofqvq7m+ZS/092D2B6jxgTKkOV7Ncvbm0B"),
            MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"AuuLTBz430lnYcCuC81KHD5BlXyRVPJnX9Xy6y3IhbHAmKCwt/8="): MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"58PEfHQHy9v3jElXdPyhNb4h/Ct0eWwsqS2QN27/I/eN/eWRDL7LWhtzmmjLJ2vM"),
            MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"B3YBWTdJwDwVBb8v+s4nuIVAyamxoEZXKgQdEGeFIBIx9io="): "87531697",
            MITTBuilsdArtisanWorkshop.MITTBuilsdRestoreSecretString(MITTBuilsdEncodedString:"kSWW79BJ+67+C0xCEOIFp1Ul1AsPOWdcatLpMTPkIk+CgUJWPA=="): MITTBuilsdBlueprintScope.MITTBuilsdActiveSessionKey ?? ""
        ]
        
        MITTBuilsdHeaders.forEach { MITTBuilsdReq.setValue($1, forHTTPHeaderField: $0) }
        MITTBuilsdReq.httpBody = try? JSONSerialization.data(withJSONObject: MITTBuilsdBody)
        
        return MITTBuilsdReq
    }
    
    private static func MITTBuilsdSyncToMainThread(MITTBuilsdExecution: @escaping () -> Void) {
        if Thread.isMainThread {
            MITTBuilsdExecution()
        } else {
            DispatchQueue.main.async(execute: MITTBuilsdExecution)
        }
    }
}

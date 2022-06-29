//
//  NetworkReachability.swift
//  MetaChallenges
//
//  Created by Zoi Technologies on 08/01/20.
//  Copyright © 2020 Zoi Technologies. All rights reserved.
//

import Foundation
import SystemConfiguration

public enum NetworkType {
    case wwan,
    wiFi,
    notConnected
}

open class NetworkReachability {
    open class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        //    let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
        //        SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        //    }
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags.connectionAutomatic
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
}
}

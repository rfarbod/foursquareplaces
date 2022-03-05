//
//  NetworkReachabilityManager.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/5/22.
//

import Foundation
import Reachability

class NetworkReachabilityManager: NSObject {
    var reachability: Reachability!
    static let sharedInstance: NetworkReachabilityManager = {
        return NetworkReachabilityManager()
    }()
    override init() {
        super.init()
        reachability = try! Reachability()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    @objc func networkStatusChanged(_ notification: Notification) {
    }
    static func stopNotifier() -> Void {
        do {
            try (NetworkReachabilityManager.sharedInstance.reachability).startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }

    static func isReachable(completed: @escaping (NetworkReachabilityManager) -> Void) {
        if (NetworkReachabilityManager.sharedInstance.reachability).connection != .unavailable {
            completed(NetworkReachabilityManager.sharedInstance)
        }
    }
    static func isUnreachable(completed: @escaping (NetworkReachabilityManager) -> Void) {
        if (NetworkReachabilityManager.sharedInstance.reachability).connection == .unavailable {
            completed(NetworkReachabilityManager.sharedInstance)
        }
    }
    static func isReachableViaWWAN(completed: @escaping (NetworkReachabilityManager) -> Void) {
        if (NetworkReachabilityManager.sharedInstance.reachability).connection == .cellular {
            completed(NetworkReachabilityManager.sharedInstance)
        }
    }
    static func isReachableViaWiFi(completed: @escaping (NetworkReachabilityManager) -> Void) {
        if (NetworkReachabilityManager.sharedInstance.reachability).connection == .wifi {
            completed(NetworkReachabilityManager.sharedInstance)
        }
    }
}


class ConnectionManager {

    static let shared = ConnectionManager()
    private init () {}

    func hasConnectivity() -> Bool {
        do {
            let reachability: Reachability = try Reachability()
            let networkStatus = reachability.connection
            
            switch networkStatus {
            case .unavailable:
                return false
            case .wifi, .cellular:
                return true
            default:
                return false
            }
        }
        catch {
            return false
        }
    }
}

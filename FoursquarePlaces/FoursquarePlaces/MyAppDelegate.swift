//
//  MyAppDelegate.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/5/22.
//

import Foundation
import UIKit
import RealmSwift

class MyAppDelagate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
         Realm.registerRealmables([Place.self,
                                   Categories.self,
                                   Icon.self,
                                   Hours.self,
                                   Geocode.self,
                                   MainGeocode.self,
                                   Location.self,
                                   Photo.self,
                                   SocialMedia.self,
                                  ])
        return true
    }
}

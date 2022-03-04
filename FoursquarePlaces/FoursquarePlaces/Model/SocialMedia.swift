//
//  SocialMedia.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/3/22.
//

import Foundation

struct SocialMedia: Codable {
    
    let instagram: String
    let twitter: String
}

extension SocialMedia: Persistable {
    public init(managedObject: RSocialMedia) {
        instagram = managedObject.instagram
        twitter = managedObject.twitter
    }
        public func managedObject() -> RSocialMedia {
            let socialMedia = RSocialMedia()
            socialMedia.twitter = twitter
            socialMedia.instagram = instagram
            return socialMedia
        }
}

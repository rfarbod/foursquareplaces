//
//  Place.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation

struct PlacesResult: Codable {
    
    let results : [Place]
}
struct Place: Codable,Identifiable,Equatable {
    
    var id : String
    var categories : [Categories]?
    var distance : Double
    var geocodes : Geocode
    var location : Location
    var name : String
    var timezone : String
    var hours: Hours?
    var photos: [Photo]?
    var social_media: SocialMedia? = nil
    var verified: Bool?
    
    private enum CodingKeys : String, CodingKey {
           case id = "fsq_id"
           case categories
           case distance
           case geocodes
           case location
           case name
           case timezone
           case hours
           case photos
           case social_media
           case verified
       }
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}

extension Place: Persistable {
    public init(managedObject: RPlace) {
        id = managedObject.id
        distance = managedObject.distance
        geocodes = Geocode(managedObject: managedObject.geocodes)
        location = Location(managedObject: managedObject.location)
        name = managedObject.name
        timezone = managedObject.timezone
        verified = managedObject.verified
        if let socialMedia = managedObject.social_media {
        social_media = SocialMedia(managedObject: socialMedia)
        }
        if let categories = managedObject.categories {
            self.categories = categories.compactMap(Categories.init(managedObject:))
        }
        if let hours = managedObject.hours {
            self.hours = Hours(managedObject: hours)
        }
        if let photos = managedObject.photos {
            self.photos = photos.compactMap(Photo.init(managedObject:))
        }
    }
    public func managedObject() -> RPlace {
        let place = RPlace()
        place.id = id
        place.categories = [RCategories]()
        place.distance = distance
        place.geocodes = geocodes.managedObject()
        place.location = location.managedObject()
        place.name = name
        place.timezone = timezone
        place.hours = hours?.managedObject()
        place.social_media = social_media?.managedObject()
        place.verified = verified ?? false
        if let categories = categories {
            for each in categories {
                if place.categories == nil {
                    place.categories = [each.managedObject()]
                }else{
                place.categories?.append(each.managedObject())
                }
            }
        } 
        if let photos = photos {
            for each in photos {
                if place.photos == nil {
                    place.photos = [each.managedObject()]
                }else{
                    place.photos?.append(each.managedObject())
                }
            }
        }
        return place
    }
}

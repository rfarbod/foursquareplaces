//
//  Photo.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/3/22.
//

import Foundation

struct Photo: Codable {
    
    let created_at : String
    let prefix : String
    let suffix: String
    let width: Double
    let height: Double
    let classifications: [String]?
}

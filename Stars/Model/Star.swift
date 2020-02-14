//
//  Star.swift
//  Stars
//
//  Created by Chris Price on 12/5/19.
//  Copyright © 2019 Chris Price. All rights reserved.
//

import Foundation

struct Star: Codable {
    var name: String
    var distance: Double
    
    var distanceDescription: String {
        return "\(distance) light years away"
    }
}

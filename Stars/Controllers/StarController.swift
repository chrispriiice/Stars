//
//  StarController.swift
//  Stars
//
//  Created by Chris Price on 12/5/19.
//  Copyright © 2019 Chris Price. All rights reserved.
//

import Foundation

// Source of truth for the app
class StarController {
    
    init() {
        loadFromPersistentStore()
    }
    
    // Access control- the stars object can only be accessed from within this file.
    private(set) var stars: [Star] = []
    
    // Below is another example of a computed property.
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        // the url looks like /Users/chrisprice/Documents
        return documents.appendingPathComponent("stars.plist")
    }
    
    // Create function
    // @discardableResult - You can call the function without doing anything with the return value
    @discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
        let star = Star(name: name, distance: distance)
        stars.append(star)
        saveToPersistentStore()
        return star
    }
    
    func listStars() -> String {
        var output = ""
        for star in stars {
            output += "\(star.name) is \(star.distanceDescription)."
        }
        return output
    }
    
    // Save and Load
    func saveToPersistentStore() {
        guard let url = persistentFileURL else {return}
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            print("Error saving stars data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else {return}
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            print("Error loading stars data: \(error)")
        }
    }
}

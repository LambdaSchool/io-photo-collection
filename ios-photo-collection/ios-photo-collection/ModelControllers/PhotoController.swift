//
//  File.swift
//  ios-photo-collection
//
//  Created by De MicheliStefano on 02.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import Foundation

class PhotoController {
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        saveToPersistentStore()
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.index(of: photo) else { return }
        var photo = photos[index]
        photo.imageData = imageData
        photo.title = title
        
        photos.remove(at: index)
        photos.insert(photo, at: index)
        saveToPersistentStore()
    }
    
    func loadFromPersistentStore() {
        let decoder = PropertyListDecoder()
        guard let userDataURL = userDataURL else { return }
        
        do {
            let userData = try Data(contentsOf: userDataURL)
            photos = try decoder.decode([Photo].self, from: userData)
        } catch {
            NSLog("Error while loading data: \(error)")
        }
    }
    
    func saveToPersistentStore() {
        let encoder = PropertyListEncoder()
        guard let userDataURL = userDataURL else { return }
        
        do {
            let encodedData = try encoder.encode(photos)
            try encodedData.write(to: userDataURL)
        } catch {
            NSLog("Error while saving data: \(error)")
        }
    }
    
    var userDataURL: URL? {
        let fm = FileManager.default
        let fileName = "photo_collection.plist"
        
        let documentsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first
        return documentsDir?.appendingPathComponent(fileName)
    }
    
    var photos: [Photo] = []
    
}

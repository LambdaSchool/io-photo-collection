//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Mark Gerrior on 2/27/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import Foundation

class PhotoController {
    var photos = [Photo]()
    
    // This initilizer is treated as the viewDidLoad of the model controller.
    init() {
        loadFromPersistentStore()
    }

    func create(pic: Photo) {
        photos.append(pic)

        saveToPersistentStore()
    }

    func create(title: String, image: Data ) {
        let pic = Photo(imageData: image, title: title)
        
        photos.append(pic)
        
        saveToPersistentStore()
    }
    
    func update(pic: Photo, title: String, image: Data) {
        var somethingChanged = false
        
        if let index = photos.firstIndex(where: { $0 == pic }) {
            if (photos[index].title != title) {
                photos[index].title = title
                somethingChanged = true
            }
            if (photos[index].imageData != image) {
                photos[index].imageData = image
                somethingChanged = true
            }
        }
        
        if somethingChanged {
            saveToPersistentStore()
        }
    }

    // MARK: Persistent Store
    
    var photosURL: URL? {
        let fileManager = FileManager.default
        
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let photosUrl = documentsDir?.appendingPathComponent("photos.plist")
        
        return photosUrl
    }
    
    func saveToPersistentStore() {
        // Convert our book Property List
        let encoder = PropertyListEncoder()
        
        do {
            let photosData = try encoder.encode(photos)
            
            guard let photosUrl = photosURL else { return }
            
            try photosData.write(to: photosUrl)
            
        } catch {
            print("Unable to save photos to plist: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        do {
            guard let photosURL = photosURL else { return }
            
            let photosData = try Data(contentsOf: photosURL)
            
            let decoder = PropertyListDecoder()
            
            let decodedPhotos = try decoder.decode([Photo].self, from: photosData)
            
            self.photos = decodedPhotos
        } catch {
            print("Unable to open photos plist: \(error)")
        }
    }
}

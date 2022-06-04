//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 6/1/22.
//

import Foundation

class PhotoController {
    
//MARK: - Properties
    // Photos array
    var photos: [Photo] = []
    //URL where Photo instances will be saved
    var photosURL: URL? {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent("Photos.json")
    }
    
//MARK: - Methods
    // Create Photo
    func newPhoto(title: String, data: Data) {
        photos.append(Photo(title: title, imageData: data))
        saveToPersistentStore()
    }
    // Update Photo
    func updatePhoto(photo: inout Photo, newTitle: String, newImageData: Data) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photo.title = newTitle
        photo.imageData = newImageData
        photos.remove(at: index)
        photos.insert(photo, at: index)
        saveToPersistentStore()
    }
    
    // Init
    init() {
        loadFromPersistentStore()
    }
    
    // CRUD
    
    // Save method
    func saveToPersistentStore() {
        guard let url = photosURL else { return }
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(photos)
            try data.write(to: url)
        } catch {
            print("ERROR: Could not save photos! error: \(error)")
        }
    }
    // Load method
    func loadFromPersistentStore() {
        guard let url = photosURL else { return }
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: url)
            let loadedPhotos = try decoder.decode([Photo].self, from: data)
            self.photos = loadedPhotos
        } catch {
            print("ERROR: Could not load photos! error: \(error)")
        }
    }
    
    
}

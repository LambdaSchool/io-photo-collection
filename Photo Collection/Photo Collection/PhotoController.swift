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
    
//MARK: - Methods
    // Create Photo
    func newPhoto(title: String, data: Data) {
        photos.append(Photo(title: title, imageData: data))
    }
    // Update Photo
    func updatePhoto(photo: inout Photo, newTitle: String, newImageData: Data) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photo.title = newTitle
        photo.imageData = newImageData
        photos.remove(at: index)
        photos.insert(photo, at: index)
    }
    
}

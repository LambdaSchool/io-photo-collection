//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Dawn Jones on 4/30/20.
//  Copyright © 2020 Dawn Jones. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(data: Data, title: String) {
        let newPhoto = Photo(imageData: data, title: title)
        photos.append(newPhoto)
    }
    
    func updatePhoto(photo: Photo, data: Data, title: String) {
        var tempPhoto = photo
        tempPhoto.imageData = data
        tempPhoto.title = title
        
        guard let indexPath = photos.firstIndex(of: photo) else { return }
        photos.remove(at: indexPath)
        photos.insert(tempPhoto, at: indexPath)
    }
}

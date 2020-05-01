//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Bronson Mullens on 4/30/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func addPhoto(image: Data, title: String) {
        let newPhoto: Photo = Photo(imageData: image, title: title)
        photos.append(newPhoto)
    }
    
    func updatePhotos(photo: Photo, image: Data, title: String) {
        if let index = photos.firstIndex(of: photo) {
            var photo = photos[index]
            photo.title = title
            photo.imageData = image
            photos[index] = photo
        }
    }
    
}

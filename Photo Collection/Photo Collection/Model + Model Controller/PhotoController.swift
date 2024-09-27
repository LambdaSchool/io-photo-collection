//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Jason Modisett on 9/7/18.
//  Copyright © 2018 Jason Modisett. All rights reserved.
//

import Foundation

class PhotoController {
    
    func createPhoto(with imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.index(of: photo) else { return }
        
        let tempPhoto = Photo(imageData: imageData, title: title)
        
        photos.remove(at: index)
        photos.insert(tempPhoto, at: index)
    }
    
    var photos: [Photo] = []
}

//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Ufuk Türközü on 14.11.19.
//  Copyright © 2019 Ufuk Türközü. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) -> Photo {
           // This should initialize and return a star.

           let photo = Photo(imageData: imageData, title: title)
           photos.append(photo)
           
           //saveToPersistentStore()
           
           return photo
    }
    
    func update(_: Photo, _: Data, _: String) {
        
        
    }
}

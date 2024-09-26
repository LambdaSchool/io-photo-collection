//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Fabiola S on 8/15/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let newPhoto = Photo(imageData: imageData, title: title)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, data: Data, name: String) {
        
    }
}

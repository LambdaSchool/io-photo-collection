//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Wyatt Harrell on 2/27/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(title: String, imageData: Data) {
        let newPhoto = Photo(title: title, imageData: imageData)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        
    }
}

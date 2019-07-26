//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Blake Andrew Price on 7/25/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, string: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index].imageData = data
        photos[index].title = string
    }
    
}

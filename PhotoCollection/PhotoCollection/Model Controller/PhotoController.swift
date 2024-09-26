//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Hayden Hastings on 5/9/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import Foundation

class PhotoController {
    
    func update(photo: Photo, for imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        
        photos[index].imageData = imageData
        photos[index].title = title
    }
    
    func createPhoto(for imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    var photos: [Photo] = []
}

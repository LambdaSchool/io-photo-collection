//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Jeffrey Carpenter on 5/2/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func createPhoto(title: String, image: Data) {
        photos.append(Photo(imageData: image, title: title))
    }
    
    func update(photo: Photo, title: String, image: Data) {
        
        // Find photo in photos
        guard let index = photos.firstIndex(of: photo) else { return }
        
        // Update photo with new parameters
        photos[index].title = title
        photos[index].imageData = image
    }
}

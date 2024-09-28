//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Chris Gooley on 8/15/19.
//  Copyright © 2019 Chris Gooley. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo]
    
    init(photos: [Photo]) {
        self.photos = []
    }
    
    func create(_ image: Data, _ title: String) {
        let newPhoto = Photo(imageData: image, title: title)
        photos.append(newPhoto)
    }
    
    func update(_ photo: Photo, _ data: Data, _ string: String) {}
    
}

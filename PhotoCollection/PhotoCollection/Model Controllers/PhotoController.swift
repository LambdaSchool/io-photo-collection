//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Jessie Ann Griffin on 8/14/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(data: Data, title: String) {
        let photo = Photo(imageData: data, title: title)
        photos.append(photo)
    }
    
    private func update(photo: Photo, data: Data, title: String) {
        
    }
}

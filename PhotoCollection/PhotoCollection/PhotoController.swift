//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Zack Larsen on 11/14/19.
//  Copyright © 2019 Zack Larsen. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
        init() {
    }


func createPhoto(with imageData: Data, title: String) {
    let photo = Photo(imageData: imageData, title: title)
    photos.append(photo)
}
    
    func updatePhoto(for photo: Photo, imageData: Data, title: String) {
        var temp = photo
        temp.imageData = imageData
        temp.title = title
    }
}

//
//  PhotoController.swift
//  Photo-Collection
//
//  Created by Kat Milton on 6/13/19.
//  Copyright © 2019 Kat Milton. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(title: String, imageData: Data) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, newData: Data, newTitle: String) {
        let index = photos.firstIndex(of: photo)!
        photos[index].imageData = newData
        photos[index].title = newTitle
    }
}


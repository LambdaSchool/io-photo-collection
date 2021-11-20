//
//  File.swift
//  ios-photo-collection
//
//  Created by Lambda_School_Losaner_256 on 1/30/20.
//  Copyright © 2020 Benglobal Creative. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    //create
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    //update -  Add an "Update" method that takes in Photo,Data, and String parameters.
    func updatePhoto(photo: Photo, imageData: Data, imageTitle: String) {
        if let photoList = photos.firstIndex(of: photo) {
            photos[photoList].imageData = imageData
            photos[photoList].title = imageTitle
        }
    }
    
    
}

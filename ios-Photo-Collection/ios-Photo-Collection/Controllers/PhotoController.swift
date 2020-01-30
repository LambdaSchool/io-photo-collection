//
//  PhotoController.swift
//  ios-Photo-Collection
//
//  Created by LambdaSchoolVM_Catalina on 12/12/19.
//  Copyright © 2019 Sal Amer. All rights reserved.
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

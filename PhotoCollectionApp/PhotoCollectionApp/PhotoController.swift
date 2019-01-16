//
//  PhotoController.swift
//  PhotoCollectionApp
//
//  Created by Nelson Gonzalez on 1/16/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
class PhotoController {
   private(set) var photos: [Photo] = []
    
    
    func createPhotos(with data: Data, and title: String) {
        let photo = Photo(imageData: data, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, string: String){
        
    }
}

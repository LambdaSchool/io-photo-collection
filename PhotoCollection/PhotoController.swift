//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Osha Washington on 12/12/19.
//  Copyright © 2019 Osha Washington. All rights reserved.
//

import Foundation

class PhotoController {
    
   var photos: [Photo] = []

   func createPhoto(data: Data, title: String) {
       let photo = Photo(imageData: data, title: title)

       photos.append(photo)
   }

   func updatePhoto(photo: Photo, data: Data, title: String) {
       guard let index = photos.firstIndex(of: photo) else { return }
       photos[index] = photo
       
   }
}



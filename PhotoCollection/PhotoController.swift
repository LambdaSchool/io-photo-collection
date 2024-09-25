//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Sezen Bozdogan on 14.11.19.
//  Copyright © 2019 Özgün Yildiz. All rights reserved.
//

import UIKit


/*  2. Create a class `PhotoController`.
    3. Add a `photos` varable of type `[Photo]`, and set its initial value to an empty array.*/

class PhotoController {
    var photos: [Photo] = []
    
// 4. Add a "Create" method that initializes a new instance of `Photo` and appends it to the `photos` array.
    
func create(imageData: Data, title: String) -> Photo {
    
    let photo = Photo(imageData: imageData, title: title)
  
    photos.append(photo)
    
    return photo

}
// 5. Add an "Update" method that takes in `Photo`,`Data`, and `String` parameters.
    
    func update(_: Photo, _: Data, _: String) {
        
    }

}

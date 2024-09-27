//
//  File.swift
//  Photo Collection
//
//  Created by Nathan Hedgeman on 5/16/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import Foundation


class PhotoController {
    
    var photos: [Photo] = []

    
//Create And Update Array
    func create(imageData: Data, title: String) {
        
         let newPhoto = Photo(imageData: imageData, title: title)
        
         photos.append(newPhoto)
        
    }
    
    func Update(photo: Photo, imageData: Data, title: String) {
        
        guard let index = photos.firstIndex(of: photo ) else { return }
        photos[index].imageData = imageData
        photos[index].title     = title
        
        
    }
}

//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Angel Buenrostro on 1/16/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos : [Photo] = []
    
    func Create(imageData : Data, title : String) {
        let newPhoto = Photo(imageData: imageData, title: title)
        photos.append(newPhoto)
    }
    
    func Update(photo : Photo, data : Data, string : String){
        var index = 0
        while index < photos.count{
            if photos[index] == photo {
                photos[index].imageData = data
                photos[index].title     = string
            }
            index += 1
        }
    }
}

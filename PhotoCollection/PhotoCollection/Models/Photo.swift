//
//  Photo.swift
//  PhotoCollection
//
//  Created by Jessie Ann Griffin on 8/14/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    var imageData: Data
    var title: String
    
    init(imageData: Data, title: String) {
        self.title = title
        self.imageData = imageData
    }
    
}

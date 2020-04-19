//
//  Photo.swift
//  Photo Collection
//
//  Created by Isaac Lyons on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Photo: Equatable, Codable {
    var imageData: Data
    var title: String
}

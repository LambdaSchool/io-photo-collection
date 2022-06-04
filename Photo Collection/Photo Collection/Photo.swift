//
//  Photo.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 6/1/22.
//

import Foundation

struct Photo: Codable, Equatable {
    var title: String
    var imageData: Data
}

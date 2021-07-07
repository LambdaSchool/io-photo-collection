//
//  Photo.swift
//  Photo Collection
//
//  Created by Simon Elhoej Steinmejer on 02/08/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import Foundation

struct Photo: Equatable, Codable
{
    var imageData: Data
    var title: String
}

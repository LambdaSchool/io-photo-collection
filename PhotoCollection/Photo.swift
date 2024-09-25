//
//  Photo.swift
//  PhotoCollection
//
//  Created by Sezen Bozdogan on 14.11.19.
//  Copyright © 2019 Özgün Yildiz. All rights reserved.
//

import Foundation

/*  2. Create a struct `Photo` in it with the following properties:
    - An `imageData: Data` variable.
    - A `title: String` variable.
    3. Adopt the `Equatable Protocol.
*/

struct Photo: Equatable{
    let imageData: Data
    let title: String
}

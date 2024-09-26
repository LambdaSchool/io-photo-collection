//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Fabiola S on 8/15/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photosImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let addedPhoto = photo else { return }
        photosImageView.image = UIImage(data: addedPhoto.imageData)
        photoLabel.text = addedPhoto.title
    }
    
    
}

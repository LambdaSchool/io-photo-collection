//
//  PhotosCollectionViewCell.swift
//  ios-photo-collection
//
//  Created by Conner on 8/2/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        photoTextLabel.text = photo.title
    }
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var photoTextLabel: UILabel!
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
}

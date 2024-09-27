//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Osha Washington on 12/12/19.
//  Copyright © 2019 Osha Washington. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var photo: Photo? {
    didSet {
    func updateViews() {
        }
    }
    }
    func updateViews() {
        guard let photo = photo else { return }
        textLabel.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
    
    
}

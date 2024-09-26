//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Hayden Hastings on 5/9/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
        guard let photo = photo else { return }
        
        let image = UIImage(data: photo.imageData)
        photoImageView.image = image
        nameLabel.text = photo.title
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
}

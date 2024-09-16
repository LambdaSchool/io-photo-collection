//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Jessie Ann Griffin on 8/15/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let photo = photo else { return }
        
        textLabel.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
}

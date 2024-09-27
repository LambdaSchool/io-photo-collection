//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Jason Modisett on 9/7/18.
//  Copyright © 2018 Jason Modisett. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private func updateViews() {
        guard let photo = photo,
              let image = UIImage(data: photo.imageData) else { return }
        
        imageView.image = image
        titleLabel.text = photo.title
    }
    
    var photo: Photo? { didSet { updateViews() }}
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
}

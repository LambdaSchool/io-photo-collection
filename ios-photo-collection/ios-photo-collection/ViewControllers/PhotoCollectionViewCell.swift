//
//  PhotoCollectionViewCell.swift
//  ios-photo-collection
//
//  Created by De MicheliStefano on 02.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Methods
    
    private func updateViews() {
        guard let photo = photo else { return }
        imageView?.image = UIImage(data: photo.imageData)
        textLabel?.text = photo.title
    }
    
    
    // MARK: - Properties
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
}

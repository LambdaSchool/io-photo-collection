//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 6/1/22.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
//MARK: - Properties
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
//MARK: - Methods
    // Updates the views
    func updateViews() {
        guard let photo = photo else { return }
        titleLabel.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
    
//MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
}

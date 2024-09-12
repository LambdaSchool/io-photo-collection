//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Ufuk Türközü on 14.11.19.
//  Copyright © 2019 Ufuk Türközü. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    let photoController = PhotoController()
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    func updateViews() {
         
         guard let photo = photo else { return }
                photoLabel.text = photo.title
         //       photoImageView.image = photo.imageData
         
     }

}

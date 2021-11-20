//
//  PhotosCollectionViewCell.swift
//  ios-photo-collection
//
//  Created by Lambda_School_Losaner_256 on 1/30/20.
//  Copyright © 2020 Benglobal Creative. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {var photo: Photo? {
            didSet {
                updateViews()
            }
        }
        
        func updateViews() {
            guard let photo = photo else { return }
            imageView.image = UIImage(data: photo.imageData)
            imageLbl.text = photo.title
            
        }
        
        // IB Outlets
        
        @IBOutlet weak var imageView: UIImageView!
        @IBOutlet weak var imageLbl: UILabel!
        
        
    }

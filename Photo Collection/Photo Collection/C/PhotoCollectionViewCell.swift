//
//  PhotoCollectionViewCell.swift
//  Photo Collection
//
//  Created by Nathan Hedgeman on 5/16/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        
        didSet {
            
            updateViews()
            
        }
        
    }
    
    func updateViews() {
        
        
        
    }
    
    
}

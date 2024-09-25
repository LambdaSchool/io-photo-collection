//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Sezen Bozdogan on 14.11.19.
//  Copyright © 2019 Özgün Yildiz. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo?
    
    var photoController = PhotoController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelView: UILabel!
    
    func updateViews() {
        
        guard let photo = photo else { return }
        labelView.text = photo.title
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of items
         return photoController.photos.count
     }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell()
        }
        let photo = photoController.photos[indexPath.row]
        cell.photo = photo
        return cell
    }
}

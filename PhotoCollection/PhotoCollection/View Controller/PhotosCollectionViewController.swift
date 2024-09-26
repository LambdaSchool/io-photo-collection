//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Hayden Hastings on 5/9/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "PhotoCell":
            guard let toPhotoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            toPhotoDetailVC.photoController = photoController
            toPhotoDetailVC.themeHelper = themeHelper
            
            guard let photoIndex = collectionView?.indexPathsForSelectedItems?.first?.item else { return }
            let photo = photoController.photos[photoIndex]
            toPhotoDetailVC.photo = photo
            
        case "AddPhotoSegue":
            guard let addPhotoVC = segue.destination as? PhotoDetailViewController else { return }
            addPhotoVC.photoController = photoController
            addPhotoVC.themeHelper = themeHelper
            
        case "ToThemeSelection":
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            themeVC.themeHelper = themeHelper
        default:
            break
        }
    }
    

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        let photo = photoController.photos[indexPath.item]
        let image = UIImage(data: photo.imageData)
        
        cell.nameLabel.text = photo.title
        cell.photoImageView.image = image
    
        return cell
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePrefrence else { return }
        
        if theme == "Dark" {
            view.backgroundColor = .darkGray
        } else if theme == "Cyan" {
            view.backgroundColor = .cyan
        }
    }

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
}

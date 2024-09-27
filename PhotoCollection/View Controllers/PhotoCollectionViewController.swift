//
//  PhotoCollectionViewController.swift
//  PhotoCollection
//
//  Created by Osha Washington on 12/12/19.
//  Copyright © 2019 Osha Washington. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
                collectionView.reloadData()
                setTheme()
    }
    
    
    
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell()}
    
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }
    func setTheme() {
        guard let themePreference = themeHelper.themePreferenceKey else { return }
        switch themePreference {
        case ThemeHelper.PropertyKeys.dark:
            collectionView.backgroundColor = .darkGray
        case ThemeHelper.PropertyKeys.red:
           view.backgroundColor = .red
        default:
           view.backgroundColor = .white
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (segue.identifier == "CollectionAddButtonSegue") {
        if let addPhotoVC = segue.destination as? PhotoDetailViewController {
            addPhotoVC.themeHelper = self.themeHelper
            addPhotoVC.photoController = self.photoController
        }

    } else if (segue.identifier == "CollectionViewCellSegue") {
        guard let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
        if let detailPhotoVC = segue.destination as? PhotoDetailViewController {
            detailPhotoVC.themeHelper = self.themeHelper
            detailPhotoVC.photoController = self.photoController
            detailPhotoVC.photo = self.photoController.photos[indexPath.item]
        }

    } else if (segue.identifier == "ModalSelectThemeSegue") {
        if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
            themeSelectionVC.themeHelper = self.themeHelper
            themeSelectionVC.modalPresentationStyle = .fullScreen
        }
    }
    }
    

}

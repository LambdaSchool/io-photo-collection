//
//  PhotosCollectionViewController.swift
//  ios-photo-collection
//
//  Created by De MicheliStefano on 02.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        photoController.loadFromPersistentStore()
        collectionView.reloadData()
        setTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Methods
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        if themePreference == "Dark" {
            collectionView.backgroundColor = UIColor.lightGray
        } else {
            collectionView.backgroundColor = UIColor.blue
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowAddPhotoDetail" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            photoDetailVC.photoController = photoController
            photoDetailVC.themeHelper = themeHelper
            
        } else if segue.identifier == "ShowPhotoDetail" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
            photoDetailVC.photoController = photoController
            photoDetailVC.photo = photoController.photos[indexPath.item]
            photoDetailVC.themeHelper = themeHelper
            
        } else if segue.identifier == "ShowThemeSettingsModal" {
            guard let themeSettingsVC = segue.destination as? ThemeSelectionViewController else { return }
            themeSettingsVC.themeHelper = themeHelper
            
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
    
        guard let photoCell = cell as? PhotoCollectionViewCell else { return cell }
        let photo = photoController.photos[indexPath.item]
        photoCell.photo = photo
    
        return cell
    }
    
    // MARK: - Properties
    
    var photoController = PhotoController()
    var themeHelper = ThemeHelper()
    
}

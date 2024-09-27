//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Jason Modisett on 9/7/18.
//  Copyright © 2018 Jason Modisett. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
        setTheme()
    }
    
    private func setTheme() {
        guard let pref = themeHelper.themePreference else { return }
        collectionView?.backgroundColor = pref == "dark" ? UIColor.darkGray : .white
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowPhoto" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController,
                  let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
            destinationVC.photo = photoController.photos[indexPath.item]
        } else if segue.identifier == "AddPhoto" {
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
        } else if segue.identifier == "SelectTheme" {
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else { return }
            destinationVC.themeHelper = themeHelper
        }
        
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    
        cell.photo = photoController.photos[indexPath.item]
        
        return cell
    }
    
    // Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

}

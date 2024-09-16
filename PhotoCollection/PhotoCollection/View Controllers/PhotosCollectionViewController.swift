//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Jessie Ann Griffin on 8/15/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as?
            PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "createPhotoSegue" {
            
            if let createPhotoVC = segue.destination as? PhotoDetailViewController {
                createPhotoVC.photoController = photoController
                createPhotoVC.themeHelper = themeHelper
            }
        } else if segue.identifier == "showPhotoDetailSegue" {
        
            if let photoDetailVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first {
                
                photoDetailVC.photo = photoController.photos[indexPath.item]
                photoDetailVC.photoController = photoController
                photoDetailVC.themeHelper = themeHelper
            }
        } else if segue.identifier == "selectThemeModalSegue" {
            
            if let selectThemeVC = segue.destination as? ThemeSelectionViewController {
                selectThemeVC.themeHelper = themeHelper
            }
        }
        
//        switch segue.identifier {
//        case "createPhotoSegue":
//            if let createPhotoVC = segue.destination as? PhotoDetailViewController {
//                photoController.self
//                createPhotoVC.delegate = self
//            }
//        case "showPhotoDetailSegue":
//            if let photoDetailVC = segue.destination as? PhotoDetailViewController,
//                let indexPath = collectionView.indexPathsForSelectedItems?.first {
//
//                //photoDetailVC.view.backgroundColor = themeHelper.themePreferenceKey
//                photoDetailVC.photo = photoController.photos[indexPath.row]
//            }
//        case "selectThemeModalSegue":
//            if let selectThemeVC = segue.destination as? ThemeSelectionViewController {
//
//        }
//        default:
//            print()
//        }
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        
        if theme == "Dark" {
            collectionView.backgroundColor = .lightGray
        } else if theme == "Sapphire" {
            collectionView.backgroundColor = .cyan
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

//extension PhotosCollectionViewController: CreatePhotoDelegate {
//    // MARK: Step 6 - Write/Implement the function
//    func photoWasCreated(_ photo: Photo) {
//        photoController.photos.append(photo)
//        dismiss(animated: true, completion: nil)
//        collectionView.reloadData()
//    }
//}

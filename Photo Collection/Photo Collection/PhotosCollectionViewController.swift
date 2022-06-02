//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 6/1/22.
//

import UIKit

private let photoCellIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
//MARK: - Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

//MARK: - Methods
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // Implementing the user's selected theme
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        if themePreference == "Dark" {
            view.backgroundColor = .black
        } else if themePreference == "Green" {
            view.backgroundColor = .systemGreen
        }
    }
    
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               if segue.identifier == "SelectThemeSegue" {
                   let themeVC = segue.destination as! ThemeSelectionViewController
                   themeVC.themeHelper = themeHelper
        } else if segue.identifier == "AddPhotoSegue" {
            let newPhotoVC = segue.destination as! PhotoDetailViewController
            newPhotoVC.themeHelper = themeHelper
            newPhotoVC.photoController = photoController
        } else if segue.identifier == "PhotoDetailSegue" {
            let selectedCellIndex = collectionView.indexPathsForSelectedItems!.first!
            let selectedPhoto = photoController.photos[selectedCellIndex.row]
            let detailVC = segue.destination as! PhotoDetailViewController
            detailVC.themeHelper = themeHelper
            detailVC.photoController = photoController
            detailVC.photo = selectedPhoto
        }
    }

//MARK: - UICollectionView DataSource and Delegate
    // number of cells in each section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    // Populating the Collection view cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellIdentifier, for: indexPath) as! PhotosCollectionViewCell
        let selectedPhoto = photoController.photos[indexPath.row]
        cell.photo = selectedPhoto
        return cell
    }

}

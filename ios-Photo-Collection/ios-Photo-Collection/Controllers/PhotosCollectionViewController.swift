//
//  PhotosCollectionViewController.swift
//  ios-Photo-Collection
//
//  Created by LambdaSchoolVM_Catalina on 12/12/19.
//  Copyright © 2019 Sal Amer. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoSegue" {
            if let addPhotoVC = segue.destination as? PhotoDetailViewController {
                addPhotoVC.themeHelper = self.themeHelper
                addPhotoVC.photoController = self.photoController
            }
        } else if segue.identifier == "showPhotoDetail" {
            guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            if let detailPhotoVC = segue.destination as? PhotoDetailViewController {
                detailPhotoVC.themeHelper = self.themeHelper
                detailPhotoVC.photoController = self.photoController
                detailPhotoVC.photo = self.photoController.photos[indexPath.item]
            }
        } else if segue.identifier == "ThemeSelectionSegue" {
            if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
                themeSelectionVC.themeHelper = self.themeHelper
                themeSelectionVC.modalPresentationStyle = .overCurrentContext
            }
        }

//        if segue.identifier == "themeHelper" {
//            if let ThemeHelperVC = segue.destination as? ThemeSelectionViewController {
//                ThemeHelperVC.delegate = self
//            }
//        }
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return photoController.photos.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell()}
        
        let photo = photoController.photos[indexPath.item]
        cell.imageView.image = UIImage(data: photo.imageData)
        cell.imageLbl.text = photo.title
        return cell
    }

    func setTheme() {
//        guard let themeHelper = themeHelper else { return }
        if let themePreference = themeHelper.themePreference {
            if (themePreference == "Dark") {
                collectionView.backgroundColor = UIColor.gray
//                Cview.backgroundColor = UIColor.darkGray
            } else if (themePreference == "Red") {
//                view.backgroundColor = UIColor.red
                collectionView.backgroundColor = UIColor.red
            }
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

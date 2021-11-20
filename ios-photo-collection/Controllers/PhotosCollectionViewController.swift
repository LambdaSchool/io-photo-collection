//
//  PhotosCollectionViewController.swift
//  ios-photo-collection
//
//  Created by Lambda_School_Losaner_256 on 1/30/20.
//  Copyright © 2020 Benglobal Creative. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
    }
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhoto" {
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

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell()}
        
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

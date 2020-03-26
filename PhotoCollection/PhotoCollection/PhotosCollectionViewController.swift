//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Nihal Erdal on 3/24/20.
//  Copyright © 2020 Nihal Erdal. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

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

    @IBAction func selectTheme(_ sender: Any) {
    }
    
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPhotoSegue" {
            guard let detailVC = segue.destination as? PhotoDetailViewController else {return}
            detailVC.themeHelper = themeHelper
            detailVC.photoController = photoController
            
        } else if segue.identifier == "UpdatePhotoSegue"{
            
            guard let detailVC = segue.destination as? PhotoDetailViewController,
                let cell = sender as? PhotosCollectionViewCell,
                let indexPath = collectionView.indexPath(for: cell) else {return}
            
            
            detailVC.photo = photoController.photos[indexPath.row]
            detailVC.themeHelper = themeHelper
            detailVC.photoController = photoController
        
            
        }else {
            guard let themeVC = segue.destination as? ThemeSelectionViewController else {return}
            
            themeVC.themeHelper = themeHelper
            
        }
    }
   

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {fatalError("Cell is not a PhotosCollectionViewCell")}
    
        let photo = photoController.photos[indexPath.row]
        
        cell.photo = photo
    
        return cell
    }
    
    func setTheme(){
        
        let themePreference = themeHelper.themePreferenceKey
        
        if themePreference == "Dark" {
            collectionView.backgroundColor = .darkGray
        }else{
            collectionView.backgroundColor = .blue
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

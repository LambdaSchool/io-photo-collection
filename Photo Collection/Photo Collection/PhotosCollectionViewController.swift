//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Mark Gerrior on 2/27/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController, PresentModallyDelegate {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
// TODO:        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTheme()
    }

    func setTheme() {
        var color: UIColor?
        
        switch themeHelper.themePreference {
        case "Dark":
            color = .darkGray
        case "Blue":
            color = .blue
        default:
            return
        }
        
        // TODO: Why is there view and collectionView? Can you have both at the same time?
        self.collectionView.backgroundColor = color
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "ThemeSelectionSegue" {

            guard let themeSelectionVC = segue.destination as? ThemeSelectionViewController else {return}
            themeSelectionVC.themeHelper = themeHelper
            themeSelectionVC.delegate = self

        } else if segue.identifier == "AddSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else {return}

            photoDetailVC.themeHelper = themeHelper
            photoDetailVC.photoController = photoController
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { fatalError("PhotosCollectionViewCell was expected" ) }
    
        // Configure the cell
        cell.photo = photoController.photos[indexPath.item] // same as .row

        return cell
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

    // TODO: viewWillAppear does not work with modal dialogs.
    // https://stackoverflow.com/questions/56568967/detecting-sheet-was-dismissed-on-ios-13x
    func modalDismiss() {
        setTheme()
    }
}

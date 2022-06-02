//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 6/1/22.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
//MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
//MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
//MARK: - IBActions
    // Add photo button action
    @IBAction func addPhotoButtonTapped(_ sender: UIButton) {
    }
    // Save bar button action
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
    }
    
}

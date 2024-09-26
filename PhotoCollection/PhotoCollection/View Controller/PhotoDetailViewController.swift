//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Hayden Hastings on 5/9/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        setTheme()
        
        guard let photo = photo else { return }
        let image = UIImage(data: photo.imageData)
        photoImageView.image = image
    }

    func setTheme() {
        guard let theme = themeHelper?.themePrefrence else { return }
        
        if theme == "Dark" {
            view.backgroundColor = .darkGray
        } else if theme == "Cyan" {
            view.backgroundColor = .cyan
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let photo = photo,
            let image = UIImage(data: photo.imageData),
            let photoImage = photoImageView.image,
            let name = nameTextField.text else { return }
        
        photoController?.createPhoto(for: photoImage, title: name)
    }
    
    @IBAction func addPhotoButtonTapped(_ sender: Any) {
        
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

}

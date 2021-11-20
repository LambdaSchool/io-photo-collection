//
//  PhotoDetailViewController.swift
//  ios-photo-collection
//
//  Created by Lambda_School_Losaner_256 on 1/30/20.
//  Copyright © 2020 Benglobal Creative. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController {
    
    
    //IB Outlets
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var imageTitleField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
       func setTheme() {
            guard let themeHelper = themeHelper else { return }
            if let themePreference = themeHelper.themePreference {
                if themePreference == "Dark" {
                    view.backgroundColor = UIColor.darkGray
                } else if themePreference == "Red" {
                    view.backgroundColor = UIColor.red
                }
            }
        }
        
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        imageOutlet.image = UIImage(data: photo.imageData)
        imageTitleField.text = photo.title
    }


    
    //IB Actions
    @IBAction func addPhotoButtonWasPressed(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        let authStatus = PHPhotoLibrary.authorizationStatus()
        switch authStatus {
        case .authorized:
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        case .denied:
            print("Go away")
        case .notDetermined:
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        default:
            break
        }
        

//
        
    }
    
    @IBAction func savePhotoButtonWasPressed(_ sender: UIBarButtonItem) {
        guard let photoController = photoController,
        let image = imageOutlet.image,
            let imageTitle = imageTitleField.text,
            let imageData = image.pngData(),
            !imageTitle.isEmpty else { return }
        
        if let photo = photo {
            photoController.updatePhoto(photo: photo, imageData: imageData, imageTitle: imageTitle)
        } else {
            photoController.createPhoto(imageData: imageData, title: imageTitle)
        }
        self.navigationController?.popViewController(animated: true)
    }

}
// delegate for photoPicker
extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageOutlet.image = image
        
    }
}

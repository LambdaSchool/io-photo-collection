//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Jason Modisett on 9/7/18.
//  Copyright © 2018 Jason Modisett. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func setTheme() {
        guard let pref = themeHelper?.themePreference else { return }
        view.backgroundColor = pref == "dark" ? UIColor.darkGray : .white
        photoTitleTextField.textColor = pref == "dark" ? .white : .darkGray
    }
    
    private func updateViews() {
        setTheme()
        
        if let photo = photo {
            photoTitleTextField.text = photo.title
            
            guard let photoImage = UIImage(data: photo.imageData) else { return }
            photoImageView.image = photoImage
        }
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let photoController = photoController else { return }
        
        guard let photoTitle = photoTitleTextField.text,
            let image = photoImageView.image,
            let imgData = UIImagePNGRepresentation(image) else { return }
        
        guard let photo = photo else {
            photoController.createPhoto(with: imgData, title: photoTitle)
            
            navigationController?.popViewController(animated: true)
            
            return
        }
        
        photoController.update(photo: photo, imageData: imgData, title: photoTitle)
        
        navigationController?.popViewController(animated: true)
    }
    
    private func presentImagePickerController() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        } else { return }
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        if authorizationStatus == .authorized {
            presentImagePickerController()
        } else if authorizationStatus == .notDetermined {
            PHPhotoLibrary.requestAuthorization { (authorizationStatus) in
                if authorizationStatus == .authorized {
                    self.presentImagePickerController()
                }
            }
        } else if authorizationStatus == .denied {
            let alert = UIAlertController(title: "Photo Collection can't access your photo library", message: "Please allow photo library access to be able to add photos to your photo collection.", preferredStyle: .alert)
            
            let goToAction = UIAlertAction(title: "Show Settings", style: .default) { (action) in
                if let url = URL(string: "app-settings:") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in }
            
            alert.addAction(goToAction)
            alert.addAction(cancel)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        photoImageView.image = image
    }
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var photoTitleTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
}

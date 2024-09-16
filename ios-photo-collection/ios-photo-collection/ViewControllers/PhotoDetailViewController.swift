//
//  PhotoDetailViewController.swift
//  ios-photo-collection
//
//  Created by De MicheliStefano on 02.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    

    // MARK: - Methods
    
    @IBAction func addPhoto(_ sender: Any) {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        if authorizationStatus == .authorized {
            presentImagePicker()
        } else {
            PHPhotoLibrary.requestAuthorization() { (handler) in
                if handler == .authorized {
                    self.presentImagePicker()
                }
            }
        }
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let imageData = imageView?.image?.pngData(),
            let title = titleTextField?.text else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, imageData: imageData, title: title)
        } else {
            photoController?.create(imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    private func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        if themePreference == "Dark" {
            self.view.backgroundColor = UIColor.lightGray
        } else {
            self.view.backgroundColor = UIColor.blue
        }
    }
    
    private func presentImagePicker() {
        let picker = UIImagePickerController()
        picker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            present(picker, animated: true, completion: nil)
        }
    }
    
    private func updateViews() {
        guard let photo = photo else {
            self.title = "Create Photo"
            return
        }
        
        self.title = "Update Photo"
        imageView.image = UIImage(data: photo.imageData)
        titleTextField.text = photo.title
    }
    
    
    // MARK: ImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView.image = image
    }
    
    // MARK: - Properties
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
}

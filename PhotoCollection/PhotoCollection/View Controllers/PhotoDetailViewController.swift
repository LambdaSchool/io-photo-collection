//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Jessie Ann Griffin on 8/14/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit
import Photos

protocol CreatePhotoDelegate {
    func photoWasCreated(_ photo: Photo)
}

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var detailTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    var delegate: CreatePhotoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        if photo != nil {
            updateViews()
        } else {
            guard let image = photoImageView.image,
                let detailText = detailTextField.text,
                !detailText.isEmpty else { return }
            
            guard let photoData = image.pngData() else { return } //jpegData(image, 1.0)
            photoController?.createPhoto(data: photoData, title: detailText)
        }
//
//
//
//        if
        //var photo = Photo(imageData: Data(photoImage), title: detailText)
        //delegate?.photoWasCreated(photo)
        self.navigationController?.popViewController(animated: true)
    }
    
    func setTheme() {
        guard let themeHelp = themeHelper else { return }
        guard let theme = themeHelp.themePreference else { return }
        
        if theme == "Dark" {
            view.backgroundColor = .lightGray
        } else if theme == "Sapphire" {
            view.backgroundColor = .cyan
        }
    }
    
    private func updateViews() {
        setTheme()
        
        guard let photo = photo else { return }
        
        photoImageView.image = UIImage(data: photo.imageData)
        detailTextField.text = photo.title
    }
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func addPhoto(_ sender: UIButton) {
        let status = PHPhotoLibrary.authorizationStatus()
        if status == PHAuthorizationStatus.authorized {
            PHPhotoLibrary.requestAuthorization({ (newStatus) in })
        } else {
            PHPhotoLibrary.requestAuthorization({ (newStatus) in })
        }
        let photo = UIImagePickerController()
        photo.delegate = self
        photo.sourceType = UIImagePickerController.SourceType.photoLibrary
        photo.allowsEditing = true
        self.present(photo, animated: true) {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImageView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
}

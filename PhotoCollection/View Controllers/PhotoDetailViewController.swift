//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Osha Washington on 12/12/19.
//  Copyright © 2019 Osha Washington. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UICollectionViewDelegateFlowLayout {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    //MARK: - IBOutlets
    @IBOutlet weak var addPhotoImageView: UIImageView!
    @IBOutlet weak var addTitleTextField: UITextField!
    
    //MARK: - IBAction
    @IBAction func addPhoto(_ sender: UIButton) {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate & UICollectionViewDelegateFlowLayout

    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alertController.addAction(cancelAlert)

    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default, handler: {
            (_) in imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        })
        alertController.addAction(photoLibrary)
    }
    present(alertController,animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
    guard let title = addTitleTextField.text, let data = addPhotoImageView.image?.pngData() else { return }
        if let photo = photo {
            photoController?.updatePhoto(photo: photo, data: data, title: title)
        } else {
            photoController?.createPhoto(data: data, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func setTheme() {
               guard let themePreference = themeHelper?.themePreferenceKey else { return }
               switch themePreference {
               case ThemeHelper.PropertyKeys.dark:
                   view.backgroundColor = .darkGray
               case ThemeHelper.PropertyKeys.red:
                   view.backgroundColor = .red
               default:
                   view.backgroundColor = .white
               }
           }
    
    func updateViews() {
        setTheme()
        guard let imageData = photo?.imageData else { return }

        addPhotoImageView.image = UIImage(data: imageData)
        addTitleTextField.text = photo?.title
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage, let _ = image.pngData() else { return }

        addPhotoImageView.image = image

        dismiss(animated: true, completion: self.updateViews)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}



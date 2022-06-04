//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 6/1/22.
//

import UIKit
import Photos
import PhotosUI

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
//MARK: - Properties
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    var photo: Photo?
    
//MARK: - Methods
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        setTheme()
    }
    // Handles updating views
    func updateViews() {
        guard let photo = photo else { return }
        titleTextField.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
    // Applying the user's selected theme
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        if themePreference == "Dark" {
            view.backgroundColor = .darkGray
        } else if themePreference == "Green" {
            view.backgroundColor = .systemGreen
        }
    }
    
//MARK: - Image Picker
    // Presents an Image Picker Controller
    private func presentImagePickerController() {

        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("ERROR: The photo library is not available")
            return
        }
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)

    }
    // image was chosen from image picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        imageView.image = image
        picker.dismiss(animated: true)
    }
    
//MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
//MARK: - IBActions
    // Add photo button action
    @IBAction func addPhotoButtonTapped(_ sender: UIButton) {
        presentPhotoPicker()
    }
    // Save bar button action
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard !titleTextField.text!.isEmpty,
              let imageData = imageView.image?.pngData() else { return }
        if var photo = photo {
            photoController?.updatePhoto(photo: &photo, newTitle: titleTextField.text!, newImageData: imageData)
        } else {
            photoController?.newPhoto(title: titleTextField.text!, data: imageData)
        }
        navigationController?.popViewController(animated: true)
    }
    
}

extension PhotoDetailViewController: PHPickerViewControllerDelegate {
    // Presents new Photo Picker
    func presentPhotoPicker() {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 2
        config.filter = PHPickerFilter.images
        let photoPickerVC = PHPickerViewController(configuration: config)
        photoPickerVC.delegate = self
        present(photoPickerVC, animated: true)
    }
    // Image was chose from the photo picker
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { reading, error in
                guard let image = reading as? UIImage, error == nil else { return }
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
    }
}

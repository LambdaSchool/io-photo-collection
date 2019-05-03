//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Victor  on 5/2/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation
import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var textFeild: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        //research
        imagePicker.allowsEditing = false
        //library
        imagePicker.sourceType = .photoLibrary
        
        //
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //getting user input and converting to ui image
        guard let original = info[.originalImage] as? UIImage else { return }
        //imageView.contentMode = .scaleAspectFit
        imageView.image = original
        
        //library view will disappear
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let title = textFeild.text, let image = imageView.image, let data = image.pngData() else {
            //pop out
            return
        }
        
        
        if let photoObject = photo {
            photoController?.update(photo: photoObject, imageData: data, title: title)
        } else {
            photoController?.create(imageData: data, title: title)
        }
        
        
        //taking us back to the home page
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
}

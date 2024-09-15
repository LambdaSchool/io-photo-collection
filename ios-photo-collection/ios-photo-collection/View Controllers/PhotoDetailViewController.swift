import UIKit
import PhotosUI

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func presentImagePickerController() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let authStatus = PHPhotoLibrary.authorizationStatus()
        if authStatus == .authorized {
            presentImagePickerController()
        } else if authStatus == .notDetermined {
            PHPhotoLibrary.requestAuthorization { (status) in
                guard status == .authorized else {
                    self.presentImagePickerController()
                    return
                }
            }
        }
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        if let photo = photo {
            photoController?.updatePhoto(photo: photo, title: photo.title, imageData: photo.imageData)
            navigationController?.popViewController(animated: true)
        } else {
            guard let title = textField.text,
                let imageData = imageView.image?.pngData() else { return }
            photoController?.createPhoto(title: title, imageData: imageData)
            navigationController?.popViewController(animated: true)
        }
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        if themePreference == "Dark" {
            view.backgroundColor = UIColor.lightGray
        } else if themePreference == "Red" {
            view.backgroundColor = UIColor(hue: 0.0139, saturation: 0.67, brightness: 0.95, alpha: 1)
        }
    }
    
    func updateViews() {
        setTheme()
        if let photo = photo {
            textField.text = photo.title
            imageView.image = UIImage(data: photo.imageData)
        }
    }
    
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
}

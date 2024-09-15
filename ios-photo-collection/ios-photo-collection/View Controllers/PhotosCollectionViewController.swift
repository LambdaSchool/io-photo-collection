import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
//        setTheme()
        super.viewDidLoad()
        collectionView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTheme()
        super.viewWillAppear(animated)
        collectionView.reloadData()
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosCollectionViewCell
        let photo = photoController.photos[indexPath.row]

        cell.imageView.image = UIImage(data: photo.imageData)
        cell.photoTextLabel.text = photo.title

        return cell
    }

    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        if themePreference == "Dark" {
            collectionView.backgroundColor = UIColor.lightGray
        } else if themePreference == "Red" {
            collectionView.backgroundColor = UIColor(hue: 0.0139, saturation: 0.67, brightness: 0.95, alpha: 1)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "AddPhoto") {
            if let vc = segue.destination as? PhotoDetailViewController {
                vc.photoController = photoController
                vc.themeHelper = themeHelper
            }
        } else if (segue.identifier == "ShowExistingPhoto") {
            if let vc = segue.destination as? PhotoDetailViewController {
                vc.photoController = photoController
                vc.themeHelper = themeHelper
                if let index = self.collectionView?.indexPathsForSelectedItems?.first {
                    vc.photo = photoController.photos[index[0]]
                }
            }
        } else if (segue.identifier == "SelectTheme") {
            if let vc = segue.destination as? ThemeSelectionViewController {
                vc.themeHelper = themeHelper
            }
        }
    }

    let photoController: PhotoController = PhotoController()
    let themeHelper = ThemeHelper(themePreferenceKey: "Dark")
}

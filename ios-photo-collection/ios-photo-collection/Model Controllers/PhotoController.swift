import Foundation

class PhotoController {
    func createPhoto(title: String, imageData: Data) {
        photos.append(Photo(imageData: imageData, title: title))
    }
    
    func updatePhoto(photo: Photo, title: String, imageData: Data) {
        if let index = photos.index(of: photo) {
            var scratch = photo
            scratch.imageData = imageData
            scratch.title = title
            
            photos.remove(at: index)
            photos.insert(scratch, at: index)
        }
    }
    
    var photos: [Photo] = []
}

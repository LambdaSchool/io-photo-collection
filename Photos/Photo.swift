import UIKit

struct Photo: Equatable {
    
    init(imageData: Data, title: String) {
        self.imageData = imageData
        self.title = title
    }
    var imageData: Data
    var title: String
}

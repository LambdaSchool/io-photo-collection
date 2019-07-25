//
//  PhotoDetailViewController.swift
//  Photo Collection  PhotoCollection
//
//  Created by Andrew Ruiz on 7/25/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var photoDetailView: UIImageView!
    @IBOutlet weak var detailTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    
    @IBAction func savePhoto(_ sender: Any) {
    }
    
}

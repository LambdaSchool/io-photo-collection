//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Nathan Hedgeman on 5/17/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    
    var photoController: PhotoController?
    var photo          : Photo?
    var themeHelper    : ThemeHelper?

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var TitleTextField: UITextField!
    
    
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
    @IBAction func AddPhotoButtonTapped(_ sender: Any) {
    }
    
    @IBAction func SaveButtonTapped(_ sender: Any) {
    }
    
        
   
    
}

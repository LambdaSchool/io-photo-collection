//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Sezen Bozdogan on 14.11.19.
//  Copyright © 2019 Özgün Yildiz. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
            
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var tetField: UITextField!
    
    
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    
    @IBAction func saveePhoto(_ sender: Any) {
    }
    
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

}

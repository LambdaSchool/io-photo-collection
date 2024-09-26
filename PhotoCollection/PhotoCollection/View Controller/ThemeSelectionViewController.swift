//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Hayden Hastings on 5/9/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

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
    @IBAction func selectDarkThemeButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectCyanButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToCyan()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
}

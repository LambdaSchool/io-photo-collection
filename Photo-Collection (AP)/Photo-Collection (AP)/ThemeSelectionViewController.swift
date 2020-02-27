//
//  ThemeSelectionViewController.swift
//  Photo-Collection (AP)
//
//  Created by Samuel Esserman on 2/27/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//MARK: - Actions 
    @IBAction func selectDarkTheme(_ sender: Any) {
        if let themeHelper = themeHelper {
            themeHelper.setThemePreferenceToDark()
            dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func selectLightTheme(_ sender: Any) {
        if let themeHelper = themeHelper {
            themeHelper.setThemePreferenceToLight()
            dismiss(animated: true, completion: nil)
        }
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

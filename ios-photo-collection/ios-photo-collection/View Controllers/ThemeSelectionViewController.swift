//
//  ThemeSelectionViewController.swift
//  ios-photo-collection
//
//  Created by Conner on 8/2/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectRedTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToRed()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
}

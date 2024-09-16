//
//  ThemeSelectionViewController.swift
//  ios-photo-collection
//
//  Created by De MicheliStefano on 02.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods

    @IBAction func setBlueTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Properties
    
    var themeHelper: ThemeHelper?
    
}

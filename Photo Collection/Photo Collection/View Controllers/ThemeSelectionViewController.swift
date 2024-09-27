//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Jason Modisett on 9/7/18.
//  Copyright © 2018 Jason Modisett. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    @IBAction func selectDarkTheme(_ sender: Any) {
        guard let themeHelper = themeHelper else { return }
        themeHelper.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectLightTheme(_ sender: Any) {
        guard let themeHelper = themeHelper else { return }
        themeHelper.setThemePreferenceToLight()
        dismiss(animated: true, completion: nil)
    }
    

    var themeHelper: ThemeHelper?

}

//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 6/1/22.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

//MARK: - Properties
    var themeHelper: ThemeHelper?
    
//MARK: - IBActions
    // Dark theme button is tapped
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true)
    }
    // Green theme button is tapped
    @IBAction func selectGreenTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToGreen()
        dismiss(animated: true)
    }
    

}

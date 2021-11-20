//
//  ThemeSelectionViewController.swift
//  ios-photo-collection
//
//  Created by Lambda_School_Losaner_256 on 1/30/20.
//  Copyright © 2020 Benglobal Creative. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?

        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        
     // IB Actions
        
        @IBAction func selectDarkThemeBtnPressed(_ sender: UIButton) {
            themeHelper?.setThemePreferenceToDark()
            dismiss(animated: true, completion: nil)
        }
        @IBAction func selectRedThemeBtnPressed(_ sender: UIButton) {
            themeHelper?.setThemePreferenceToRed()
            dismiss(animated: true, completion: nil)
        }
        
    }

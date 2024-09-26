//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Fabiola S on 8/15/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import Foundation
import UIKit

class ThemeHelper {
    let themePreferenceKey = "ThemePreference"
    
    
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    
    }
    
    func setThemePreferenceToYourColorHere() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Blue", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    
}

//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 6/1/22.
//

import Foundation

class ThemeHelper {
    
//MARK: - Properties
    // Theme key for User Defaults
    let themePreferenceKey = "ThemeKey"
    // Last theme preference set
    var themePreference: String? {
        return UserDefaults.standard.value(forKey: themePreferenceKey) as? String
    }
    
//MARK: - Methods
    // Set dark theme
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    // Set green theme
    func setThemePreferenceToGreen() {
        UserDefaults.standard.set("Green", forKey: themePreferenceKey)
    }
    
    // Init method
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    
}

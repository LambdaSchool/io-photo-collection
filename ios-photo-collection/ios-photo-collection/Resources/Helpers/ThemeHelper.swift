//
//  ThemeHelper.swift
//  ios-photo-collection
//
//  Created by De MicheliStefano on 02.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let userDefaults = UserDefaults.standard
    let themePreferenceKey: String = "themePreferenceKey"
    var themePreference: String? {
        if let themePreference = userDefaults.string(forKey: themePreferenceKey) {
            return themePreference
        } else {
            return nil
        }
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }

    func setThemePreferenceToDark() {
        return userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        return userDefaults.set("Blue", forKey: themePreferenceKey)
    }
    
    
}

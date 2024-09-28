//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Chris Gooley on 8/15/19.
//  Copyright © 2019 Chris Gooley. All rights reserved.
//

import Foundation

class ThemeHelper {

    let themePreferenceKey = "themePreferenceKey"
    
    init(themePreferenceKey: String) {
        if themePreference == "" {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Green", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: themePreferenceKey)
    }
    
}


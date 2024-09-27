//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Jason Modisett on 9/7/18.
//  Copyright © 2018 Jason Modisett. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    init() {
        if themePreference == nil { setThemePreferenceToLight() }
    }
    
    func setThemePreferenceToDark() {
        defaults.set("dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        defaults.set("light", forKey: themePreferenceKey)
    }
    
    let defaults = UserDefaults.standard
    let themePreferenceKey = "themePreferenceKey"
    
    var themePreference: String? {
        return defaults.string(forKey: themePreferenceKey)
    }
    
}

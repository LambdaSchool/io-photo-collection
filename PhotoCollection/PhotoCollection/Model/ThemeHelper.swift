//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Hayden Hastings on 5/9/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    init() {
        if themePrefrence == nil {
            setThemePreferenceToCyan()
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToCyan() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Cyan", forKey: themePreferenceKey)
    }
    
    let themePreferenceKey = ""
    var themePrefrence: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: themePreferenceKey)
    }
}

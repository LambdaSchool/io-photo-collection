//
//  ThemeHelper.swift
//  ios-photo-collection
//
//  Created by Lambda_School_Losaner_256 on 1/30/20.
//  Copyright © 2020 Benglobal Creative. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreference: String? {
        let themePreference = UserDefaults.standard.string(forKey: .themePreferenceKey)
        return themePreference
    }
    
    init() {
        if themePreference == nil {
        setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: .themePreferenceKey )
    }
    
    func setThemePreferenceToRed() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Red", forKey: .themePreferenceKey)
    }
    
}

extension String {
     static var themePreferenceKey = "ThemePreferenceKey"
}


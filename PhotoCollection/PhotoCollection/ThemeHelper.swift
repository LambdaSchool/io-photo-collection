//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Ufuk Türközü on 14.11.19.
//  Copyright © 2019 Ufuk Türközü. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey = "ThemePreference"
    
    init(themePreferenceKey: String) {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: .themePreferenceKey)
        
    }
    
    func setThemePreferenceToYourColorHere() {
        
        UserDefaults.standard.set("Blue", forKey: .themePreferenceKey)
        
    }
    
    var themePreference: String? {
        let shouldShowPluto = UserDefaults.standard.string(forKey: .themePreferenceKey)
        return shouldShowPluto
    }
    
}

extension String {
    static var themePreferenceKey = "ThemePreference"
}

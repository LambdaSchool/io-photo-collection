//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Nathan Hedgeman on 5/16/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    init() {
        if themePreference == nil {
            setThemeLight()
        }else {return}
    }
    
    let themePreferenceKey = "themeKey"
    
    func setThemeDark() {
        
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
        
    }
    
    func setThemeLight() {
        
            UserDefaults.standard.set("Light", forKey: themePreferenceKey)
     
    }
    
    var themePreference: String? {
        
        UserDefaults.standard.string(forKey: themePreferenceKey)
        
        return themePreferenceKey
    }

}

//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by morse on 10/17/19.
//  Copyright © 2019 morse. All rights reserved.
//

import Foundation
class ThemeHelper {
    let themePreferenceKey = ""
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToPurple() {
        UserDefaults.standard.set("Purple", forKey: themePreferenceKey)
    }
}
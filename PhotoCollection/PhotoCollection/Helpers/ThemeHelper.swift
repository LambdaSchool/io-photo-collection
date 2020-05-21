//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Richard Gibbs on 5/21/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import Foundation


class ThemeHelper {
    var themePreferenceKey: String = "Dark"
    
    func setThemePreferenceToDark() {
        let defaults = UserDefaults.standard
        defaults.set("Dark", forKey: themePreferenceKey)
    
    }
}

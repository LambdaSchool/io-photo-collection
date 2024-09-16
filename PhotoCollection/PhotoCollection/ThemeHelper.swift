//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Zack Larsen on 11/14/19.
//  Copyright © 2019 Zack Larsen. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = UserDefaults.standard.array(forKey: .themePreferenceKey)
}

extension String {
    static var themePreferenceKey = "themePreferenceKey"
}

func setThemePreferenceToDark() {
    _ = UserDefaults.standard.setValue("Dark", forKey: .themePreferenceKey)
    
    
}

func setThemePreferenceToYourColorHere() {
    _ = UserDefaults.standard.setValue("Blue", forKey: .themePreferenceKey)
}

var themePreference: String {
    return .themePreferenceKey
}

let themePreference = UserDefaults.standard.float(forKey: .themePreferenceKey)


//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Osha Washington on 12/12/19.
//  Copyright © 2019 Osha Washington. All rights reserved.
//

import Foundation
import UIKit

class ThemeHelper {

    var themePreferenceKey: String? {
        return userDefaults.string(forKey: .themePreference)
    }
    
    init() {
        if themePreferenceKey == nil {
            setThemePreferenceToWhite()
        }
    }
    struct PropertyKeys {
        static let dark = "Dark"
        static let red = "Red"
        static let white = "White"
    }

    let userDefaults = UserDefaults.standard
    
    func setThemePreferenceToDark() {
        userDefaults.set(PropertyKeys.dark, forKey: .themePreference)
    }

    func setThemePreferenceToYourColorHere() {
        userDefaults.set(PropertyKeys.red, forKey: .themePreference)
    }

    func setThemePreferenceToWhite() {
        userDefaults.set(PropertyKeys.white, forKey: .themePreference)
    }
}

extension String {
    static var themePreference = "themePreference"
}

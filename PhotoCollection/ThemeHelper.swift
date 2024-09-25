//
//  ThemeHelper.swift
//  Planets
//
//  Created by Sezen Bozdogan on 14.11.19.
//  Copyright © 2019 Özgün Yildiz. All rights reserved.
//

import UIKit

/*  1. Create a "ThemeHelper.swift" file. Add a `ThemeHelper` class inside of it.
    2. Create a string constant called `themePreferenceKey`. This will be used whenever you need to save the user's theme preference or get it from `UserDefaults`.*/

class ThemeHelper {
    let themePreferenceKey: String
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
    }
    
    /* Create a function called `setThemePreferenceToDark()`. Using the `set` method of `UserDefaults` (remember that in order to access `set`, you have to use the `standard` property on `UserDefaults`), set the string "Dark" as the value, and the `themePreferenceKey` as the key.*/
    
    
    func setThemePreferenceToDark() {
       
        UserDefaults.standard.set("Dark", forKey: .themePreferenceKey)
    }
    
    /* Create another function that does the same thing, but with a different color. Call the function `setThemePreferenceToYourColorHere`.*/
    
    func setThemePreferenceToYourColorHere() {
        
        UserDefaults.standard.set("Orange", forKey: .themePreferenceKey)
    }
    /* Finally, create a computed property called `themePreference` of type `String?`. This should simply return the string value that you stored from either of the two methods you wrote above. Use the `UserDefaults` `string(forKey: ...)` method to get that value. The method should return an optional string because if the user's theme preference hasn't been saved, the value returned from `UserDefaults` will be `nil`.*/
    
    var themePreference: String?
}

extension String {
    static var themePreferenceKey = ""
}

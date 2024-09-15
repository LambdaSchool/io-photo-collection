import Foundation

class ThemeHelper {
    let themePreferenceKey: String
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: themePreferenceKey)
    }
    
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
        
        if (themePreference == nil) {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToRed() {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set("Red", forKey: themePreferenceKey)
    }
    

}

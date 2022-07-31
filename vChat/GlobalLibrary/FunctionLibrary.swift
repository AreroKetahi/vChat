//
//  FunctionLibrary.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/29.
//

import Foundation


/// A function that can get application language's identifer
/// - Returns: Language identifer
func getLocalLanguageCode() -> String? {
    let uiLocalLanguageCode = Locale.current.identifier
    let avaliableLanguagesIdentifer = ["en", "zh-Hans", "de","zh-Hant", "ru", "fr", "ja", "es", "ko", "ar"]
    
    var languageIdentifer: String?
    for i in 0...(avaliableLanguagesIdentifer.count - 1) {
        if uiLocalLanguageCode.contains(avaliableLanguagesIdentifer[i]) {
            languageIdentifer = avaliableLanguagesIdentifer[i]
        }
    }
    
    return languageIdentifer
}

func isRightToLeftEnable() -> Bool {
    let filpLanguages = ["ar"]
    
    if filpLanguages.contains(getLocalLanguageCode()!) {
        return true
    } else {
        return false
    }
}

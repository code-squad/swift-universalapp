//
//  Language.swift
//  UniversalApp
//
//  Created by oingbong on 04/01/2019.
//

import Foundation

struct Language: CustomStringConvertible {
    private let descriptionKey = "description"
    private let birthTitleKey = "birthTitle"
    private let languageInfoTable = "LanguageInfo"
    
    var description: String {
        return localizedString(forKey: descriptionKey, from: languageInfoTable)
    }
    
    var birthTitle: String {
        return localizedString(forKey: descriptionKey, from: languageInfoTable)
    }
    
    private func localizedString(forKey key: String, from name: String) -> String {
        let result = Bundle.main.localizedString(forKey: key, value: nil, table: name)
        return result
    }
}

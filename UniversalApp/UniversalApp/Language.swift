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
    private let LanguageInfoTable = "LanguageInfo"
    
    var description: String {
        return localizedString(forKey: descriptionKey, from: LanguageInfoTable)
    }
    
    var birthTitle: String {
        return localizedString(forKey: descriptionKey, from: LanguageInfoTable)
    }
    
    private func localizedString(forKey key: String, from name: String) -> String {
        let result = Bundle.main.localizedString(forKey: key, value: nil, table: name)
        return result
    }
}

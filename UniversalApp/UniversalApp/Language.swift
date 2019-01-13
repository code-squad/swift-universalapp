//
//  Language.swift
//  UniversalApp
//
//  Created by oingbong on 04/01/2019.
//

import Foundation

struct Language: CustomStringConvertible {
    var description: String {
        return localizedString(forKey: "description", from: "LanguageInfo")
    }
    
    var birthTitle: String {
        return localizedString(forKey: "birthTitle", from: "LanguageInfo")
    }
    
    private func localizedString(forKey key: String, from name: String) -> String {
        let result = Bundle.main.localizedString(forKey: key, value: nil, table: name)
        return result
    }
}

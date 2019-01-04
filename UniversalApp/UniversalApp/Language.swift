//
//  Language.swift
//  UniversalApp
//
//  Created by oingbong on 04/01/2019.
//

import Foundation

enum Language: String, CustomStringConvertible {
    case en
    case ko
    case ja
    case zh
    
    var description: String {
        switch self {
        case .en: return "English"
        case .ko: return "한국어"
        case .ja: return "日本の"
        case .zh: return "中国"
        }
    }
    
    var birthTitle: String {
        switch self {
        case .en: return "Birthday"
        case .ko: return "생년월일"
        case .ja: return "生年月日"
        case .zh: return "出生日期"
        }
    }
}

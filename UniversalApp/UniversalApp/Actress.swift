//
//  Actress.swift
//  UniversalApp
//
//  Created by oingbong on 04/01/2019.
//

import Foundation

enum Actress: String, CustomStringConvertible {
    case KR, JP, US, CN
    
    var description: String {
        switch self {
        case .KR: return "CheonUhui"
        case .JP: return "AoiYu"
        case .US: return "JenniferShraderLawrence"
        case .CN: return "FanBingbing"
        }
    }
    
    var birth: String {
        switch self {
        case .KR: return "1987-04-20"
        case .JP: return "1985-08-17"
        case .US: return "1990-08-15"
        case .CN: return "1981-09-16"
        }
    }
}

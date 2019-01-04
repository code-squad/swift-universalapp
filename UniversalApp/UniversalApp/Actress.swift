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
}

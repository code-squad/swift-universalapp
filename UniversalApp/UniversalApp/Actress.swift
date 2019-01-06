//
//  Actress.swift
//  UniversalApp
//
//  Created by oingbong on 04/01/2019.
//

import Foundation

struct Actress: CustomStringConvertible {
    enum ActressInfo: String, CustomStringConvertible {
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
    
    var description: String {
        guard let actressInfo = self.actressInfo else { return "" }
        return actressInfo.description
    }
    
    var name: String? {
        guard let actressInfo = self.actressInfo else { return nil }
        return localizedString(forKey: "name", from: actressInfo.description)
    }
    
    var birth: String? {
        guard let actressInfo = self.actressInfo else { return nil }
        return actressInfo.birth
    }
    
    var info: String? {
        guard let actressInfo = self.actressInfo else { return nil }
        return localizedString(forKey: "info", from: actressInfo.description)
    }
    
    var region: String? {
        guard let actressInfo = self.actressInfo else { return nil }
        return localizedString(forKey: "region", from: actressInfo.description)
    }
    
    private var actressInfo: ActressInfo? {
        guard let region = Locale.current.regionCode else { return nil }
        guard let actressInfo = ActressInfo(rawValue: region) else { return nil }
        return actressInfo
    }
    
    private func localizedString(forKey key: String, from name: String) -> String {
        let result = Bundle.main.localizedString(forKey: key, value: nil, table: name)
        return result
    }
}

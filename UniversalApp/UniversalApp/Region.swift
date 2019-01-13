//
//  Actress.swift
//  UniversalApp
//
//  Created by oingbong on 04/01/2019.
//

import Foundation

struct Region: CustomStringConvertible {
    enum ActressInfo: String {
        case KR, JP, US, CN
        
        var englishName: String {
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
        
        var birthFormat: String {
            switch self {
            case .KR: return "ko"
            case .JP: return "ja"
            case .US: return "en"
            case .CN: return "zh"
            }
        }
    }
    
    private let dateFormat = "yyyy-MM-dd"
    private let regionKey = "region"
    private let nameKey = "name"
    private let infoKey = "info"
    
    private var actressInfo: ActressInfo? {
        guard let region = Locale.current.regionCode else { return nil }
        guard let actressInfo = ActressInfo(rawValue: region) else { return nil }
        return actressInfo
    }
    
    var englishName: String? {
        guard let actressInfo = self.actressInfo else { return nil }
        return actressInfo.englishName
    }
    
    var description: String {
        guard let actressInfo = self.actressInfo else { return "" }
        return localizedString(forKey: regionKey, from: actressInfo.englishName)
    }
    
    var localizationName: String? {
        guard let actressInfo = self.actressInfo else { return nil }
        return localizedString(forKey: nameKey, from: actressInfo.englishName)
    }
    
    var info: String? {
        guard let actressInfo = self.actressInfo else { return nil }
        return localizedString(forKey: infoKey, from: actressInfo.englishName)
    }
    
    var birth: String? {
        guard let actressInfo = self.actressInfo else { return nil }
        guard let birthday = dateFormat(with: actressInfo) else { return nil }
        return birthday
    }
    
    private func localizedString(forKey key: String, from name: String) -> String {
        let result = Bundle.main.localizedString(forKey: key, value: nil, table: name)
        return result
    }
    
    private func dateFormat(with info: ActressInfo) -> String? {
        guard let date = inputDateFormatter(with: info) else { return nil }
        let birthday = outputDateFormatter(date, with: info)
        return birthday
    }
    
    private func inputDateFormatter(with info: ActressInfo) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        guard let date = dateFormatter.date(from: info.birth) else { return nil }
        return date
    }
    
    private func outputDateFormatter(_ date: Date, with info: ActressInfo) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.locale = Locale(identifier: info.birthFormat)
        let birthday = dateFormatter.string(from: date)
        return birthday
    }
}

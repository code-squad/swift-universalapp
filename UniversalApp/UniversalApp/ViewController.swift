//
//  ViewController.swift
//  UniversalApp
//
//  Created by oingbong on 31/12/2018.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var languageRegionLabel: UILabel!
    @IBOutlet weak var birthButtton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard let (languageCode, regionCode) = locale() else { return }
        guard let actressName = actress(from: regionCode) else { return }
        guard let language = language(from: languageCode) else { return }
        
        let name = localizedString(forKey: "name", from: actressName)
        let info = localizedString(forKey: "info", from: actressName)
        let region = localizedString(forKey: "region", from: actressName)
        
        imageView.image = UIImage(named: actressName)
        nameLabel.text = name
        infoLabel.text = info
        languageRegionLabel.text = "\(language.description)-\(region)"
        birthButtton.setTitle(language.birthTitle, for: UIControl.State.normal)
    }
    
    private func locale() -> (String, String)? {
        let locale = Locale.current
        guard let language = locale.languageCode,
            let region = locale.regionCode else { return nil }
        return (language, region)
    }
    
    private func actress(from region: String) -> String? {
        guard let actress = Actress(rawValue: region) else { return nil }
        return actress.description
    }
    
    private func language(from language: String) -> Language? {
        guard let language = Language(rawValue: language) else { return nil }
        return language
    }
    
    private func localizedString(forKey key: String, from name: String) -> String {
        let result = Bundle.main.localizedString(forKey: key, value: nil, table: name)
        return result
    }
}

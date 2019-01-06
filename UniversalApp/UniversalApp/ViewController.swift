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
        guard let actress = actress(from: regionCode) else { return }
        guard let language = language(from: languageCode) else { return }
        
        let name = localizedString(forKey: "name", from: actress.description)
        let info = localizedString(forKey: "info", from: actress.description)
        let region = localizedString(forKey: "region", from: actress.description)
        
        imageView.image = UIImage(named: actress.description)
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
    
    private func actress(from region: String) -> Actress? {
        guard let actress = Actress(rawValue: region) else { return nil }
        return actress
    }
    
    private func language(from language: String) -> Language? {
        guard let language = Language(rawValue: language) else { return nil }
        return language
    }
    
    private func localizedString(forKey key: String, from name: String) -> String {
        let result = Bundle.main.localizedString(forKey: key, value: nil, table: name)
        return result
    }
    
    @IBAction func clickBirthButton(_ sender: UIButton) {
        guard let (languageCode, regionCode) = locale() else { return }
        guard let actress = actress(from: regionCode) else { return }
        alert(with: actress)
    }
    
    private func alert(with actress: Actress ) {
        let alert = UIAlertController(title: nil, message: actress.birth, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

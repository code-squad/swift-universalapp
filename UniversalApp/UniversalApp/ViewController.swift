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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let (language, region) = locale() else { return }
        
        guard let actressName = actress(from: region) else { return }
        imageView.image = UIImage(named: actressName)
        
        let name = localizedString(forKey: "name", from: actressName)
        let info = localizedString(forKey: "info", from: actressName)
        nameLabel.text = name
        infoLabel.text = info
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
    
    private func localizedString(forKey key: String, from name: String) -> String {
        let result = Bundle.main.localizedString(forKey: key, value: nil, table: name)
        return result
    }
}

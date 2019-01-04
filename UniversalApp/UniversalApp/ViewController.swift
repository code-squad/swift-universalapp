//
//  ViewController.swift
//  UniversalApp
//
//  Created by oingbong on 31/12/2018.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let (language, region) = locale() else { return }
        
        guard let name = actress(from: region) else { return }
        imageView.image = UIImage(named: name)
    }
    
    private func locale() -> (String, String)? {
        let locale = Locale.current
        guard let language = locale.languageCode,
            let region = locale.regionCode else { return nil }
        return (language, region)
    }
    
    private func actress(from region: String) -> String? {
//        KR CheonUhui
//        US JenniferShraderLawrence
//        JP AoiYu
//        CN FanBingbing
        guard let actress = Actress(rawValue: region) else { return nil }
        return actress.description
    }
}

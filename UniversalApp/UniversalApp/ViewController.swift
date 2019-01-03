//
//  ViewController.swift
//  UniversalApp
//
//  Created by oingbong on 31/12/2018.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let locale = locale() else { return }
    }
    
    func locale() -> String? {
        let locale = Locale.current
        guard let language = locale.languageCode,
            let region = locale.regionCode else { return nil }
        return language + "_" + region
    }
}

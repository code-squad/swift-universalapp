//
//  iPadViewController.swift
//  UniversalApp
//
//  Created by oingbong on 06/01/2019.
//

import UIKit

class PadViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var languageRegionLabel: UILabel!
    @IBOutlet weak var birthButton: UIButton!
    
    private let region = Region()
    private let language = Language()
    private let device = Device()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        guard let englishName = region.englishName else { return }
        guard let name = region.localizationName else { return }
        guard let info = region.info else { return }
        
        imageView.image = UIImage(named: englishName)
        nameLabel.text = name
        infoLabel.text = info
        languageRegionLabel.text = "\(language)-\(region) : \(device.name)"
        birthButton.setTitle(language.birthTitle, for: UIControl.State.normal)
        birthButton.isEnabled = !device.isSimulator
    }

    @IBAction func clickBirthButton(_ sender: UIButton) {
        alert()
    }

    private func alert() {
        let alert = UIAlertController(title: nil, message: region.birth, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

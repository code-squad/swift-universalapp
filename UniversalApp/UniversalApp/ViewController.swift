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
    
    private let actress = Actress()
    private let language = Language()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard let name = actress.name else { return }
        guard let info = actress.info else { return }
        guard let region = actress.region else { return }
        
        imageView.image = UIImage(named: actress.description)
        nameLabel.text = name
        infoLabel.text = info
        languageRegionLabel.text = "\(language)-\(region)"
        birthButtton.setTitle(language.birthTitle, for: UIControl.State.normal)
    }
    
    @IBAction func clickBirthButton(_ sender: UIButton) {
        alert()
    }
    
    private func alert() {
        let alert = UIAlertController(title: nil, message: actress.birth, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

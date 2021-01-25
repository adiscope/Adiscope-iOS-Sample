//
//  ViewController.swift
//  Adiscope-iOS-Sample
//
//  Created by 구민재 on 2021/01/25.
//

import UIKit
import Adiscope

fileprivate let mediaID = "0"
fileprivate let mediaSecretKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
fileprivate let unitID = "xxxxxxxxxx"

class ViewController: UIViewController {

    @IBOutlet private weak var mediaIDTextField: UITextField!
    @IBOutlet private weak var secretKeyTextField: UITextField!
    private let adiscope = AdiscopeInterface.sharedInstance()! // not recommend: force unwraping
    private let textFont = UIFont.systemFont(ofSize: 12)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        mediaIDTextField.font = textFont
        mediaIDTextField.text   = mediaID
        
        secretKeyTextField.font = textFont
        secretKeyTextField.text = mediaSecretKey
        
//        adiscope.setMainDelegate(self)
//        adiscope.initialize(mediaID, mediaSecret: mediaSecretKey, callBackTag: "")
    }
    
    // MARK: - Events
    @IBAction func loadButtonTapped(_ sender: Any) {
        adiscope.load(unitID)
    }
    
    @IBAction func isLoadedButtonTapped(_ sender: Any) {
        print(adiscope.isLoaded(unitID))
    }
    
    @IBAction func showButtonTapped(_ sender: Any) {
        guard adiscope.isLoaded(unitID) == true else { return }
        adiscope.show()
    }
}

extension ViewController: AdiscopeDelegate {
    
}


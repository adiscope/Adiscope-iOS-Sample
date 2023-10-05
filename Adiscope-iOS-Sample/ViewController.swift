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
        
        adiscope.setMainDelegate(self)
        adiscope.setUserId("test")
        adiscope.initialize(mediaID, mediaSecret: mediaSecretKey, callBackTag: "")
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
    func onInitialized(_ isSuccess: Bool) {
        print("initialized: \(isSuccess)")
    }

    func onRewardedVideoAdLoaded(_ unitID: String!) {
        print("onRewardedVideoAdLoaded: \(unitID!)")
    }
    
    func onRewardedVideoAdFailed(toLoad unitID: String!, error: AdiscopeError!) {
        print("onRewardedVideoAdFailed: \(error.description) TraceID: \(error.getXB3TraceID() ?? "-")")
    }
    
    func onRewardedVideoAdOpened(_ unitID: String!) {
        print("onRewardedVideoAdOpened: \(unitID!)")
    }
    
    func onRewardedVideoAdClosed(_ unitID: String!) {
        print("onRewardedVideoAdClosed: \(unitID!)")
    }
    
    func onRewardedVideoAdFailed(toShow unitID: String!, error: AdiscopeError!) {
        print("onRewardedVideoAdFailed: \(unitID!), error: \(error.description) TraceID: \(error.getXB3TraceID() ?? "-")")
    }
    
    func onRewarded(_ unitID: String!, item: AdiscopeRewardItem!) {
        print("onRewarded: \(item.unit ?? ""), Amount: \(item.amount)")
    }
}


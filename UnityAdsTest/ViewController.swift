//
//  ViewController.swift
//  UnityAdsTest
//
//  Created by CHI BOON ONG on 10/10/2016.
//  Copyright © 2016 chiboon. All rights reserved.
//

import UIKit
import UnityAds

class ViewController: UIViewController, UnityAdsDelegate {

    @IBOutlet weak var showAdsButton: UIButton!
    
    let gameId = "1161733"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !UnityAds.isReady() {
            UnityAds.setDebugMode(true);
            UnityAds.initialize(gameId, delegate: self)
        } else {
            UnityAds.show(self)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAds(sender: AnyObject) {
        UnityAds.show(self)
    }
    
    //MARK: - UnityAdsDelegate
    
    func unityAdsReady(placementId: String) {
        print("unityAdsReady: \(placementId)")
        showAdsButton.enabled = true
    }
    
    func unityAdsDidStart(placementId: String) {
        print("unityAdsDidStart: \(placementId)")
    }
    
    func unityAdsDidError(error: UnityAdsError, withMessage message: String) {
        print("unityAdsDidError: \(error.rawValue) \(message)");
    }
    
    func unityAdsDidFinish(placementId: String, withFinishState state: UnityAdsFinishState) {
        print("unityAdsDidFinish: \(placementId) \(state.rawValue)")
    }


}


//
//  ViewController.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 09.07.2024.
//

import UIKit
import AVFoundation



class ViewController: UIViewController, UITextFieldDelegate {
    
    
    //MARK: - Outlet
    
    
    // Wallpapers
    
    private var gameWallpapersImageView = UIImageView()
    
    
    //  CoefSegmentedControl
    
    public var coefSegmentedControl     = UISegmentedControl()
    
    
    // betSlider &BetTextField
    
    public let betSlider           = UISlider()
    public var ownBetTextField     = UITextField()
    
    
    // Media
    
    public var buttonClickPlayer   = AVAudioPlayer()
    public var buttonClickSounds   = [String]()
    
    
    //Buttons
    
    /// barButtonItems
    private let menuButton    = UIButton()
    
    public let balanceButton  = UIButton()
    public var currentBalance = 5000
    
    /// Numbers
    
    public var numberButtons: [UIButton] = []
    public let numberButtonTexts = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                               "11", "12", "13", "14", "15", "16", "17", "18",
                               "19", "20", "21", "22", "23", "24"]
    public var clickedButtonsArray = [Int]()
    
    /// Start Button
    
    public let startButton    = UIButton()
    
    
    // UserData
    
    public let userDefaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        //MARK: - Wallpapers
        
        createGameWallpapers(gameWallpapersImageView)
        
        
        //MARK: - CoefSegmentedControl

        createSegmentedControl(&coefSegmentedControl)
        
        
        // MARK: - BetSlider
        
        createBetSlider(betSlider)
        
        
        //MARK: - OwnBetTextField
        
        createOwnBetTextField(ownBetTextField)
        
        
        // MARK: - Media
        
        buttonClickSounds.append("click_error")
        buttonClickSounds.append("click_sound")
        
        checkSoundExist(&buttonClickPlayer, buttonClickSounds)
        
        
        //MARK: - NavigationViewController

        self.navigationItem.leftBarButtonItem = createLeftBarButtonItem(menuButton)
        self.navigationItem.rightBarButtonItem = createRightBarBattonItem(balanceButton)
        
        
        //MARK: - CeateAllNumberButtons
        
        createAllNumberButtons()
        
        
        //MARK: - StartButton
        
        createStartButton(startButton)
        
        
        //MARK: - UploadUserInfo
        
        uploadUserInfo(userDefaults)
        
        
    }
    
}

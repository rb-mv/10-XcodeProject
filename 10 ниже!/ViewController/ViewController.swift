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
    
    
    //  Коэффициент
    public var coefSegmentedControl = UISegmentedControl()
    
    
    // bet
    public let betSlider = UISlider()
    public var ownBetTextField = UITextField()
    
    
    // Media
    public var buttonClickPlayer = AVAudioPlayer()
    public var buttonClickSounds = [String]()
    
    
    //  Выбранные элементы:
    public var clickedButtonsArray = [Int]()
    
    
    //Buttons
    
    /// Numbers
    
    public var numberButtons: [UIButton] = []
    public let numberButtonTexts = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                               "11", "12", "13", "14", "15", "16", "17", "18",
                               "19", "20", "21", "22", "23", "24"]
    
    /// Start Button
    public let startButton = UIButton()
    
    // Balance
    public let balanceLabel = UILabel()
    public var currentBalance = 5000
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: - Wallpapers
        
        createGameWallpapers(gameWallpapersImageView)
        
        
        // MARK: - Media
        
        buttonClickSounds.append("click_error")
        buttonClickSounds.append("click_sound")
        
        checkSoundExist(&buttonClickPlayer, buttonClickSounds)
        
        
        // MARK: - BetSlider
        
        createBetSlider(betSlider)
        
        
        //MARK: - UITextField
        
        createOwnBetTextField(ownBetTextField)
        
        
        //MARK: - coefSegmentedControl

        createSegmentedControl(&coefSegmentedControl)
        
        
        //MARK: - ceateAllNumberButtons
        
        createAllNumberButtons()
        
        
        //MARK: - StartButton
        
        createStartButton(startButton)
        
        
        //MARK: - BalanceLabel
        
        createBallanceLable(balanceLabel)
    }
    
}

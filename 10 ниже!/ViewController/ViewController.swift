//
//  ViewController.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 09.07.2024.
//

import UIKit
import AVFoundation



class ViewController: UIViewController, UITextFieldDelegate {
    
    
    // обои
    private var gameWallpapersImageView = UIImageView()
    
    
    //  Коэффициент
    public var coefSegmentedControl = UISegmentedControl()
    
    
    // bet
    public let betSlider = UISlider()
    public var ownBetTextField = UITextField()
    
    /// ownBetTextFieldLimit
    private let minBetValue = 0
    
    //FIXME: Поменять значение макс на баланс
    private lazy var valuesRange = minBetValue...currentBalance
    
    
    
    // Media
    public var buttonClickPlayer = AVAudioPlayer()
    public var buttonClickSounds = [String]()
    
    
    
    //  Выбранные элементы:
    public var clickedButtonsArray = [Int]()
    
    //Buttons
    
    /// Numbers
    private let oneButton         = UIButton()
    private let twoButton         = UIButton()
    private let threeButton       = UIButton()
    private let fourButton        = UIButton()
    
    private let fiveButton        = UIButton()
    private let sixButton         = UIButton()
    private let sevenButton       = UIButton()
    private let eightButton       = UIButton()
    
    private let nineButton        = UIButton()
    private let tenButton         = UIButton()
    private let elevenButton      = UIButton()
    private let twelthButton      = UIButton()
    
    private let therteenButton    = UIButton()
    private let fourteenButton    = UIButton()
    private let fiveteenButton    = UIButton()
    private let sixteenButton     = UIButton()
    
    private let seventeenButton   = UIButton()
    private let eightteenButton   = UIButton()
    private let nineteenButton    = UIButton()
    private let twentyButton      = UIButton()
    
    private let twentyOneButton   = UIButton()
    private let twentyTwoButton   = UIButton()
    private let twentyThreeButton = UIButton()
    private let twentyFourButton  = UIButton()
    
    
    /// Start Button
    public let startButton       = UIButton()
    public let startButtonImage  = UIImage(named: "play")
    
    
    // Balance
    public let balanceLable = UILabel()
    public var currentBalance = 5000
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: - Wallpapers
        
        gameWallpapersImageView = UIImageView(frame: self.view.bounds)
        
        gameWallpapersImageView.contentMode = .scaleAspectFill
        
        gameWallpapersImageView.image = UIImage(named: "Wallpapers")
        
        self.view.addSubview(gameWallpapersImageView)
        

        
        
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
        
        
        //MARK: - NumberButtons
        
        createButton(button: oneButton,         text: "1",  row: 1, line: 1)
        createButton(button: twoButton,         text: "2",  row: 1, line: 2)
        createButton(button: threeButton,       text: "3",  row: 1, line: 3)
        createButton(button: fourButton,        text: "4",  row: 1, line: 4)
        
        createButton(button: fiveButton,        text: "5",  row: 2, line: 1)
        createButton(button: sixButton,         text: "6",  row: 2, line: 2)
        createButton(button: sevenButton,       text: "7",  row: 2, line: 3)
        createButton(button: eightButton,       text: "8",  row: 2, line: 4)
        
        createButton(button: nineButton,        text: "9",  row: 3, line: 1)
        createButton(button: tenButton,         text: "10", row: 3, line: 2)
        createButton(button: elevenButton,      text: "11", row: 3, line: 3)
        createButton(button: twelthButton,      text: "12", row: 3, line: 4)
        
        createButton(button: therteenButton,    text: "13", row: 4, line: 1)
        createButton(button: fourteenButton,    text: "14", row: 4, line: 2)
        createButton(button: fiveteenButton,    text: "15", row: 4, line: 3)
        createButton(button: sixteenButton,     text: "16", row: 4, line: 4)
        
        createButton(button: seventeenButton,   text: "17", row: 5, line: 1)
        createButton(button: eightteenButton,   text: "18", row: 5, line: 2)
        createButton(button: nineteenButton,    text: "19", row: 5, line: 3)
        createButton(button: twentyButton,      text: "20", row: 5, line: 4)
        
        createButton(button: twentyOneButton,   text: "21", row: 6, line: 1)
        createButton(button: twentyTwoButton,   text: "22", row: 6, line: 2)
        createButton(button: twentyThreeButton, text: "23", row: 6, line: 3)
        createButton(button: twentyFourButton,  text: "24", row: 6, line: 4)
        
        //MARK: StartButton
        
        createStartButton()
        
        
        //MARK: - BalanceLable
        
        createBallanceLable()
    }
    
    /*
    lazy var subView: [UIView] = [self.ownBetTextField,
                                  self.balanceLable,
                                  self.startButton,
                                  self.betSlider,
                                  self.coefSegmentedControl]
    */
    
}

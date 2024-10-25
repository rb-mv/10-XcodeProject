//
//  MenuViewController.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 21.10.2024.
//

import UIKit

class menuViewController: UIViewController {
    
    
    
    // Buttons
    private var startMenuButton = UIButton()
    private var statisticsMenuButton = UIButton()
    private var settingsMenuButton = UIButton()
    
    
    // BarButtonItems
    let profilePictureView = UIImageView(image: .profile)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: - BarButtonItem
        
        self.navigationItem.rightBarButtonItem = createRightMenuBarButtonItem(profilePictureView)
        
        
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "10 ниже!"
        
        
        // MARK: - createButtons
        
        createStartMenuButton(startMenuButton)
        createStatisticsMenuButton(statisticsMenuButton)
        createSettingsMenuBatton(settingsMenuButton)
        
        
    }
    

}



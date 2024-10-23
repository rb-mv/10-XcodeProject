//
//  MenuViewController.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 21.10.2024.
//

import UIKit

class menuViewController: UIViewController {
    
    private var startMenuButton = UIButton()
    private var statisticsMenuButton = UIButton()
    private var settingsMenuButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "10 ниже!"
        
        createStartMenuButton(startMenuButton)
        createStatisticsMenuButton(statisticsMenuButton)
        createSettingsMenuBatton(settingsMenuButton)
    }
    

}



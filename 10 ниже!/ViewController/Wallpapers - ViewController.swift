//
//  Wallpapers - ViewController.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 20.10.2024.
//

import UIKit

extension ViewController {
    
    func createGameWallpapers(_ wallpaper: UIImageView) {
        
        wallpaper.frame = self.view.bounds
        wallpaper.contentMode = .scaleAspectFill
        wallpaper.image = UIImage(named: "Wallpapers")

        self.view.addSubview(wallpaper)
        
    }
    
}

//
//  Navigation - MenuVc.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 25.10.2024.
//

import UIKit

extension menuViewController {
    
    
    public func createRightMenuBarButtonItem(_ imageView: UIImageView) -> UIBarButtonItem {
            
        
        imageView.frame.size = CGSize(width: 35, height: 35)
        imageView.contentMode = .scaleAspectFit
        
        let profileButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        
        profileButton.setImage(imageView.image, for: .normal)
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.contentHorizontalAlignment = .center
        
        profileButton.addTarget(self, action: #selector(rightMenuBarButtonTapped), for: .touchUpInside)

        let customView = UIView(frame: profileButton.frame)
        customView.addSubview(profileButton)
        let barButtonItem = UIBarButtonItem(customView: customView)
        
        return barButtonItem
        
    }
    
    @objc func rightMenuBarButtonTapped() {
        
        navigationController?.pushViewController(ProfileTableViewController(), animated: true)
        
        
    }
    
    
}

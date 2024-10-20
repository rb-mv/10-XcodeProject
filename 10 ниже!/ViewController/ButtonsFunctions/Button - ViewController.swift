//
//  Button - ViewController.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 28.07.2024.
//

import UIKit

extension ViewController {
    
    
    //MARK: Create Button
    
    func createButton(but: UIButton, text: String, row: Int, line: Int) {
        
        var inRow : Int {
            switch row {
            case 1: return 160
            case 2: return 160 + 60
            case 3: return 160 + 60 * 2
            case 4: return 160 + 60 * 3
            case 5: return 160 + 60 * 4
            case 6: return 160 + 60 * 5
            default:
                print("You wrote wrong row! Possible rows are from 1 to 6!");
                return 0
            }
        }
        
        var inline : Int {
            switch line {
            case 1: return 30
            case 2: return 30 + 60
            case 3: return 30 + 60 * 2
            case 4: return 30 + 60 * 3
            default:
                print("You wrote wrong line! Possible lines are from 1 to 4!");
                return 0
            }
        }
        
        but.frame = CGRect(x: inline, y: inRow, width: 50, height: 50)
        but.setTitle(text, for: .normal)
        but.setTitleColor(UIColor.black, for: .normal)
        but.backgroundColor = UIColor.systemCyan
        but.layer.cornerRadius = 14
        but.clipsToBounds = true // Чтобы закругленные углы отображались корректно
        
        but.tag = Int(text) ?? 0
        
        self.view.addSubview(but) // отобразить кнопку
        
        // Эффект Error нажатия
        
        /// Устанавливаем ограничения для кнопки
        NSLayoutConstraint.activate([
            but.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            but.centerYAnchor.constraint(equalTo:  view.centerYAnchor),
            but.widthAnchor.constraint(equalToConstant: but.frame.width),
            but.heightAnchor.constraint(equalToConstant: but.frame.height)
                ])
        
        /// Создаем вью для эффекта фона
        let backgroundEffectView = UIView()
        backgroundEffectView.backgroundColor = UIColor.red
        backgroundEffectView.layer.cornerRadius = but.layer.cornerRadius
        backgroundEffectView.frame = but.bounds
        backgroundEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        but.insertSubview(backgroundEffectView, at: 0)
                
        /// Устанавливаем начальное состояние для эффекта фона
        backgroundEffectView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        backgroundEffectView.alpha = 0
        
        
        // Добавляем таргет на смену цвета по нажатию
        
        but.addTarget(self, action: #selector(buttonTupped(but: event: )), for: .touchDown)
    
    }
    
    //MARK: Wave tupping effect
    
    func waveTupEffect(but: UIButton, event: UIEvent) {
        
        guard let touch = event.allTouches?.first else { return }
        var location = touch.location(in: but)
        location.x -= but.frame.width/2
        location.y -= but.frame.height/2
        
        let rippleLayer = CAShapeLayer()
        rippleLayer.frame = but.bounds
        rippleLayer.path = UIBezierPath(ovalIn: CGRect(origin: location, size: but.bounds.size)).cgPath
        rippleLayer.fillColor = UIColor.black.cgColor
        rippleLayer.opacity = 0
        but.layer.insertSublayer(rippleLayer, above: but.layer)
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 0.4
        animationGroup.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0.1
        scaleAnimation.toValue = 1.0
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.3
        opacityAnimation.toValue = 0.0
        
        animationGroup.animations = [scaleAnimation, opacityAnimation]
        
        rippleLayer.add(animationGroup, forKey: nil)
    }

    
    //MARK: Target Button Tupped
    
    @objc func buttonTupped(but: UIButton, event: UIEvent) {
        
        
        // Проверка и окраска выбранных элементов
    
        if but.backgroundColor == UIColor.green {
            
            clickedButtonsArray.removeAll { $0 == but.tag }
            but.backgroundColor = UIColor.systemCyan
            
            // включение звукового эффекта
            self.clickSound1.play()
            
        } else {
            clickedButtonsArray.append(but.tag)
            switch clickedButtonsArray.count <= 5 {
            case true:
                
                switch but.backgroundColor {
                case UIColor.systemCyan: but.backgroundColor = UIColor.green
                case UIColor.green: but.backgroundColor = UIColor.systemCyan
                default: print("You have tupped button which has unknown color!")
                }
                
                // включение звукового эффекта
                self.clickSound1.play()
                
            case false :
                
                guard let backgroundEffectView = but.subviews.first else { return }
                UIView.animate(withDuration: 0.2, animations: {
                    backgroundEffectView.transform = CGAffineTransform.identity
                    backgroundEffectView.alpha = 1
                }) { _ in
                    // Возвращаем к начальному состоянию
                    UIView.animate(withDuration: 0.2) {
                        backgroundEffectView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                        backgroundEffectView.alpha = 0
                    }
                }
                clickedButtonsArray.removeAll { $0 == but.tag }
                
                // включение звукового эффекта
                self.clickError.play()
            }
        }
        waveTupEffect(but: but, event: event)
    }
    
}

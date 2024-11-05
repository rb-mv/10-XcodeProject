//
//  Button - ViewController.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 28.07.2024.
//

import UIKit

extension ViewController {
    
    
    
    // Функция для создания всех кнопок
    func createAllNumberButtons() {
        for i in 0..<numberButtonTexts.count {
            let button = UIButton()
            let row = i / 4 + 1 // вычисляем ряд (1-6)
            let line = i % 4 + 1 // вычисляем линию (1-4)
            createEachNumberButton(button: button, text: numberButtonTexts[i], row: row, line: line)
            numberButtons.append(button)
        }
    }
    
    
    //MARK: - Create Button
    
    private func createEachNumberButton(button: UIButton, text: String, row: Int, line: Int) {
        
        // Константы для расположения кнопок
        let buttonWidth: CGFloat = 50
        let buttonHeight: CGFloat = 50
        let rowBaseY: CGFloat = 160
        let lineBaseX: CGFloat = 30
        let verticalSpacing: CGFloat = 60
        let horizontalSpacing: CGFloat = 60
        
        // Проверка на корректность ряда и линии
        guard (1...6).contains(row), (1...4).contains(line) else {
            print("Invalid row or line. Row must be 1-6, line must be 1-4.")
            return
        }
        
        // Вычисление положения кнопки
        let yPosition = rowBaseY + verticalSpacing * CGFloat(row - 1)
        let xPosition = lineBaseX + horizontalSpacing * CGFloat(line - 1)
        
        // Устанавливаем frame для кнопки
        button.frame = CGRect(x: xPosition, y: yPosition, width: buttonWidth, height: buttonHeight)
        
        button.tag = Int(text) ?? 0 // для контроля кол-ва выбранных кнопок в массиве
        
        
        //Присваиваем основные параметры
        buttonConfiguration(button, text)
        
        //Добавляем таргет:
        button.addTarget(self, action: #selector(buttonTapped(button: event: )), for: .touchDown)
        
        
    }
    
    // MARK: - ButtonConfiguration
    
    private func buttonConfiguration(_ button: UIButton, _ buttonText: String) {
        
        // Добавляем кнопку на view
        self.view.addSubview(button)
        
        // основные настройки
        button.setTitle(buttonText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        
        // эффект нажатия
        buttonWrongTapEffect(button)
    }
    
    private func buttonWrongTapEffect(_ button: UIButton) {
        
        // Эффект фона
        let backgroundEffectView = UIView()
        backgroundEffectView.backgroundColor = .red
        backgroundEffectView.layer.cornerRadius = button.layer.cornerRadius
        backgroundEffectView.frame = button.bounds
        backgroundEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        button.insertSubview(backgroundEffectView, at: 0)
        
        // Начальное состояние эффекта
        backgroundEffectView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        backgroundEffectView.alpha = 0
    }
    
    
    //MARK: - Target Button Tupped
    
    @objc func buttonTapped(button: UIButton, event: UIEvent) {
        
        // Проверяем текущий цвет кнопки и выполняем соответствующее действие
        if isButtonSelected(button) {
            deselectButton(button)
            playCurrentClickSound(player: &buttonClickPlayer, state: true)
        } else {
            selectButton(button)
        }
        
        waveTupEffect(button: button, event: event)
        print(clickedButtonsArray)
    }

    // MARK: - Helper Functions for Target

    private func isButtonSelected(_ button: UIButton) -> Bool {
        return button.backgroundColor == .green
    }

    private func selectButton(_ button: UIButton) {
        clickedButtonsArray.append(button.tag)
        
        if clickedButtonsArray.count <= 5 {
            toggleButtonColor(button)
            playCurrentClickSound(player: &buttonClickPlayer, state: true)
        } else {
            animateExceededSelection(for: button)
            clickedButtonsArray.removeAll { $0 == button.tag }
            playCurrentClickSound(player: &buttonClickPlayer, state: false)
        }
    }

    private func deselectButton(_ button: UIButton) {
        clickedButtonsArray.removeAll { $0 == button.tag }
        button.backgroundColor = .systemCyan
    }

    private func toggleButtonColor(_ button: UIButton) {
        button.backgroundColor = (button.backgroundColor == .systemCyan) ? .green : .systemCyan
    }

    private func animateExceededSelection(for button: UIButton) {
        guard let backgroundEffectView = button.subviews.first else { return }
        
        UIView.animate(withDuration: 0.2, animations: {
            backgroundEffectView.transform = .identity
            backgroundEffectView.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                backgroundEffectView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                backgroundEffectView.alpha = 0
            }
        }
    }
    
    
    //MARK: Wave tupping effect
    
    func waveTupEffect(button: UIButton, event: UIEvent) {
        
        guard let touch = event.allTouches?.first else { return }
        var location = touch.location(in: button)
        location.x -= button.frame.width/2
        location.y -= button.frame.height/2
        
        let rippleLayer = CAShapeLayer()
        rippleLayer.frame = button.bounds
        rippleLayer.path = UIBezierPath(ovalIn: CGRect(origin: location, size: button.bounds.size)).cgPath
        rippleLayer.fillColor = UIColor.black.cgColor
        rippleLayer.opacity = 0
        button.layer.insertSublayer(rippleLayer, above: button.layer)
        
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

    
}

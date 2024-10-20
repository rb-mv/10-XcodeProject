//
//  FunctionsForItems.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 24.07.2024.
//

import UIKit

extension ViewController {
    
    
    // StartButtonCheck
    
    @objc func startButtonCheck(but: UIButton) {
        
        // Проверяем все ли готово для старта
        switch clickedButtonsArray {
            case _ where clickedButtonsArray.count < 5:
                alert(title: "Выберите 5 ячеек!", message: "Должно быть выбрано 5 чисел для начала игры", answer: "Хорошо", style: .alert)
            case _ where (Int(ownBetTextField.text ?? "не анрапнулось") ?? 0) <= 0:
                alert(title: "Ставка не указана!", message: "Укажите ставку с помощью ползунка или введите вручную", answer: "Хорошо", style: .alert)
            case _ where  currentBalance < ownBetUnwrapp():
            alert(title: "Пополните баланс!", message: "Перейдите в вкладку кошелек и пополните баланс удобным способом", answer: "Хорошо", style: .alert)
        default: startTheGame()
        }
        
        
        func ownBetUnwrapp() -> Int {
            return Int(ownBetTextField.text ?? "ownBet не анрапнулся") ?? 0
            
        }
        
        //Активация игры
        
        func startTheGame() {
            
            // Генерация 5 рандомных чисел
            var randomArray = [Int]()
            
            while randomArray.count < 5 {
                var n = Int.random(in: 1...24)
                
                if randomArray.contains(n){
                    
                } else {
                    randomArray.append(n)
                }
            }
            
            // Проверяем совпали-ли
            var correctlyChosenNumbers = [Int]()
            for i in randomArray {
                if clickedButtonsArray.contains(i) {
                    correctlyChosenNumbers.append(i)
                }
            }
            
            // Обновляем баланс
            
            if correctlyChosenNumbers.count == (coef.selectedSegmentIndex + 1) {
                
                switch coef.selectedSegmentIndex {
                case 0: currentBalance += Int(Double(ownBetUnwrapp()) * 1.5)
                default: currentBalance += ownBetUnwrapp() * (coef.selectedSegmentIndex + 1)
                }
                
            } else {
                currentBalance -= ownBetUnwrapp()
            }
            
            balanceLable.text = "Баланс: " + String(currentBalance)
            
            
            // Проверка корректности работы программы
            print("Сгенерированные цифры: \(randomArray)")
            print("Выбранные цифры: \(clickedButtonsArray)")
            print("Совпавшие цифры: \(correctlyChosenNumbers)")
            print(  currentBalance)
            print("Выбранный коэфициент: \(coef.selectedSegmentIndex)")
        }
        
        
        
    }
}


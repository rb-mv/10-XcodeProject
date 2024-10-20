//
//  StartButtonFunctions.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 04.10.2024.
//

import UIKit

extension ViewController {
    
    
    //MARK: - Create startButton
    
    func createStartButton() {
        
        startButton.frame = CGRect(x: 50, y: 750, width: 300, height: 70)
        startButton.setTitle("Start", for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 20)
        startButton.setTitleColor(UIColor.orange, for: .normal)
        startButton.backgroundColor = UIColor.systemYellow
        startButton.layer.cornerRadius = 16
        startButton.clipsToBounds = true
        startButton.setBackgroundImage(startButtonImage, for: .normal)
        
        startButton.addTarget(self, action: #selector(startButtonCheck(but:)), for: .touchDown)
        
        self.view.addSubview(self.startButton)
    }
    
    
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
                let n = Int.random(in: 1...24)
                
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
            
            if correctlyChosenNumbers.count == (coefSegmentedControl.selectedSegmentIndex + 1) {
                switch coefSegmentedControl.selectedSegmentIndex {
                case 0: currentBalance += Int(Double(ownBetUnwrapp()) * 1.5)
                default: currentBalance += ownBetUnwrapp() * (coefSegmentedControl.selectedSegmentIndex + 1)
                }
            } else {currentBalance -= ownBetUnwrapp()}
            
            
            balanceLable.text = "Баланс: " + String(currentBalance)
            
            
            sliderMaxValueUpdate()
            
            
            // Проверка корректности работы программы
            print("Сгенерированные цифры: \(randomArray)")
            print("Выбранные цифры: \(clickedButtonsArray)")
            print("Совпавшие цифры: \(correctlyChosenNumbers)")
            print(  currentBalance)
            print("Выбранный коэфициент: \(coefSegmentedControl.selectedSegmentIndex)")
        }
        
    }
}

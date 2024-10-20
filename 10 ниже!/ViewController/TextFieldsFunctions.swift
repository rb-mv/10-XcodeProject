


import UIKit

extension ViewController {
    
    //MARK: - createTextField
    
    func createOwnBetTextField(_ textField: UITextField) {
        
        textField.placeholder = "Ставка"
        textField.borderStyle = .none
        textField.backgroundColor = UIColor.white
        textField.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        textField.layer.borderWidth = 1.0
        textField.textColor = UIColor.black
        textField.textAlignment = .center
        textField.layer.cornerRadius = 12
        textField.frame = CGRect(x: 270, y: 550, width: 100, height: 50)
        
        textField.delegate = self
        
        self.view.addSubview(textField)
        
        // Создаем UITapGestureRecognizer - для сворачивания клавиатуры по касанию вне клавы
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        // Добавляем распознаватель жестов к view
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    func ownBetUnwrap() -> Int? {
        return Int(ownBetTextField.text ?? "ownBet не анрапнулся") ?? 0
    }
    
    //MARK: - Hide keyboard by touch
    
    // Метод для скрытия клавиатуры - по касанию в поле не клавы
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    
    // Метод для скрытия клавиатуры - по кнопке return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.ownBetTextField.resignFirstResponder()
        return true
        
    }
    
    //MARK: - Keyboard restrictions
    
    // Ограничения для TextField
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == ownBetTextField {
            
            // Ограничение на ввод до 8 цифр
            let currentText = textField.text ?? ""
            let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            if prospectiveText.count > 8 { // Запрещаем ввод, если символов больше 8
                return false
            }
            return true
        }   else {return false}
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == ownBetTextField {
            guard let text = textField.text, let enteredValue = Int(text) else {return}
            
            // Если введенное значение больше баланса, то устанавливаем значение равное балансу
            if enteredValue > currentBalance {
                textField.text = String(currentBalance)
            }
        }
    }
    
    
    
    
    
    
    
    
}



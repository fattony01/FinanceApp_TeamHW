//
//  AccountsTransferViewController.swift
//  FinanceApp_TeamHW
//
//  Created by Anton Kondratenko on 23.07.2023.
//

import UIKit

final class AccountsTransferViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    @IBOutlet var fromAccountPickerView: UIPickerView!
    @IBOutlet var toAcountPickerView: UIPickerView!
    
    private let accounts = ["Alfa-Card", "Tinkoff-Card", "Cash", "Sberbank"]
    private let secondAccounts = ["babau", "kakao", "chikau"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromAccountPickerView.dataSource = self
        fromAccountPickerView.delegate = self
        toAcountPickerView.dataSource = self
        toAcountPickerView.delegate = self
        
        fromAccountPickerView.tag = 1
        toAcountPickerView.tag = 2
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return accounts.count
        default:
            return secondAccounts.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1: return accounts[row]
        default: return secondAccounts[row]
        }
    }
}

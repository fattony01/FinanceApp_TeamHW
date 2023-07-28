//
//  BankAccountsViewController.swift
//  FinanceApp_TeamHW
//
//  Created by Anton Kondratenko on 23.07.2023.
//

import UIKit

class BankAccountsViewController: UIViewController {

    @IBOutlet var overallBalanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

// MARK: - UITableViewDataSource
extension BankAccountsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "accountcell", for: indexPath) as? BankAccountTableViewCell else {
            return UITableViewCell()
        }
        cell.accountNameLabel.text = "Счет \(indexPath.row)"
        cell.accountValueLabel.text = "\(indexPath.row)000 р."
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension BankAccountsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

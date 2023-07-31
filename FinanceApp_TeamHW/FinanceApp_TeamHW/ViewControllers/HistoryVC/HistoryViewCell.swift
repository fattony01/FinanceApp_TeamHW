//
//  HistoryViewCell.swift
//  FinanceApp_TeamHW
//
//  Created by Эльдар Абдуллин on 27.07.2023.
//

import UIKit

// MARK: - HistoryViewCell
final class HistoryViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet var moneyFlowTypeImageView: UIImageView!
    @IBOutlet var purchaseLabel: UILabel!
    @IBOutlet var bankAccountLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var costLabel: UILabel!

    // MARK: - Public methods
    func configure(event: Event) {
        moneyFlowTypeImageView.image = UIImage(systemName: event.moneyFlowTypeImage.rawValue)
        purchaseLabel.text = event.purchase
        bankAccountLabel.text = event.bankAccount
        commentLabel.text = event.comment
        costLabel.text = String(event.cost)
    }
}

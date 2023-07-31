//
//  FilterViewController.swift
//  FinanceApp_TeamHW
//
//  Created by Эльдар Абдуллин on 29.07.2023.
//

import UIKit

// MARK: - Protocol
protocol IFilterViewController {
    func getDecreasedEvents()
    func getIncreasedEvents()
}

// MARK: - FilterViewController
class FilterViewController: UIViewController {

    // MARK: - Public properties
    var delegate: IFilterViewController!

    // MARK: - IBActions
    @IBAction func filterButtonDidTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            delegate.getDecreasedEvents()
            dismiss(animated: true)
        default:
            delegate.getIncreasedEvents()
            dismiss(animated: true)
        }
    }
}

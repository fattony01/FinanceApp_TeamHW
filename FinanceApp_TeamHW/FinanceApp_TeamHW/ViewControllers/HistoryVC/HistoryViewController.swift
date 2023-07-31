//
//  HistoryViewController.swift
//  FinanceApp_TeamHW
//
//  Created by Anton Kondratenko on 23.07.2023.
//

import UIKit

// MARK: - Model and data
struct History {
    let purchaseDate: String
    var event: [Event]
    
    static func getHistory() -> [History] {
        [
            History(
                purchaseDate: "15 июля 2023",
                event: [
                    Event(
                        moneyFlowTypeImage: .expense,
                        purchase: "Одежда",
                        bankAccount: "2222-2222-2222-2222",
                        comment: "",
                        cost: -5000
                    )
                ]
            ),
            History(
                purchaseDate: "14 июля 2023",
                event: [
                    Event(
                        moneyFlowTypeImage: .expense,
                        purchase: "Оплата ЖКХ",
                        bankAccount: "2222-2222-2222-2222",
                        comment: "ЛC 1245-3453-3453-3468",
                        cost: -8000
                    )
                ]
            ),
            History(
                purchaseDate: "12 июля 2023",
                event: [
                    Event(
                        moneyFlowTypeImage: .expense,
                        purchase: "Еда",
                        bankAccount: "2222-2222-2222-2222",
                        comment: "Спасибо!",
                        cost: -2000
                    )
                ]
            ),
            History(
                purchaseDate: "10 июля 2023",
                event: [
                    Event(
                        moneyFlowTypeImage: .transfer,
                        purchase: "Перевод на счет",
                        bankAccount: "2222-2222-2222-2222",
                        comment: "Для онлайн-оплаты",
                        cost: 15000
                    ),
                    Event(
                        moneyFlowTypeImage: .income,
                        purchase: "Заработная плата",
                        bankAccount: "1111-1111-1111-1111",
                        comment: "Начисление за 07.2023",
                        cost: 115000
                    )
                ]
            )
        ]
    }
}

struct Event {
    let moneyFlowTypeImage: MoneyFlowType
    let purchase: String
    let bankAccount: String
    let comment: String
    let cost: Int
}

enum MoneyFlowType: String {
    case income = "bag.badge.plus"
    case transfer = "creditcard.and.123"
    case expense = "bag.fill.badge.minus"
}

// MARK: - HistoryViewController
final class HistoryViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var totalSavignsLabel: UILabel!

    // MARK: - Private Properties
    private var historyEvents = History.getHistory()

    // MARK: - UIViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let filterVC = segue.destination as? FilterViewController else { return }
        filterVC.delegate = self
    }
}

// MARK: - TableViewDataSource, TableViewDelegate
extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        historyEvents.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if !historyEvents[section].event.isEmpty {
            return historyEvents[section].purchaseDate
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historyEvents[section].event.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "history", for: indexPath) as? HistoryViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let historyEvent = historyEvents[indexPath.section].event[indexPath.row]

        cell.configure(event: historyEvent)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            historyEvents[indexPath.section].event.remove(at: indexPath.row)

            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

// MARK: - IFilterViewController
extension HistoryViewController: IFilterViewController {
    func getDecreasedEvents() {
        historyEvents = historyEvents.sorted { $0.purchaseDate > $1.purchaseDate }
        self.tableView.reloadData()
    }
    
    func getIncreasedEvents() {
        historyEvents = historyEvents.sorted { $0.purchaseDate < $1.purchaseDate }
        tableView.reloadData()
    }
}

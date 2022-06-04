//
//  ViewController.swift
//  Settings screen
//
//  Created by Maksim Malofeev on 02/06/2022.
//

import UIKit

struct Section {
    let options: [SettingsOption]
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundCOlor: UIColor
    let handler: (() -> Void)
}

class ViewController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.indentifier)
        return table
    }()

    var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        configure()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }

    func configure() {
        models.append(Section(options: [
            SettingsOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundCOlor: .systemOrange) {
                print("Нажата ячейка 'Авиарежим'")
            },
            SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundCOlor: .systemBlue) {
                print("Нажата ячейка 'Wi-Fi'")
            },
            SettingsOption(title: "Bluetooth", icon: UIImage(named: "Bluetooth"), iconBackgroundCOlor: .systemBlue) {
                print("Нажата ячейка 'Bluetooth'")
            },
            SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundCOlor: .systemGreen)  {
                print("Нажата ячейка 'Сотовая связь'")
            },
            SettingsOption(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBackgroundCOlor: .systemGreen) {
                print("Нажата ячейка 'Режим модема'")
            },
            SettingsOption(title: "VPN", icon: UIImage(named: "vpn"), iconBackgroundCOlor: .systemBlue) {
                print("Нажата ячейка 'VPN'")
            }
        ]))

        models.append(Section(options: [
            SettingsOption(title: "Уведомления", icon: UIImage(systemName: "app.badge"), iconBackgroundCOlor: .systemRed) {
                print("Нажата ячейка 'Уведомления'")
            },
            SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "speaker.wave.3"), iconBackgroundCOlor: .systemRed) {
                print("Нажата ячейка 'Звуки, тактильные сигналы'")
            },
            SettingsOption(title: "Не беспокоить", icon: UIImage(systemName: "moon.fill"), iconBackgroundCOlor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)) {
                print("Нажата ячейка 'Не беспокоить'")
            },
            SettingsOption(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBackgroundCOlor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))  {
                print("Нажата ячейка 'Экранное время'")
            }
        ]))

        models.append(Section(options: [
            SettingsOption(title: "Основные", icon: UIImage(systemName: "gear"), iconBackgroundCOlor: .systemGray) {
                print("Нажата ячейка 'Основные'")
            },
            SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "switch.2"), iconBackgroundCOlor: .systemGray) {
                print("Нажата ячейка 'Пункт управления'")
            },
            SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconBackgroundCOlor: .systemBlue) {
                print("Нажата ячейка 'Экран и яркость'")
            },
            SettingsOption(title: "Экран домой", icon: UIImage(systemName: "square.grid.3x3.square"), iconBackgroundCOlor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))  {
                print("Нажата ячейка 'Сотовая связь'")
            },
            SettingsOption(title: "Универсальный доступ", icon: UIImage(named: "access"), iconBackgroundCOlor: .systemBlue) {
                print("Нажата ячейка 'Универсальный доступ'")
            }
        ]))

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.indentifier, for: indexPath) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }
}


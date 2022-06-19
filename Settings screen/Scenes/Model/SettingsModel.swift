//
//  SettingsModel.swift
//  Settings screen
//
//  Created by Maksim Malofeev on 19/06/2022.
//

import Foundation
import UIKit

class SettingsModel {

    func createModels() -> [Section] {
        
        var models = [Section]()

        models.append(Section(options: [
            .switchCell(model: SettingsSwitchOption(
                title: "Авиарежим",
                icon: UIImage(systemName: "airplane"),
                iconBackgroundCOlor: .systemOrange) {
                print("Нажата ячейка 'Авиарежим'")
            }),
            .staticCell(model: SettingsOption(
                title: "Wi-Fi",
                titleConditionLable: "Не подключено",
                icon: UIImage(systemName: "wifi"),
                iconBackgroundCOlor: .systemBlue) {
                print("Нажата ячейка 'Wi-Fi'")
            }),
            .staticCell(model: SettingsOption(
                title: "Bluetooth",
                titleConditionLable: "Вкл.",
                icon: UIImage(named: "Bluetooth"),
                iconBackgroundCOlor: .systemBlue) {
                print("Нажата ячейка 'Bluetooth'")
            }),
            .staticCell(model: SettingsOption(
                title: "Сотовая связь",
                titleConditionLable: nil,
                icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                iconBackgroundCOlor: .systemGreen) {
                print("Нажата ячейка 'Сотовая связь'")
            }),
            .staticCell(model: SettingsOption(
                title: "Режим модема",
                titleConditionLable: nil,
                icon: UIImage(systemName: "personalhotspot"),
                iconBackgroundCOlor: .systemGreen) {
                print("Нажата ячейка 'Режим модема'")
            }),
            .switchCell(model: SettingsSwitchOption(
                title: "VPN",
                icon: UIImage(named: "vpn"),
                iconBackgroundCOlor: .systemBlue) {
                print("Нажата ячейка 'VPN'")
            })
        ]))

        models.append(Section(options: [
            .staticCell(model: SettingsOption(
                title: "Уведомления",
                titleConditionLable: nil,
                icon: UIImage(systemName: "app.badge"),
                iconBackgroundCOlor: .systemRed) {
                print("Нажата ячейка 'Уведомления'")
            }),
            .staticCell(model: SettingsOption(
                title: "Звуки, тактильные сигналы",
                titleConditionLable: nil,
                icon: UIImage(systemName: "speaker.wave.3"),
                iconBackgroundCOlor: .systemRed) {
                print("Нажата ячейка 'Звуки, тактильные сигналы'")
            }),
            .staticCell(model: SettingsOption(
                title: "Не беспокоить",
                titleConditionLable: nil,
                icon: UIImage(systemName: "moon.fill"),
                iconBackgroundCOlor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)) {
                print("Нажата ячейка 'Не беспокоить'")
            }),
            .staticCell(model: SettingsOption(
                title: "Экранное время",
                titleConditionLable: nil,
                icon: UIImage(systemName: "hourglass"),
                iconBackgroundCOlor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))  {
                print("Нажата ячейка 'Экранное время'")
            })
        ]))

        models.append(Section(options: [
            .staticCell(model: SettingsOption(
                title: "Основные",
                titleConditionLable: "\u{278A}",
                icon: UIImage(systemName: "gear"),
                iconBackgroundCOlor: .systemGray) {
                print("Нажата ячейка 'Основные'")
            }),
            .staticCell(model: SettingsOption(
                title: "Пункт управления",
                titleConditionLable: nil,
                icon: UIImage(systemName: "switch.2"),
                iconBackgroundCOlor: .systemGray) {
                print("Нажата ячейка 'Пункт управления'")
            }),
            .staticCell(model: SettingsOption(
                title: "Экран и яркость",
                titleConditionLable: nil,
                icon: UIImage(systemName: "textformat.size"),
                iconBackgroundCOlor: .systemBlue) {
                print("Нажата ячейка 'Экран и яркость'")
            }),
            .staticCell(model: SettingsOption(
                title: "Экран 'Домой'",
                titleConditionLable: nil,
                icon: UIImage(systemName: "square.grid.3x3.square"),
                iconBackgroundCOlor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))  {
                print("Нажата ячейка Экран 'Домой'")
            }),
            .staticCell(model: SettingsOption(
                title: "Универсальный доступ",
                titleConditionLable: nil,
                icon: UIImage(named: "access"),
                iconBackgroundCOlor: .systemBlue) {
                print("Нажата ячейка 'Универсальный доступ'")
            })
        ]))

        return models
    }
}



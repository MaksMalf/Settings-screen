//
//  Settings.swift
//  Settings screen
//
//  Created by Maksim Malofeev on 19/06/2022.
//

import Foundation
import UIKit

struct Section {
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundCOlor: UIColor
    let handler: (() -> Void)
}

struct SettingsOption {
    let title: String
    let titleConditionLable: String?
    let icon: UIImage?
    let iconBackgroundCOlor: UIColor
    let handler: (() -> Void)
}

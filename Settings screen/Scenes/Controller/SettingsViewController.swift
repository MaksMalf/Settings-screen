//
//  ViewController.swift
//  Settings screen
//
//  Created by Maksim Malofeev on 02/06/2022.
//

import UIKit

class SettingsViewController: UIViewController {

    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }

    var model: SettingsModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = SettingsView()
        title = "Настройки"
        model = SettingsModel()
        configureView()
    }
}

private extension SettingsViewController {
    func configureView() {
        guard let models = model?.createModels() else { return }
        settingsView?.configureView(with: models)
    }
}


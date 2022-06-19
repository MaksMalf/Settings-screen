//
//  SettingsView.swift
//  Settings screen
//
//  Created by Maksim Malofeev on 19/06/2022.
//

import UIKit

class SettingsView: UIView {

    // MARK: - Configuration

    func configureView(with models: [Section]) {
        self.models = models
        backgroundColor = .purple
    }

    // MARK: - Private properties
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.indentifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.reuseIdentifire)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self

        return table
    }()

    private var models = [Section]()

    // MARK: - Initial

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarhy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHierarhy()
        setupLayout()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    private func setupHierarhy() {
        addSubview(tableView)
    }

    private func setupLayout() {
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension SettingsView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]

        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.indentifier, for: indexPath) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model.self)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.reuseIdentifire, for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}


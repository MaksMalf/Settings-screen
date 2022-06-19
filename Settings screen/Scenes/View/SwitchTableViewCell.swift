//
//  SwitchTableViewCell.swift
//  Settings screen
//
//  Created by Maksim Malofeev on 05/06/2022.
//

import UIKit

class SwitchTableViewCell: SettingTableViewCell {

    static let reuseIdentifire = "SwitchTableViewCell"

    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .systemBlue
        return mySwitch
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconContainer)
        contentView.addSubview(lable)
        contentView.addSubview(mySwitch)
        iconContainer.addSubview(iconImageView)

        contentView.clipsToBounds = true
        accessoryType = .none
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(
            x: contentView.frame.size.width - mySwitch.frame.size.width - 15,
            y: (contentView.frame.size.height - mySwitch.frame.size.height) / 2,
            width: mySwitch.frame.size.width,
            height: mySwitch.frame.size.height)
    }

    func configure(with model: SettingsSwitchOption) {
        lable.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundCOlor
    }
}


//
//  SwitchTableViewCell.swift
//  Settings screen
//
//  Created by Maksim Malofeev on 05/06/2022.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    static let indentifier = "SwitchTableViewCell"

    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let lable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        return lable
    }()

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
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)

        let imageSize: CGFloat = size / 1.4
        iconImageView.frame = CGRect(
            x: (size-imageSize) / 2,
            y: (size-imageSize) / 2,
            width: imageSize,
            height: imageSize)

        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(
            x: contentView.frame.size.width - mySwitch.frame.size.width - 15,
            y: (contentView.frame.size.height - mySwitch.frame.size.height) / 2,
            width: mySwitch.frame.size.width,
            height: mySwitch.frame.size.height)

        lable.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
            height: contentView.frame.size.height)
    }

    public func configure(with model: SettingsSwitchOption) {
        lable.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundCOlor
    }
}


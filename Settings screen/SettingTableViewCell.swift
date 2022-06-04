//
//  SettingTableViewCell.swift
//  Settings screen
//
//  Created by Maksim Malofeev on 02/06/2022.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    static let indentifier = "SettingTableViewCell"

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

    private let conditionLable: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconContainer)
        contentView.addSubview(lable)
        contentView.addSubview(conditionLable)
        iconContainer.addSubview(iconImageView)
        
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
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

        lable.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: lable.intrinsicContentSize.width,
            height: contentView.frame.size.height)

        conditionLable.frame = CGRect(
            x: iconContainer.frame.size.width + lable.frame.size.width - 5,
            y: 0,
            width: contentView.frame.size.width - iconContainer.frame.size.width - lable.frame.size.width,
            height: lable.frame.size.height)
    }

    public func configure(with model: SettingsOption) {
        lable.text = model.title
        conditionLable.text = model.titleConditionLable
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundCOlor
    }
}

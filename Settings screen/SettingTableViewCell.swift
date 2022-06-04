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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconContainer)
        contentView.addSubview(lable)
        iconContainer.addSubview(iconImageView)
        
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator

        setConstrains()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

//    override func layoutSubviews() {
//        super.layoutSubviews()
//        let size: CGFloat = contentView.frame.size.height - 12
//        iconContainer.frame = CGRect(x: 10, y: 6, width: size, height: size)
//
//
//        let imageSize: CGFloat = size/1.5
//        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)
//
//        lable.frame = CGRect(x: 20 + iconContainer.frame.size.width, y: 0, width: contentView.frame.size.width - 20 - iconContainer.frame.size.width, height: contentView.frame.size.height)
//    }
//
    public func configure(with model: SettingsOption) {
        lable.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundCOlor
    }
}

extension SettingTableViewCell {

    func setConstrains() {

        contentView.addSubview(iconContainer)
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        let size: CGFloat = contentView.frame.size.height - 12
        NSLayoutConstraint.activate([
            iconContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            iconContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            iconContainer.widthAnchor.constraint(equalToConstant: size),
            iconContainer.heightAnchor.constraint(equalToConstant: size)
        ])

        iconContainer.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        let imageSize: CGFloat = size/1.4
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: iconContainer.topAnchor, constant: (size-imageSize)/2),
            iconImageView.leadingAnchor.constraint(equalTo: iconContainer.leadingAnchor, constant: (size-imageSize)/2),
            iconImageView.widthAnchor.constraint(equalToConstant: imageSize),
            iconImageView.heightAnchor.constraint(equalToConstant: imageSize)
        ])

        contentView.addSubview(lable)
        lable.translatesAutoresizingMaskIntoConstraints = false
        let labelWidth: CGFloat = contentView.frame.size.width - iconContainer.frame.size.width - 20
        NSLayoutConstraint.activate([
            lable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            lable.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 10),
            lable.widthAnchor.constraint(equalToConstant: labelWidth),
            lable.heightAnchor.constraint(greaterThanOrEqualTo: contentView.heightAnchor, multiplier: 1)
        ])
    }
}

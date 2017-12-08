//
//  ListCollectionViewCell.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/04.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import UIKit
import Cosmos

class ListCollectionViewCell: UICollectionViewCell {

    //UIパーツの配置
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var thumbImageView: UIImageView!
    @IBOutlet weak private var ratingStarView: CosmosView!
    @IBOutlet weak private var totalPointLabel: UILabel!
    @IBOutlet weak private var categoryLabel: UILabel!
    @IBOutlet weak private var publishedDateLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupListCollectionViewCell()
    }

    //MARK: - Functions

    func setCell(_ list: List) {

        //概要の行の高さを調節する
        let descriptionParagraphStyle = NSMutableParagraphStyle.init()
        descriptionParagraphStyle.minimumLineHeight = 20
        let descriptionAttributedText = NSMutableAttributedString.init(string: list.descriptionText)
        descriptionAttributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: descriptionParagraphStyle, range: NSMakeRange(0, descriptionAttributedText.length))
        descriptionLabel.attributedText = descriptionAttributedText

        titleLabel.text = list.title
        thumbImageView.image = list.thumbnail
        totalPointLabel.text = "\(list.star)"
        categoryLabel.text = list.category
        publishedDateLabel.text = list.publishedDate

        //星の値をCosmosViewクラスのインスタンスに入れる
        ratingStarView.settings.fillMode = .precise
        ratingStarView.rating = list.star
    }

    //MARK: - Private Functions
    
    private func setupListCollectionViewCell() {
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.masksToBounds = false

        //星のViewに関する設定
        ratingStarView.settings.updateOnTouch = false
        ratingStarView.settings.starSize = 20
        ratingStarView.settings.starMargin = 5
    }
}

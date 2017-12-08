//
//  ArticleDescriptionTableViewCell.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/08.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import UIKit
import FontAwesome_swift

class ArticleDescriptionTableViewCell: UITableViewCell {

    //UI部品の配置
    @IBOutlet weak private var articleTitleLabel: UILabel!
    @IBOutlet weak private var articleCategoryImageView: UIImageView!
    @IBOutlet weak private var articleCategoryLabel: UILabel!
    @IBOutlet weak private var articlePublishedDateImageView: UIImageView!
    @IBOutlet weak private var articlePublishedDateLabel: UILabel!
    @IBOutlet weak private var articleCatchCopyLabel: UILabel!

    //アイコンイメージのサイズ設定
    private let iconImageViewSize: CGSize = CGSize(width: 16, height: 16)

    override func awakeFromNib() {
        super.awakeFromNib()

        setupArticleDescriptionTableViewCell()
    }

    //MARK: - Function
    
    func setCell(_ article: Article) {

        //タイトルの行の高さを調節する
        let titleParagraphStyle = NSMutableParagraphStyle.init()
        titleParagraphStyle.minimumLineHeight = 24
        let titleAttributedText = NSMutableAttributedString.init(string: article.title)
        titleAttributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: titleParagraphStyle, range: NSMakeRange(0, titleAttributedText.length))
        articleTitleLabel.attributedText = titleAttributedText

        articleCatchCopyLabel.text = article.catchCopy
        articlePublishedDateLabel.text = article.publishedDate
        articleCategoryLabel.text = article.category
    }

    //MARK: - Private Function

    private func setupArticleDescriptionTableViewCell() {

        //セルの装飾設定をする
        self.accessoryType  = .none
        self.selectionStyle = .none

        //日時のアイコン設定
        let clockFontImage = UIImage.fontAwesomeIcon(name: .clockO, textColor: UIColor.gray, size: iconImageViewSize)
        articlePublishedDateImageView.backgroundColor = UIColor.clear
        articlePublishedDateImageView.image = clockFontImage

        //カテゴリーのアイコン設定
        let tagFontImage = UIImage.fontAwesomeIcon(name: .tag, textColor: UIColor.gray, size: iconImageViewSize)
        articleCategoryImageView.backgroundColor  = UIColor.clear
        articleCategoryImageView.image  = tagFontImage
    }
}

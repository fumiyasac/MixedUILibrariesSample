//
//  ArticleHashtagTableViewCell.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/08.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import UIKit
import ActiveLabel

class ArticleHashtagTableViewCell: UITableViewCell {

    @IBOutlet weak private var articleHashtagLabel: ActiveLabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupArticleHashtagTableViewCell()
    }

    //MARK: - Function

    func setCell(_ article: Article) {
        let hashtagString = article.hashTags.joined(separator: " ")

        //ハッシュタグの行の高さを調節する
        let hashtagParagraphStyle = NSMutableParagraphStyle.init()
        hashtagParagraphStyle.minimumLineHeight = 20
        let hashtagAttributedText = NSMutableAttributedString.init(string: hashtagString)
        hashtagAttributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: hashtagParagraphStyle, range: NSMakeRange(0, hashtagAttributedText.length))
        articleHashtagLabel.attributedText = hashtagAttributedText
        articleHashtagLabel.handleHashtagTap { hashtag in
            print("押されたハッシュタグ：\(hashtag)")
        }
    }

    //MARK: - Private Function

    private func setupArticleHashtagTableViewCell() {
        self.accessoryType  = .none
        self.selectionStyle = .none

        articleHashtagLabel.enabledTypes = [.hashtag]
    }
}

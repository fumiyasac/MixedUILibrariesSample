//
//  ArticleDetailTableViewCell.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/08.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import UIKit

class ArticleDetailTableViewCell: UITableViewCell {

    @IBOutlet weak private var articleDetailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupArticleDetailTableViewCell()
    }

    //MARK: - Function

    func setCell(_ article: Article) {

        //本文詳細の行の高さを調節する
        let detailTextParagraphStyle = NSMutableParagraphStyle.init()
        detailTextParagraphStyle.minimumLineHeight = 20
        let detailTextAttributedText = NSMutableAttributedString.init(string: article.detailText)
        detailTextAttributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: detailTextParagraphStyle, range: NSMakeRange(0, detailTextAttributedText.length))
        articleDetailLabel.attributedText = detailTextAttributedText
    }

    //MARK: - Private Function
    
    private func setupArticleDetailTableViewCell() {
        self.accessoryType  = .none
        self.selectionStyle = .none
    }
}

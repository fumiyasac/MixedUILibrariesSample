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
    /*
    func setCell(_ article: Article) {
     
    }
    */

    //MARK: - Private Function

    private func setupArticleHashtagTableViewCell() {
        articleHashtagLabel.enabledTypes = [.hashtag]
    }
}

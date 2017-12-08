//
//  ArticleUrlTableViewCell.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/08.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import UIKit
import ActiveLabel

class ArticleUrlTableViewCell: UITableViewCell {

    @IBOutlet weak private var articleUrlLabel: ActiveLabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupArticleUrlTableViewCell()
    }

    //MARK: - Function
    /*
    func setCell(_ article: Article) {
     
    }
    */

    //MARK: - Private Function
    
    private func setupArticleUrlTableViewCell() {
        articleUrlLabel.enabledTypes = [.url]
    }
}

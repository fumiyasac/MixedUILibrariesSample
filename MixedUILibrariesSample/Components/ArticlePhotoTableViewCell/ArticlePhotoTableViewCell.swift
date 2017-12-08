//
//  ArticlePhotoTableViewCell.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/08.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import UIKit

class ArticlePhotoTableViewCell: UITableViewCell {

    @IBOutlet weak private var articlePhotoCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupArticlePhotoTableViewCell()
        setupCategoryArticleCollectionView()
    }

    //MARK: - Private Function

    private func setupArticlePhotoTableViewCell() {
        self.accessoryType  = .none
        self.selectionStyle = .none
    }

    private func setupCategoryArticleCollectionView() {
        articlePhotoCollectionView.delegate = self
        articlePhotoCollectionView.dataSource = self
        articlePhotoCollectionView.registerCustomCell(ArticlePhotoCollectionViewCell.self)
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ArticlePhotoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCustomCell(with: ArticlePhotoCollectionViewCell.self, indexPath: indexPath)
        return cell
    }
}

//
//  ListCollectionViewCell.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/04.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

        setupListCollectionViewCell()
    }

    //MARK: - Private Functions
    
    private func setupListCollectionViewCell() {
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.masksToBounds = false
    }
}

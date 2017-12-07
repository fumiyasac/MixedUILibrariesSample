//
//  ListViewController.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/03.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import UIKit
import VegaScrollFlowLayout

class ListViewController: UIViewController {

    //UI部品の配置
    @IBOutlet weak var listCollectionView: UICollectionView!

    //CollectionView表示の隙間やサイズに関する設定
    private let itemHeight: CGFloat = 180
    private let lineSpacing: CGFloat = 15
    private let spaceInset: CGFloat = 15
    private let topInset: CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupListCollectionViewCell()
        setupListCollectionViewLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - Private Functiom

    private func setupNavigationBar() {
        navigationController?.view.backgroundColor = UIColor.black
    }

    private func setupListCollectionViewCell() {
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        listCollectionView.registerCustomCell(ListCollectionViewCell.self)

        //
        listCollectionView.contentInset.bottom = itemHeight
    }

    private func setupListCollectionViewLayout() {

        //
        guard let layout = listCollectionView.collectionViewLayout as? VegaScrollFlowLayout else { return }
        layout.minimumLineSpacing = lineSpacing
        layout.sectionInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)

        //
        let itemWidth = UIScreen.main.bounds.width - 2 * spaceInset
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)

        //
        listCollectionView.collectionViewLayout.invalidateLayout()
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCustomCell(with: ListCollectionViewCell.self, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

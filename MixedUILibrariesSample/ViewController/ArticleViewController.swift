//
//  ArticleViewController.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/07.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import UIKit
import ParallaxHeader
import AMScrollingNavbar

class ArticleViewController: ScrollingNavigationViewController {

    //UI部品の配置
    @IBOutlet var articleTableView: UITableView!

    //表示するセルの定義を設定したEnum
    fileprivate enum CellType: Int {
        case articleDescription = 0
        case articleHashTag     = 1
        case articleDetail      = 2
        case articleUrl         = 3
        case articlePhoto       = 4

        static func getAllRow() -> [CellType] {
            let allCellType: [CellType] = [
                .articleDescription,
                .articleHashTag,
                .articleDetail,
                .articleUrl,
                .articlePhoto
            ]
            return allCellType
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupArticleTableView()
        setupParallaxTableViewHeader()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let navigationController = navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(articleTableView, delay: 44.0)
            navigationController.scrollingNavbarDelegate = self
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if let navigationController = self.navigationController as? ScrollingNavigationController {
            navigationController.stopFollowingScrollView()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - Private Function

    //テーブルビューの初期化を行う
    private func setupArticleTableView() {
        articleTableView.dataSource = self
        articleTableView.delaysContentTouches = false
        articleTableView.rowHeight = UITableViewAutomaticDimension

        articleTableView.registerCustomCell(ArticleDescriptionTableViewCell.self)
        articleTableView.registerCustomCell(ArticleHashtagTableViewCell.self)
        articleTableView.registerCustomCell(ArticleDetailTableViewCell.self)
        articleTableView.registerCustomCell(ArticleUrlTableViewCell.self)
        articleTableView.registerCustomCell(ArticlePhotoTableViewCell.self)
    }
    
    private func setupParallaxTableViewHeader() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dummy")
        imageView.contentMode = .scaleAspectFill

        articleTableView.parallaxHeader.view = imageView
        articleTableView.parallaxHeader.view.backgroundColor = UIColor.black
        articleTableView.parallaxHeader.height = 260
        articleTableView.parallaxHeader.minimumHeight = 0
        articleTableView.parallaxHeader.mode = .centerFill
        articleTableView.parallaxHeader.parallaxHeaderDidScrollHandler = { parallaxHeader in
            parallaxHeader.view.alpha = parallaxHeader.progress
        }
    }
}

//MARK: - ScrollingNavigationControllerDelegate

extension ArticleViewController: ScrollingNavigationControllerDelegate {
    func scrollingNavigationController(_ controller: ScrollingNavigationController, willChangeState state: NavigationBarState) {
        self.view.needsUpdateConstraints()
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension ArticleViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50//CellType.getAllRow().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //index番号に応じて読み込むセルを変えている
        switch indexPath.row {

        case CellType.articleDescription.rawValue:
            let cell = tableView.dequeueReusableCustomCell(with: ArticleDescriptionTableViewCell.self)
            return cell

        case CellType.articleHashTag.rawValue:
            let cell = tableView.dequeueReusableCustomCell(with: ArticleDetailTableViewCell.self)
            return cell

        case CellType.articleDetail.rawValue:
            let cell = tableView.dequeueReusableCustomCell(with: ArticleUrlTableViewCell.self)
            return cell

        case CellType.articleUrl.rawValue:
            let cell = tableView.dequeueReusableCustomCell(with: ArticleUrlTableViewCell.self)
            return cell

        case CellType.articlePhoto.rawValue:
            let cell = tableView.dequeueReusableCustomCell(with: ArticlePhotoTableViewCell.self)
            return cell
        default:
            return UITableViewCell.init()
        }
    }
}

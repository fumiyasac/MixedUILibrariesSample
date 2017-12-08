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

class ArticleViewController: UIViewController {

    //UI部品の配置
    @IBOutlet var articleTableView: UITableView!

    fileprivate var articleContents: Article! {
        didSet {
            self.articleTableView.reloadData()
        }
    }

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

        setupNavigationBar()
        setupArticleTableView()
        setupParallaxTableViewHeader()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let navigationController = navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(articleTableView, delay: 44.0)
            
            //MEMO: ScrollingNavigationControllerDelegateを利用する際に必要な宣言
            //navigationController.scrollingNavbarDelegate = self
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

    //この画面のナビゲーションバーの設定
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.title = "サンプル記事の紹介"
    }

    //テーブルビューの初期化を行う
    private func setupArticleTableView() {
        articleTableView.dataSource = self
        articleTableView.delaysContentTouches = false
        articleTableView.rowHeight = UITableViewAutomaticDimension
        articleTableView.estimatedRowHeight = 340

        articleTableView.registerCustomCell(ArticleDescriptionTableViewCell.self)
        articleTableView.registerCustomCell(ArticleHashtagTableViewCell.self)
        articleTableView.registerCustomCell(ArticleDetailTableViewCell.self)
        articleTableView.registerCustomCell(ArticleUrlTableViewCell.self)
        articleTableView.registerCustomCell(ArticlePhotoTableViewCell.self)

        articleContents = Article.getSampleData()
    }
    
    private func setupParallaxTableViewHeader() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "article_main")
        imageView.contentMode = .scaleAspectFill

        articleTableView.parallaxHeader.view = imageView
        articleTableView.parallaxHeader.view.backgroundColor = UIColor.black
        articleTableView.parallaxHeader.height = 240
        articleTableView.parallaxHeader.minimumHeight = 0
        articleTableView.parallaxHeader.mode = .centerFill
        articleTableView.parallaxHeader.parallaxHeaderDidScrollHandler = { parallaxHeader in
            parallaxHeader.view.alpha = parallaxHeader.progress
        }
    }
}

//MARK: - ScrollingNavigationControllerDelegate

//MEMO: ScrollingNavigationControllerDelegateを利用する際は下記の様に利用する（下記はスクロール状態に応じての処理を実行するためのもの）

/*
extension ArticleViewController: ScrollingNavigationControllerDelegate {
    func scrollingNavigationController(_ controller: ScrollingNavigationController, didChangeState state: NavigationBarState) {
        switch state {
        case .collapsed:
            print("navbar collapsed")
        case .expanded:
            print("navbar expanded")
        case .scrolling:
            print("navbar is moving")
        }
    }
}
*/

//MARK: - UITableViewDataSource

extension ArticleViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellType.getAllRow().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //index番号に応じて読み込むセルを変えている
        switch indexPath.row {

        case CellType.articleDescription.rawValue:
            let cell = tableView.dequeueReusableCustomCell(with: ArticleDescriptionTableViewCell.self)
            cell.setCell(articleContents)
            return cell

        case CellType.articleHashTag.rawValue:
            let cell = tableView.dequeueReusableCustomCell(with: ArticleHashtagTableViewCell.self)
            cell.setCell(articleContents)
            return cell

        case CellType.articleDetail.rawValue:
            let cell = tableView.dequeueReusableCustomCell(with: ArticleDetailTableViewCell.self)
            cell.setCell(articleContents)
            return cell

        case CellType.articleUrl.rawValue:
            let cell = tableView.dequeueReusableCustomCell(with: ArticleUrlTableViewCell.self)
            cell.setCell(articleContents)
            return cell

        case CellType.articlePhoto.rawValue:
            let cell = tableView.dequeueReusableCustomCell(with: ArticlePhotoTableViewCell.self)
            return cell

        default:
            return UITableViewCell.init()
        }
    }
}

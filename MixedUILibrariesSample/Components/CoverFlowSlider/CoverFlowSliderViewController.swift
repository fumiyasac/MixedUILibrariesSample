//
//  CoverFlowSliderViewController.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/04.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import UIKit
import FSPagerView

class CoverFlowSliderViewController: UIViewController {

    //カバーフロー形式のギャラリーを表示するためのFSPagerView
    @IBOutlet weak fileprivate var coverFlowSliderView: FSPagerView! {
        didSet {
            self.coverFlowSliderView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }

    fileprivate var coverflowContents: [Coverflow] = [] {
        didSet {
            self.coverFlowSliderView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCoverFlowSliderView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - Private Functions

    private func setupCoverFlowSliderView() {
        coverFlowSliderView.delegate = self
        coverFlowSliderView.dataSource = self
        coverFlowSliderView.isInfinite = true
        coverFlowSliderView.itemSize = CGSize(width: 180, height: 120)
        coverFlowSliderView.interitemSpacing = 16
        coverFlowSliderView.transformer = FSPagerViewTransformer(type: .coverFlow)

        coverflowContents = Coverflow.getSampleData()
    }
}

//MARK: - FSPagerViewDataSource, FSPagerViewDelegate

extension CoverFlowSliderViewController: FSPagerViewDataSource, FSPagerViewDelegate {

    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return coverflowContents.count
    }

    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let coverflow = coverflowContents[index]

        cell.contentView.layer.shadowOpacity = 0.4
        cell.contentView.layer.opacity = 0.86

        cell.imageView?.image = coverflow.thumbnail
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        return cell
    }

    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
}

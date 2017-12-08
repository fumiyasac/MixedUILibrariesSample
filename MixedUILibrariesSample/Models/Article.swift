//
//  Article.swift
//  MixedUILibrariesSample
//
//  Created by 酒井文也 on 2017/12/08.
//  Copyright © 2017年 酒井文也. All rights reserved.
//

import Foundation
import UIKit

struct Article {
    
    //メンバ変数（ダミーデータを作成する）
    let id: Int
    let title: String
    let category: String
    let publishedDate: String
    let catchCopy: String
    let detailText: String
    let hashTags: [String]
    let linkUrl: String

    //イニシャライザ
    init(id: Int, title: String, category: String, publishedDate: String, catchCopy: String, detailText: String, hashTags: [String], linkUrl: String) {
        self.id            = id
        self.title         = title
        self.category      = category
        self.publishedDate = publishedDate
        self.catchCopy     = catchCopy
        self.detailText    = detailText
        self.hashTags      = hashTags
        self.linkUrl       = linkUrl
    }

    static func getSampleData() -> Article {
        return Article(
            id: 1,
            title: "クリスマスの美味しいディナーを彩る焼肉の魅力とは？ご飯にもお酒にも相性抜群の最高の組み合わせ！",
            category: "クリスマスの食卓",
            publishedDate: "2017.12.09",
            catchCopy: "特別な日のディナーの代名詞はやっぱり焼肉！",
            detailText: "こちらの記事は2017 Swift Advent Calendar9日目の記事になります。今回は前に前編・後編の2本立てでお送りした「できるだけUI系のライブラリを用いないアニメーションを盛り込んだサンプル実装まとめ」の番外編として、この記事で紹介しているサンプル実装に類似した動きをSwift4系に対応したUIライブラリを活用して実装をした事例の紹介になります。\n導入の手順や実装に関してもさほど大きく既存のUIKitの実装に乖離しないものを選んで実装したつもりなので、皆様の参考になれば嬉しく思います。\nそして記事の公開がギリギリになってしまって大変申し訳ございませんでした。引き続き様々な綺麗かつコンテンツにびったしと合う様なUIの研究に今後も精進していきたいと思いますので、何卒よろしくお願い致します。\n（この記事はサンプルです、すみません...。そしてリンクURLはこのサンプルになります。）\nUIまわりの実装は迷うことや組み合わせで迷う部分が多々ある部分でもありますし、またUIへの細部のこだわりによって結果的に冗長なコードになってしまうデメリットもあるかもしれません。しかしながら、ライブラリの特性や使い方を理解した上で活用することで彩りのある気持ちの良いUI作成の一助にできるケースも数多くあるので、その点を踏まえてのライブラリの精査や検証を行う事でより楽しいUI開発ができると考えております。\n（本当は中の実装まできっちり追えるとさらに楽しいと思います。）",
            hashTags: ["#牛肉", "#焼肉", "#フルコース", "#ぜいたく", "#A5ランク"],
            linkUrl: "https://github.com/fumiyasac/MixedUILibrariesSample"
        )
    }
}

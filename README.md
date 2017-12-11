# MixedUILibrariesSample 
[ING]Swift4でUIライブラリを組み合わせて作成したUIサンプル（iOS Sample Study: Swift）


できるだけUI系のライブラリを用いないでアニメーションを盛り込んだサンプルの実装に関する紹介をしたのですが、今回の記事はその番外編として動きやアニメーションが美しいライブラリを活用してUIを構築した際の事についての紹介記事になります。

### ライブラリを用いて作成した機能一覧

+ チュートリアル画面のステップインジケーター
+ カバーフロー型のフォトギャラリー
+ 奥行きのあるレイアウトのUICollectionView
+ スクロールに合わせて画像のパララックス表現
+ レーティング表示部分及びハッシュタグやリンク等

### 本サンプルの画面キャプチャ

#### 画面キャプチャその1

![今回のサンプルの画面一覧その1](https://camo.qiitausercontent.com/fdf5600daa0a3bf5f6f101ca4da8202d5547ea20/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f31373430302f37653034373663622d633531622d616339342d346264372d6262366565336636343631612e6a706567)

#### 画面キャプチャその2

![今回のサンプルの画面一覧その2](https://camo.qiitausercontent.com/a9ef0fe26d4eec5b949430f751b8f23a513581ba/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f31373430302f31643231323963322d343265302d636363622d656165302d3433396565353234653361302e6a706567)

### 使用ライブラリ

このリポジトリのサンプルで使用したライブラリ一覧は下記になります。

+ [FlexibleSteppedProgressBar](https://github.com/amratab/FlexibleSteppedProgressBar)  → チュートリアルでよくあるステップインジケーターを表示するライブラリ
+ [VegaScrollFlowLayout](https://github.com/AppliKeySolutions/VegaScroll)  → 奥行きのあるようなスクロールをするUICollectionViewのFlowLayoutをカスタマイズしたライブラリ
+ [FSPagerView](https://github.com/WenchaoD/FSPagerView)  → 様々なスクロール表現をするライブラリ
+ [ParallaxHeader](https://github.com/romansorochak/ParallaxHeader)  → UITableViewのヘッダー部分をスクロール量に応じてパララックス表示をするライブラリ
+ [AMScrollingNavbar](https://github.com/andreamazz/AMScrollingNavbar)  → スクロールの変化量に合わせてNavigationBarを折りたたむ表現をするライブラリ
+ [Cosmos](https://github.com/evgenyneu/Cosmos)  → 評価のレーティング表示を扱いやすくするライブラリ
+ [ActiveLabel](https://github.com/optonaut/ActiveLabel.swift)  → URLやハッシュタグのリンク表示を扱いやすくするライブラリ
+ [FontAwesome.swift](https://github.com/thii/FontAwesome.swift)  → 「Font Awesome」アイコンの利用

このサンプル全体の詳細解説とポイントをまとめたものは下記に掲載しております。

+ (Qiita) https://github.com/fumiyasac/MixedUILibrariesSample 


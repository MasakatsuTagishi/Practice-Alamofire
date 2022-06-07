# Practice-Alamofire
## 概要
GitHubのRepositoryを検索するアプリです。
## アプリの仕様
https://user-images.githubusercontent.com/83049586/172304446-cb4129b8-a834-4e1f-a618-41d408cde64a.MP4
### 環境
- IDE : Xcode 13.4.1
- Swift : Swift 5.6.1
- 開発ターゲット : iOS 15.5
### ライブラリ
- Alamofire : 5.6.1
- SDWebImage : 5.12.5
### 動作
1. キーワードを入力する。
2. GitHubAPIでレポジトリーを検索し、結果を一覧表示する。
3. Cellをタップすると、GitHubのレポジトリーにアクセスする。
## ハマったポイント
- **ネストした構造体(Repository型)をCodingKeyに準拠させる方法がわからず、時間を消費した。**  
→ ネットで調べ、それぞれの構造体をCodingKeyに準拠させることで解決。

- **TableViewCellのオートレイアウトの制約が煩雑になっている。**  
後日学習する。[Understanding Auto Layout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html)

- **tableViewに結果の一覧表示が反映されず、時間を消費した。**  
  ```swift
  tableView.dataSource = self
  ```  
  dataSourceのつけ忘れに気づきませんでした。反省...
## 参考にした記事
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [GithubAPIでリポジトリをカスタムセルで、一覧表示させてみた](https://qiita.com/SHOBLOG/items/5083e43558581cbf0dee)
- [【Swift】AlamofireでAPI通信をする](https://qiita.com/REON/items/094d1b8bc7e59ea44a34)
- [この複雑なネストされたJsonを解析する方法](https://stackoverflow.com/questions/65154085/how-to-parse-this-complex-nested-json)

% ○○システム 基本設計書
% ××社
% 2015年1月

# 文書概要
この文書では、○○システムの各機能の基本的な設計を記述する。

# 開発環境
開発に用いるソフトウェアは主に以下である。

| 分類 | 名称 | 説明 |
|:-------|:--------|:-------|
| OS | Windows 7 | 開発マシンのオペレーティングシステム |
| IDE | Visual Studio 2012 | プログラムの記述等を行う統合開発環境 |
| DB | SQL Server 2012 Developer Edition | 開発時に使用するデータベース |

# 機能設計
## ログイン
### 概要
ユーザーのログイン認証を行い、成功した場合はメニュー画面に遷移する。

### 画面イメージ
![ログイン画面](ログイン画面.png)

### イベント
#### ログインボタンクリック
ログインボタンがクリックされた場合の処理は以下とする。

- 入力チェックを行う
- ログイン認証を行う
- メモリ内にログイン情報を保持する
- メニュー画面に遷移する

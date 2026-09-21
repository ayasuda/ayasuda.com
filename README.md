# ayasuda.com

## How to add post

hugo おサイト読むのよ


## Rules of post title

* `introduction_`: this post describes a introduction of tools, application, framework or else.
* `what_is_`: this post describes a feature of language, patterns, technics, or else.

## 記事の翻訳と言語切り替え

Hugo 0.147.8 の標準の multilingual 機能を利用します。
日本語がデフォルトで、既存の `content/pages/foo.md` と `/pages/foo/` はそのままです。
英語版を追加するときは、同じ場所に `foo.en.md` を置きます。英語版は `/en/pages/foo/` になります。
ページバンドルでは `index.md` と `index.en.md` を使います。
翻訳元の `url` をそのままコピーせず、通常は Hugo に URL を生成させてください。

公開対象の翻訳が存在する記事だけ、タイトル・メタ情報の下に「日本語 / English」を表示します。
現在の言語は太字で示し、`hideMeta: true` の記事でも切り替えは表示します。
英語版が draft または未来の公開日の場合、通常の本番ビルドでは表示しません。
翻訳の対応とリンク先は `.AllTranslations` と `.RelPermalink` から取得します。

PaperMod はサブモジュールのまま変更せず、サイト側で次のテンプレートを上書きしています。

- `layouts/_default/single.html`: 言語切り替えをメタ情報の表示条件の外に配置。
- `layouts/partials/translation_list.html`: 記事に対応する言語だけ表示。
- `layouts/partials/header.html`: 未翻訳の記事にも表示されるサイト全体の言語リンクを除去。

テーマ更新時は、上書きした single/header とテーマ側の差分も確認してください。
言語設定により英語ホーム・フィード等も生成されますが、既存記事の英訳は追加していません。

検証（PowerShell 7、Hugo 0.147.8、テーマ取得済みの環境）:

```powershell
hugo
./tests/multilingual.ps1 -Hugo (Get-Command hugo).Source
```

テスト用の翻訳は一時フォルダーにのみ生成され、サイトの記事には追加されません。

公式資料: https://gohugo.io/content-management/multilingual/

# 同人誌テンプレート

LaTeXで同人誌を作成するための[テンプレート](https://github.com/a-skua/book-template)です．

## 環境構築

1. LaTeX Liveのインストール
   - [macOS](https://www.tug.org/mactex/mactex-download.html) : 時間かかります
   - `brew`でもインストールできる?
2. Ghostscriptのインストール
   - グレースケール画像を作成するのに使用しています．
   - macOS
     ```sh
     brew install gs
     ```
3. PDF Tookitのインストール
   - メタデータの編集に使用 (代替方法あれば使うのやめたい)
   - macOS
     ```sh
     brew install pdftk-java
     ```

## ビルド

```sh
make
```

`example.pdf`が生成されます．

### クリーン

```sh
make clean
```

### プレビュー

```sh
make prevew TEX=src/example.tex
```

`preview/example.tex.pdf`が生成されます．
章単位でビルド内容を確認したい場合に使用してください．

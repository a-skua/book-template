# 同人誌テンプレート

LaTeXで同人誌を作成することを目的とした[テンプレート](https://github.com/a-skua/book-template)です．
JIS規格のB5(182mm x 257mm)のサイズで作成することを想定しています．

## 環境構築

1. [TeX Live](https://www.tug.org/texlive/)のインストール
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

### はじめにやること

- [ ] [src/_config.tex](./src/_config.tex)にタイトル，著者，発行日などを設定
- [ ] [Makefile](./Makefile)の`FILENAME`を書き換える
- [ ] [METADATA.txt](./METADATA.txt)の`InfoKey`を書き換える
- [ ] [src/cover_a.d/cover_a.jpg](./src/cover_a.d/cover_a.jpg)と[src/cover_z.d/cover_z.jpg](./src/cover_z.d/cover_z.jpg)を差し替える
  - 182mm x 257mmに余白3mmを追加した 188mm x 263mmの画像を用意してください．
  - 電子版用なので，192dpi程度の解像度で十分です．

## ビルド

```sh
make
```

`$FILENAME.pdf`が生成されます．

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

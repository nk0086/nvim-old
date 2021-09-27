# nvim
neovim 用の設定ファイルです。  
パスとかはいい感じに変更してください。
## init.vim
vim の基本的な設定。  
キーマッピングや dein.toml に記述されたプラグインを入れたりします。
(一番最後にAtCoderのジャッジ用の設定がありますが、それ用のPythonファイルはnvim_settigns内にまだ入れてません)
## dein.toml & dein_lazy.toml  
dein: 常に使いたいプラグインを記述  
dein_lazy: 言語ごとのプラグイン等を記述  
Shougo さんの [dein.vim](https://github.com/Shougo/dein.vim) でプラグイン管理してます。
coc は主に補完用に入れています。追加で[ここ](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions)から自分の使う言語に合わせてインストールする必要があります。  
私はcoc-neosnippet, coc-json, coc-rls を入れて使っています。
## neosnippet-snippets
主に AtCoder で使うスニペットを管理しています。 (Rustのみ)  

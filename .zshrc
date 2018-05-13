#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#
# Copyright (c) 2018 Alice1017
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# GENERAL SECTION

# Compile
zcompile ~/.zshrc

# Global variables
export EDITOR="vim"
export SHELL="/bin/zsh"
export TERM="xterm-256color"
export LANG="ja_JP.UTF-8"
export ZDIR="$HOME/dotfiles/zsh"

# Variables
export sessions=$HOME/.tmux/sessions

# Setting unset options
unsetopt flow_control     # (shell editor 内で) C-s, C-q を無効にする
unsetopt no_clobber       # リダイレクトで上書きする事を許可しない。

# Setting options
#   - about directory
setopt auto_pushd         # 普通に cd するときにもディレクトリスタックにそのディレクトリを入れる
setopt pushd_ignore_dups  # ディレクトリスタックに重複する物は古い方を削除
setopt pushd_silent       # pushd,popdの度にディレクトリスタックの中身を表示しない
setopt auto_name_dirs     # ~$var でディレクトリにアクセス
setopt cdable_vars        # cd ~var の ~を省略
setopt auto_param_slash   # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt path_dirs          # コマンド名に / が含まれているとき PATH 中のサブディレクトリを探す

#  - about job
setopt long_list_jobs     # 内部コマンド jobs の出力をデフォルトで jobs -L にする
setopt no_hup             # ログアウト時にバックグラウンドジョブをkillしない
setopt notify             # バックグラウンドジョブが終了したら(プロンプトの表示を待たずに)すぐに知らせる

#  - another
setopt no_beep            # コマンド入力エラーでBeepを鳴らさない
setopt extended_glob      # 拡張グロブを有効にする
setopt brace_ccl          # ブレース展開機能を有効にする
setopt equals             # =COMMAND を COMMAND のパス名に展開
setopt numeric_glob_sort  # 数字を数値と解釈してソートする
setopt no_flow_control    # C-s/C-q によるフロー制御を使わない
setopt hash_cmds          # 各コマンドが実行されるときにパスをハッシュに入れる
setopt magic_equal_subst  # コマンドラインの引数で --PREFIX=/USR などの = 以降でも補完できる
setopt multios            # 複数のリダイレクトやパイプなど、必要に応じて TEE や CAT の機能が使われる
setopt short_loops        # FOR, REPEAT, SELECT, IF, FUNCTION などで簡略文法が使えるようになる
setopt always_last_prompt # カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt sh_word_split      # クォートされていない変数拡張が行われたあとで、フィールド分割
setopt rm_star_wait       # rm * を実行する前に確認
setopt no_unset           # 未定義変数の使用禁止


# PATH SECTION
source $ZDIR/path.zsh

# ALIAS SECTION
source $ZDIR/alias.zsh

# COMPLETION SECTION
source $ZDIR/completion.zsh

# HISTORY SECTION
source $ZDIR/history.zsh

# PROMPT SECTION
source $ZDIR/prompt.zsh

# ANOTHER SECTION
source $ZDIR/another.zsh

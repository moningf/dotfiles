### =========================
###  powerlevel10k 优先响应
### =========================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### =========================
###  环境变量配置
### =========================
export PATH=$PATH:/home/moningf/.local/bin
# rust配置
. "$HOME/.cargo/env"


### =========================
###  Zsh 基础配置
### =========================

# 让历史记录更智能
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# 自动补全菜单
setopt AUTO_MENU
autoload -Uz compinit
compinit

#fzf 配置
source <(fzf --zsh)

#EDITOR 配置
export EDITOR=nvim
alias vim=nvim

#alias
alias ls="eza --long --git --icons"
alias td="nvim /home/moningf/todo.md"
alias op="opencode"
alias ta="tmux a"
alias tn="tmux new -s"
alias s="kitten ssh"

# =====================
# =====AI config=======
# =====================
# deepseekapi配置
# export DEEPSEEK_API_KEY=

# yazi 配置
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

### =========================
###  zinit 基础配置
### =========================

# 下载并加载zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# zinit的命令补全系统
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


### =========================
###  Zinit 附加模块（annex）
### =========================

# zinit附加模块
    # 监控插件性能
    # 安装gem,node,pip的辅助功能
    # 加速下载
    # rust插件辅助
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### =========================
###  插件加载
### =========================

# 启用语法高亮
zinit light zsh-users/zsh-syntax-highlighting

# 自动建议
zinit light zsh-users/zsh-autosuggestions

# 快速跳目录
zinit ice wait"1" lucid
zinit light rupa/z

# 主题 powerlevel10k
zinit ice depth"1" 
zinit light romkatv/powerlevel10k
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

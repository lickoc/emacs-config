# Emacs 配置

我的 Emacs 开发环境配置，基于 Emacs 30 + Fedora 44。

## 快速开始

### 前置依赖

```bash
# 字体
sudo dnf install jetbrains-mono-fonts-all

# LSP（可选，当前配置已禁用）
# sudo dnf install clangd
# rustup component add rust-analyzer
# pip3 install python-lsp-server

# Graphviz（Org Babel 画图用）
sudo dnf install graphviz
```

### 安装

```bash
# 1. 备份已有配置
mv ~/.emacs.d ~/.emacs.d.bak

# 2. 克隆配置
git clone https://github.com/你的用户名/你的仓库.git ~/.emacs.d

# 3. 安装 straight.el（首次启动自动安装）
emacs
```

首次启动会发生：
1. 自动安装 straight.el 包管理器
2. 自动拉取所有配置的包（ef-themes、vertico、consult、magit、projectile 等）
3. 安装 all-the-icons 字体：`M-x all-the-icons-install-fonts`

## 配置结构

| 文件 | 说明 |
|---|---|
| `early-init.el` | 早期初始化（GUI/GC/locale） |
| `init.el` | 入口文件，加载各模块 |
| `lisp/init-packages.el` | 包管理器（straight.el） |
| `lisp/init-ui.el` | 界面：主题（ef-night）、图标、centaur-tabs |
| `lisp/init-editor.el` | 编辑行为：缩进、行号、括号、剪贴板 |
| `lisp/init-completion.el` | 补全：vertico + consult + orderless |
| `lisp/init-keybinds.el` | 快捷键集中绑定 |
| `lisp/init-lsp.el` | LSP（当前已禁用） |
| `lisp/init-org.el` | Org-mode：笔记、org-superstar 美化 |
| `lisp/init-prog.el` | 编程语言配置 |
| `lisp/init-misc.el` | 杂项：projectile、magit、avy |

## 已安装的包

| 包 | 说明 |
|---|---|
| **ef-themes** | 主题（ef-night：深蓝灰底） |
| **all-the-icons** | 图标字体支持 |
| **emojify** | 彩色 emoji |
| **centaur-tabs** | 顶部标签栏（波浪样式） |
| **vertico** | minibuffer 补全菜单 |
| **orderless** | 模糊匹配引擎 |
| **consult** | 增强命令（M-x、C-x b 等） |
| **which-key** | 按键提示 |
| **expand-region** | 增量选择（C-=） |
| **rainbow-delimiters** | 括号颜色分層 |
| **hl-todo** | 高亮 TODO/FIXME |
| **projectile** | 项目管理（C-c p） |
| **magit** | Git 客户端（C-c m） |
| **org-superstar** | Org 标题美化 |
| **ace-window** | 分屏快速跳转（M-o） |
| **avy** | 跳转到屏幕任意位置（C-c j/w） |

## 快捷键速查

### 全局

| 快捷键 | 功能 |
|---|---|
| `M-x` | 执行命令（consult-M-x） |
| `C-x b` | 切换 buffer |
| `C-x C-f` | 在新 tab 打开文件 |
| `C-s` / `C-r` | 搜索（consult-line） |
| `M-y` | 贴贴板历史 |
| `M-g g` | 跳转到指定行 |
| `C-=` | 增量选择 |
| `C-@` | 设置标记 |
| `M-o` | 分屏跳转 |
| `C-c j` | 跳转到字符位置 |
| `C-c w` | 跳转到单词位置 |

### 搜索

| 快捷键 | 功能 |
|---|---|
| `C-c a p` | ripgrep 搜索 |
| `C-c a f` | find 搜索文件名 |
| `C-c a l` | locate 搜索 |

### 项目

| 快捷键 | 功能 |
|---|---|
| `C-c p p` | 切换项目 |
| `C-c p f` | 项目内找文件 |
| `C-c p s g` | 项目内搜索 |

### Git

| 快捷键 | 功能 |
|---|---|
| `C-c m s` | Magit 状态 |
| `C-c m p` | 推送当前分支 |
| `C-c m f` | 拉取远程 |

### Org

| 快捷键 | 功能 |
|---|---|
| `C-c c` | 捕获笔记 |
| `C-c a o` | Agenda |

### 标签栏

| 快捷键 | 功能 |
|---|---|
| `C-c t p` | 上一个标签 |
| `C-c t n` | 下一个标签 |

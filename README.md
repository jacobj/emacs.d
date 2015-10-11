# Introduction
This is my emacs config. It's split up into seperate init files and uses require-package to automatically install packages. It supports OS X and GNU/Linux.

# Install
- Requires Emacs ≥ 24.4, I prefer to use it with Emacs HEAD.
- In order to use `web-beautify` and `tern` you have to install them globally via [NPM](https://www.npmjs.com/):
`npm install -g js-beautify`
`npm install -g tern`
- For `jedi` completion to work properly run:
<kbd>M-x</kbd> `jedi:install-server`
- For comment spell checking make sure you have `aspell` or `ispell` installed.

# What's it look like?
![](https://raw.githubusercontent.com/jacobj/emacs.d/master/screenshot.png)

# What's in the box?
Settings for `evil-mode` because modal editing is swell.

Language settings for:
- **JavaScript** via `js2-mode` and `web-mode`
- **TypeScript** via `typescript-mode` and `tide`
- **Python** via `jedi` and `company-jedi`
- **Docker** via `dockerfile-mode`
- **Scala** via `scala2-mode`
- **R** via `ESS` featuring super sweet eval keybindings.
- **HTML & CSS** via `web-mode`
- **LaTeX** via AucTeX
- **MIPS ASM** because why not?
- **Arduino** via `arduino-mode`
- More to come!

Additional settings for:
- `helm` and `helm-projectile`
- `company`
- `git-gutter-mode`
- `linum`
- `solarized`
- `eshell` and `multi-term`
- `org-mode` and `deft`
- `flycheck`

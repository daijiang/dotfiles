dotfiles
========
My setting files. Not ready for others but you are welcome to tweak them for your own use.

When you want to update your setting, just `git pull` first and then run `bash symbollinks.sh`.

## vim
#### Install
`sudo apt-get install vim vim-gtk` to install full version of vim and Gvim.  
`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim` to install Vundle for package management.  
Then run `bash symbollink.sh`  to install vimrc.  
Then in Vim, `:PluginInstall` to install all packages.

- `,vs` to see white spaces.
- `,ev`  to open vimrc.
- `,s` to save the file.
- `,T` to insert current date and time.
- `/` to search.
- `,space`  to clear search.
- `,V` to switch to attraction-free (goyo pkg)
- `,L` to highlight only current line.

- citations: in insert mode, type `@author` then `C-x C-o` to get suggestions about keys, then use arrow key to navigate.
- easymotion: `,,w` to move to any word.

## Zotero set up: 

1. install: https://github.com/smathot/zotero_installer (will be done with reinstall.sh)
2. link with Dropbox:   ln -s ~/Dropbox/zotero/storage ~/.zotero/zotero/*.default/zotero/storage For Mac: ln -s ~/Dropbox/Zotero/storage ~/Library/Application\ Support/Zotero/Profiles/*.default/zotero/storage
3. Zotero preference
	- General: uncheck auto take snapshot; ubcheck auto tag items  
	- Sync: uncheck sync attachments files in my library using zotero  
	- Advanced--files and folders--linked attachment base directory: set to Dropbox/zotero/storage
	- install add-ons from Dropbox/zotero-addons: Tools--addons--install addons from file
4. zotfile preference:
	- format rename: {%a_}{%y_}{%j_}{%t}  
	- change to lower case;
	- make sure in general setting, check "attach stored copy of files".
5. lyz setting: lyx serve: add ~/.lyxpipe  
6. install Qnotero, then open its preferences, set zotero folder to ~/.zotero/zotero/*.default/zotero . To set a shortcut, open system setting of the computer, then -- keyboard -- shortcuts--custom shortcues, command is qnotero, set shortcut as alt+q

## Pandoc path
~~After install Pandoc with cabal, `cp ~/.cabal/bin/pandoc /usr/bin/pandoc` and `cp ~/.cabal/bin/pandoc-citeproc /usr/bin/pandoc-citeproc`.~~

Instead, we can just use the Pandoc shipped with Rstudio: 

	sudo ln -s /usr/lib/rstudio/bin/pandoc/pandoc /usr/local/bin
	sudo ln -s /usr/lib/rstudio/bin/pandoc/pandoc-citeproc /usr/local/bin


## snippet in snipMate

	snippet postrcode
		{% highlight r%}
		${1}
		{% endhighlight %}

	snippet postheader
		---
		layout: post
		title:  ${1}
		categories: [${2:notes}]
		tags: [${3}]
		---
		${4}

## default.bib in ~/.pandoc
If you do not have `.pandoc` folder in your home, create one. Then put your bib file there. In zotero, I use [AutoZotBib](http://www.rtwilson.com/academic/autozotbib) to do this. In the autozotbib reference, define the path as `~/.pandoc/default.bib`.

## my tweak theme in oh-my-zsh



dotfiles
========
My setting files. Not ready for others but you are welcome to tweak them for your own use.

Run `symbollinks.sh` to create dotfiles for 

- vimrc

## Zotero set up: 

1. install: https://github.com/smathot/zotero_installer (will be done with reinstall.sh)
2. link with Dropbox:   ln -s ~/Dropbox/zotero/storage ~/.zotero/zotero/*.default/zotero/storage
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
After install Pandoc with cabal, `cp ~/.cabal/bin/pandoc /usr/bin/pandoc` and `cp ~/.cabal/bin/pandoc-citeproc /usr/bin/pandoc-citeproc`.

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



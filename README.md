# oh-my-zsh-custom

This is just my .oh-my-zsh/custom folder, which is set by the original repo in .gitignore, so, if you want to track it, you have to do a ``git init`` inside custom, then push it up to your github. Then if you change machines or upgrade, you won't lose your customizations.

Keep the real ``.zshrc`` in the repo, but, symlink it where it needs to be, in ```~```, e.g.:

~~~bash
cd ~
ln -s .oh-my-zsh/custom/.zshrc
~~~

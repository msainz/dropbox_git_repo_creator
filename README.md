# Dropbox git repo creator

Dropbox can be a great alternative to GitHub if you want to hack away at a small project either alone or on a team of 2-3, without necessarily using up a private GitHub repo.

####Advantages

   * Lightweight
   * You can Dropbox-share the folder containing the git repo and clone it on your laptop, at home, etc...
   * Fast! 

####Caveat: 

   * When you do a push, your git objects get copied to your Dropbox
     folder and then Dropbox initiates its cloud-sync immediately. If
two people push at the same time you may be at risk of a race condition.
Make sure to communicate/coordinate with collaborators before pushing/pulling.

####Usage

Assuming you have the following two folders for storing your repos and working on them, respectively:

```
~/Dropbox/git/
~/workspace/
```

Place ```repo.thor``` in your home folder, and run
```
thor repo:create foobar
```
which will do the following:
```bash
mkdir ~/Dropbox/git/foobar
git init --bare ~/Dropbox/git/foobar/foobar.git
cd ~/workspace
mkdir foobar && cd foobar
touch README.md
git add .
git commit -m 'Initial Commit'
git remote add origin ~/Dropbox/git/foobar/foobar.git
git push -u origin master
echo "export foobar=~/workspace/foobar" >> ~/.bashrc
echo 'alias foobar="cd $foobar"' >> ~/.bashrc
```
####Thanks to
[Eduardo del Balso](https://github.com/edelbalso) for the idea



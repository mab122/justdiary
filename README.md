**justdiary** is very simple command line script letting you keep journal/diary/log in organized manner. Entries are stored as follows: `$DAIRY_PATH/YEAR/MONTH/DAY.txt`
```
$ justdairy just came home

$ cat ~/Diary/2019/12/31.txt
22:40 just came home
# example date and path

$ justdairy tomorrow: I need to pickup my mail
# adds entry to tomorrows file

$ justdairy tomorrow 14:30: dentists visit

$ justdairy yesterday
# opens yesterdays file in $EDITOR

$ justdairy yesterday:
# opens yesterdays file in $EDITOR
```
You can use whatever date format is recognizable by GNU coreutils `date` follow it with `: ` and write your note. If your note is empty, the script will open the `$EDITOR` on given date (file).

If you want to read entries from specific date to some other date. Learn to use `find` and maybe **regular expressions**.

---

I really liked using [jrnl.sh](http://jrnl.sh/), but I didn't like storing ALL of my entries in one freaking text file. I prefer  [Diary](https://github.com/billthefarmer/diary) app folder structure.

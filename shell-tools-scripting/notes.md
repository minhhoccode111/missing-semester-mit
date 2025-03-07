foo=bar -> assign variable
$foo -> access variable
'' -> string
"" -> also string
'$foo' - literally string
"$foo" - like `${foo}`
$1 - $9 - args
$0 - name
$@ - all
$# - args.length
$? - code prev command

$$
- pid
!! - last command - sudo !!
$_ - last arg last command

STDOUT - output
STDERR - errors

0 - OK
else - not OK

&&
||
;
true
false

command substitution
$( CMD )
process substitution
<( CMD )

for file in $(ls)

diff <(ls foo) <(ls bar)

for file in "$@"; do

grep foobar "$file" > /dev/null 2> /dev/null

if [[ $? -ne 0 ]]; then

echo "File $file does not have any foobar, adding one"

echo "# foobar" >> "$file"

[[]]
[]
bash
sh

globbing
wildcards
curly braces {}

?
*
rm foo?
rm foo*

..
a..h

convert image.{png,jpg}
convert image.png image.jpg

```bash
cp /path/to/file/{foo,bar,baz}.sh /newpath
cp /path/to/file/foo.sh /path/to/file/bar.sh /path/to/file/baz.sh /newpath
```

```bash
mv *{.py,.sh} folder
mv *.py *.sh folder
```

```bash
mkdir foo bar
touch {foo,bar}/{a..h}
touch foo/x bar/y
diff <(ls foo) <(ls bar)
```

shellcheck: https://github.com/koalaman/shellcheck

```bash
#!/usr/local/bin/python
import sys
for arg in reversed(sys.argv[1:]):
    print(arg)
```

pythong interpreter

shebang

env

$PATH

PATH

# !/usr/bin/env python

functions

export

<-- shell tools -->
$$

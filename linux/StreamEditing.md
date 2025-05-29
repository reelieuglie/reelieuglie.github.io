---
title: Parsing and Stream Editing
filename: StreamEditing.md
remote_theme: pages-themes/hacker@v0.2.0
kramdown:
  math_engine: mathjax
  syntax_highlighter: rouge
plugins:
- jekyll-remote-theme # add this line to the plugins list if you already have one
# Theme: https://github.com/pages-themes/hacker
---
# Stream Editing and Parsing
* Snippets for awk/sed/cut/tr/etc... to parse and edit files quickly and easily.

### Remove Blank Lines from a file
```
sed '/^$/d' $insertFilePathHere
```
### Find the field numbers for a CSV file (replace $csv_filename with the name and path of the .csv file)
```
cat $csv_filename| head -n 1 | tr ',' "\n" | cat -n
```
### Turn Epoch Timestamps into Human Readable
* This assumes a CSV,column `$5` is where the timestamp is, and it's got milliseconds (that's what substr is for). It will print simply column `$5`; adjust columns as needed. 
```
 awk -F, '{print $5=strftime("%c",substr($5,1,10))}
```

### grep for just `var`; like when searching for variables in a terraform template
```
grep -oE '\bvar.*\b'
```
* This can be combined to search in the variables file for all the variables in `main.tf`
```
for i in $(grep -oE '\bvar.*\b' main.tf | sed 's/var\./\n/g' | sed '/^$/d' | sed 's/[\[|\$|\"|\{|\}]//g' | sort | uniq); do grep $i ./variables.tf >/dev/null 2>&1 || echo "variable $i not declared in variables.tf"; done
```

### grep up to a number of alphanumeric characters
```
grep -oE 'i-[0-z]{0,17}'
```
*Note* That's for instance-ids

### diff between command outputs
```
diff <(command 1) <(command 2)
```

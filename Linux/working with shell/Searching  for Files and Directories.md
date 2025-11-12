# Searching for files and Directories

## locate
```sh
locate City.txt
```

**To locate the file you created recently or within the same terminal session, you need to
update the database, the database here is mlocate.db**

## updatedb
```sh
updatedb # need to be run as a root user and then run the locate command

locate Newfile
```

## find
```sh
find /home/michael -name City.txt
```

## To Seach Within Files
# GREP command

### The Most Popular command in Linux

```sh
cat sample.txt
```

## grep
```sh
grep second sample.txt

grep capital sample.txt
```

### GREP is case sensitive

## GREP Case Insensitive

## grep -i
```sh
grep -i capital sample.txt
```

## grep -r
```sh
grep -r "third line" /home/michael
```

## Print files lines that do not match
```sh
grep -v "printed" sample.txt
```


# GREP
**whole word example**
```sh
cat example.txt


grep exam example.txt
```

## grep -w
```sh
grep -w exam examples.txt
```

## grep -w & -v
```sh
grep -vw exam examples.txt
```

```sh
cat premier-league-table.txt
```

## grep -A
```sh
grep -A1 Arsenal premier-league-table.txt
```

## grep -B
```sh
grep -B1 4 premier-league-table.txt
```

### To search before and after
```sh
grep -A1 -B1 Chelsea premier-league-table.txt
```

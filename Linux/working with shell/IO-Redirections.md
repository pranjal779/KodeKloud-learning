# IO Redirection

## REDIRECT STDOUT

```sh
echo $SHELL > shell.txt

cat shell.txt

echo "This is ......." >> shell.txt

cat shell.txt
```

## REDIRECT STDERR

### use 2 for error
```sh
cat missing_file 2> error.txt

```

## To Append the message to an existing file use >>
```sh
cat missing_file 2>> shell.txt

cat shell.txt
```



**if you want your command to execute and not print error messages on the screen, even if
it generates a standard error, you can redirect to /dev/null like this**

```sh
cat missing_file 2> /dev/null
```

**```/dev/null``` is referred to as the bit bucket, the place where you dump anything you don't need,
in this case, the standard error, which we do not want to be printed on the screen.**


# COMMAND LINE PIPES
```sh
cat sample.txt

grep Hello Sample.txt > file.txt

less  file.txt
```

**command1 | command2**
```sh
grep Hello sample.txt | less

less sample.txt
```

**command line pipes "|" can be used as many times as possible to link togather commands as many times as possible**

```sh
echo $SHELL | tee shell.txt

cat shell.txt

echo "This is the bash shell" | tee -a shell.txt

cat shell.txt
```



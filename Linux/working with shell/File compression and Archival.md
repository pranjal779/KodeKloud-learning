# Viewing File Sizes
```sh
du -sk test.img

du -sh test.img

ls -lh test.img
```

# Archiving Files

## Tar

```tar -cf```

```sh
tar -cf test.tar file1 file2 file3

ls -ltr test.tar
```

# Compressing

## bizp2
```sh
bzip2 test.img

du -sh test.img.bz2
```

## gzip
```sh
gzip test1.img

du -sh test1.img.gz
```

## xz
```sh
xz test2.img

du -sh test2.img.xz
```


# Uncompressing

## bunzip2
```sh
bunzip2 test.img.bz2

du -sh test.img
```

## gunzip
```sh
gunzip test1.img.gz

du -sh test1.img
```

## unxz
```sh
unxz test2.img.xz

du -sh test2.img.xz
```

# Compressing files

## zcat / bzcat / xzcat

```sh
zcat hostfile.txt.bz2
```

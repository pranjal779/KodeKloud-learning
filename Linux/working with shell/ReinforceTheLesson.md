Perfect — these are **core Linux commands** every DevOps engineer must be comfortable with 👏

Let’s go over each group of commands from your notes with **clear explanations, examples, and small mental tricks** to remember them better.

---

## 🧱 Viewing File Sizes

| Command           | Explanation                                                                                      | Example                                                    |
| ----------------- | ------------------------------------------------------------------------------------------------ | ---------------------------------------------------------- |
| `du -sk test.img` | Shows file **size in KB**, summarized. (“-s” = summary, “-k” = kilobytes)                        | `du -sk test.img` → output like `1200 test.img`            |
| `du -sh test.img` | Shows file **size in human-readable format** (KB, MB, GB).                                       | `du -sh test.img` → `1.2M test.img`                        |
| `ls -lh test.img` | Lists file details, including size in readable form. (“-l” = long format, “-h” = human-readable) | `ls -lh test.img` → `-rw-r--r-- 1 user user 1.2M test.img` |

🧠 **Trick:**

> Use `du` to check actual disk usage, and `ls` to check file details.

---

## 📦 Archiving Files

### `tar`

Creates or extracts archives (collections of files).

| Command                              | Explanation                                                                              |
| ------------------------------------ | ---------------------------------------------------------------------------------------- |
| `tar -cf test.tar file1 file2 file3` | Create (`-c`) archive file (`-f`) named `test.tar` containing `file1`, `file2`, `file3`. |
| `tar -tf test.tar`                   | List (`-t`) the files in the archive.                                                    |
| `tar -xf test.tar`                   | Extract (`-x`) files from the archive.                                                   |

🧠 **Trick:**

> `c` = create, `t` = list, `x` = extract.

---

## 🗜️ Compression

Each tool compresses differently.

| Tool      | Command                                 | Notes                        |
| --------- | --------------------------------------- | ---------------------------- |
| **bzip2** | `bzip2 test.img` → makes `test.img.bz2` | Slow but good compression.   |
| **gzip**  | `gzip test1.img` → makes `test1.img.gz` | Fast and common.             |
| **xz**    | `xz test2.img` → makes `test2.img.xz`   | Very high compression ratio. |

🧠 **Trick:**

> “bzip2” is older, “gzip” is fast, “xz” is modern and very compact.

---

## 🔓 Uncompressing

| Tool                   | Command              | Result |
| ---------------------- | -------------------- | ------ |
| `bunzip2 test.img.bz2` | Restores `test.img`  |        |
| `gunzip test1.img.gz`  | Restores `test1.img` |        |
| `unxz test2.img.xz`    | Restores `test2.img` |        |

🧠 **Tip:**

> Each decompression tool starts with “un” or “bun” or “gun”.

---

## 🧰 View Compressed Files Without Extracting

| Command | Description               |
| ------- | ------------------------- |
| `zcat`  | View `.gz` file content.  |
| `bzcat` | View `.bz2` file content. |
| `xzcat` | View `.xz` file content.  |

Example:

```bash
zcat hostfile.txt.gz | grep "error"
```

---

## 🔍 Searching Within Files — `grep`

`grep` = **Global Regular Expression Print** → searches text.

### Basic Usage

```bash
grep "word" file.txt
```

### Flags to Remember:

| Option      | Meaning                                    | Example                        |
| ----------- | ------------------------------------------ | ------------------------------ |
| `-i`        | Case-insensitive                           | `grep -i "hello" sample.txt`   |
| `-r`        | Recursive (search in directories)          | `grep -r "error" /var/log/`    |
| `-v`        | Invert match (show lines **not** matching) | `grep -v "error" app.log`      |
| `-w`        | Match **whole words** only                 | `grep -w "app" config.txt`     |
| `-A N`      | Show N lines **after** match               | `grep -A1 "Error" log.txt`     |
| `-B N`      | Show N lines **before** match              | `grep -B1 "Error" log.txt`     |
| `-A N -B N` | Show N lines before **and** after          | `grep -A2 -B2 "Error" log.txt` |

---

### 🧠 GREP Memory Tricks

* `-i` → “ignore case”
* `-v` → “invert results”
* `-r` → “recursive” (entire folder)
* `-A`/`-B` → “After/Before lines”

---

### Practice Tip:

To reinforce GREP:

```bash
cat /var/log/syslog | grep -i "error"
cat /etc/passwd | grep -v "bash"
grep -r "root" /etc
```

---


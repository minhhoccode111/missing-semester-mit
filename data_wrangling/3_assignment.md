### REQUIREMENTS

To do in-place substitution it is quite tempting to do something like sed s/REGEX/SUBSTITUTION/ input.txt > input.txt. However this is a bad idea, why? Is this particular to sed? Use man sed to find out how to accomplish this.

Redirecting the output of a `sed` command back into the same input file (e.g., `sed 's/REGEX/SUBSTITUTION/' input.txt > input.txt`) is a bad idea because it will lead to **data loss** or a **corrupted file**. Here's why:

### Why It's a Bad Idea

1. **File Overwriting**: When you use `> input.txt` in your command, the shell opens `input.txt` for writing immediately, which truncates the file to zero length before `sed` reads from it. This means that by the time `sed` attempts to read from `input.txt`, the file is already empty, resulting in a loss of the original data.
2. **Data Corruption**: If `sed` does manage to read part of the file before it's truncated, you end up with a partially corrupted file, as the input file is being written to and read from simultaneously.

### Is This Particular to `sed`?

No, this issue is not particular to `sed`. This problem can occur with any command that attempts to read from and write to the same file at the same time using redirection. The truncation happens because of how shell redirection works, not specifically because of `sed`.

### How to Perform In-Place Substitution with `sed`

To safely modify the file in place, `sed` provides the `-i` (or `--in-place`) option, which edits the file directly. This option allows `sed` to handle the file modifications internally in a safe manner.

#### Using `-i` for In-Place Editing

```bash
sed -i 's/REGEX/SUBSTITUTION/' input.txt
```

- `-i`: This option tells `sed` to edit files in place.
- `'s/REGEX/SUBSTITUTION/'`: The substitution command, where `REGEX` is the regular expression to match, and `SUBSTITUTION` is the text to replace it with.
- `input.txt`: The file to be edited.

#### Optional Backup with `-i`

You can optionally create a backup of the original file by providing a suffix to the `-i` option. This is useful in case you want to preserve the original file before making changes.

```bash
sed -i.bak 's/REGEX/SUBSTITUTION/' input.txt
```

This command will edit `input.txt` in place and create a backup file named `input.txt.bak`.

### Summary

- Redirecting the output of `sed` directly back to the input file (`sed 's/REGEX/SUBSTITUTION/' input.txt > input.txt`) will result in data loss or corruption.
- This issue is due to how shell redirection works and is not specific to `sed`.
- Use `sed -i` for in-place editing to safely modify files.

[中文](./README.zh-CN.md)

# trash.sh
`trash.sh` is a script that serves as a safe alternative to `rm`, allowing for secure handling of files and directories by moving them to a trash bin instead of permanently deleting them.

If you use `trash.sh` as described below, `rm` essentially becomes `mv`. `trash.sh` handles moving items to the trash for you, so please be aware of this change!

## Installation

1. Download the `trash.sh` file to your user directory:
```bash
wget https://raw.githubusercontent.com/qqAys/trash.sh/main/trash.sh -O ~/trash.sh
```

2. Add execute permissions:
```bash
chmod +x ~/trash.sh
```

3. Add an alias (doesn't have to be `rm`) to your `.bashrc` or `.zshrc`:
```bash
echo 'alias rm="~/trash.sh"' >> ~/.bashrc
source ~/.bashrc
```

## Usage
### "Deleting" Files or Directories
To move files or directories to the trash, use the `rm` command as usual:

```bash
rm file1 file2 directory1
```

You will receive a confirmation prompt before "deletion."


### Emptying the Trash

**Emptying the trash involves calling `/bin/rm` with the `-rf` parameter to clear the `~/.trash` folder. This action is irreversible.**

To empty the trash, use the `-c` parameter:

```bash
rm -c
```
You will be prompted to confirm the emptying of the trash, and its contents will be displayed before deletion.

## Trash Structure
Files you "delete" will be renamed with the current timestamp and moved (`mv`) to the `~/.trash` folder. If you "delete" a directory, its contents will not be renamed. The structure of the trash looks like this:

```bash
$ tree .trash/

.trash/
├── test_dir_1-2024-06-18_09-10-12
│   └── test_file.txt
├── test_file_1.txt-2024-06-18_09-10-12
└── test_file_2.txt-2024-06-18_09-10-12

1 directory, 3 files
```

## Note ⚠️
Using `trash.sh` does not guarantee that data or files will be securely "deleted." You should still back up important data to ensure its safety.

## License
This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## Contributing
Please submit a pull request or open an issue to discuss your ideas.

[English](./README.md)

# trash.sh

`trash.sh` 是一个安全替代 `rm` 的脚本，用于安全处理文件和目录，执行 `rm` 会将它们移动到垃圾桶里，而不是永久删除。

如果你按照下述方法使用了 `trash.sh` ，本质上 `rm` 的操作不再是 `rm` ，而是 `mv` 。`trash.sh` 帮你完成了移至垃圾桶的操作，请您知悉这一点！


## 安装

1. 下载 `trash.sh` 文件至用户目录
```bash
wget https://raw.githubusercontent.com/qqAys/trash.sh/main/trash.sh -O ~/trash.sh
```

2. 加上执行权限
```bash
chmod +x ~/trash.sh
```

3. 在 `.bashrc` 或 `.zshrc` 中添加别名 (可以不是 `rm` )
```bash
echo 'alias rm="~/trash.sh"' >> ~/.bashrc
source ~/.bashrc
```


## 用法
### 将文件或目录“删除”

要将文件或目录移动到垃圾桶，像往常一样使用 `rm` 命令：
```bash
rm file1 file2 directory1
```
“删除”前，您会收到确认提示。


### 清空垃圾桶

**清空垃圾桶调用的是 `/bin/rm` 并加上 `-rf` 参数来清空 `~/.trash` 文件夹。此操作不可逆。**

要清空垃圾桶，请使用 `-c` 参数：
```bash
rm -c
```
垃圾桶会被您一览无余，并被提示确认清空操作。


## 垃圾桶结构

您“删除”的文件将会被重命名加上当前时间，并移动 (`mv`) 至 `~/.trash` 文件夹内。这个如果您“删除”的是文件夹，则文件夹的内容不会被重命名，垃圾桶的结构看起来像下面的样子：
```bash
$ tree .trash/

.trash/
├── test_dir_1-2024-06-18_09-10-12
│   └── test_file.txt
├── test_file_1.txt-2024-06-18_09-10-12
└── test_file_2.txt-2024-06-18_09-10-12

1 directory, 3 files
```

## 注意事项⚠️

使用了 `trash.sh` 并不代表数据或文件可以高枕无忧的被“删除”，您仍然需要备份重要的数据，确保万无一失。

## 许可证

这个项目采用 MIT 许可证 - 详情见 [LICENSE](./LICENSE) 文件。

## 贡献

请提交 PR 或打开 issue 来讨论您的想法。

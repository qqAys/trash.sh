#!/bin/bash

# 垃圾桶
TRASH_DIR=~/.trash

# 如果不存在垃圾桶
if [ ! -d "$TRASH_DIR" ]; then
    mkdir -p "$TRASH_DIR"
fi

# 构建时间
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# 清空垃圾桶
if [ "$1" == "-c" ]; then
    FILE_COUNT=$(find "$TRASH_DIR" -type f | wc -l)
    DIR_COUNT=$(find "$TRASH_DIR" -type d | wc -l)
    TOTAL_SIZE=$(du -sh "$TRASH_DIR" | cut -f1)
    ((DIR_COUNT--))

    echo "Trash:"
    echo "$FILE_COUNT files"
    echo "$DIR_COUNT directories"
    echo "Total size: $TOTAL_SIZE"

    echo -n "Are you sure you want to clear the trash? [Y/N]: "
    read -r CONFIRM
    if [ "$CONFIRM" == "Y" ] || [ "$CONFIRM" == "y" ]; then
        /bin/rm -rf "$TRASH_DIR"/*
        echo "Trash cleared."
    else
        echo "Operation cancelled."
    fi
    exit 0
fi

# 判断非空
if [ "${#@}" -eq 0 ]; then
    echo "No files or directories provided."
    exit 1
fi

# 显示预移动的文件或文件夹
for FILE in "$@"; do
    if [ -e "$FILE" ]; then
        echo "Files and directories to be moved to trash:"
        if [ -d "$FILE" ]; then
            echo "Directory: $FILE"
        else
            echo "File: $FILE"
        fi
    else
        echo "Warning: $FILE does not exist."
        exit 0
    fi
done

# 确认操作
echo -n "Are you sure you want to move the above items to the trash? [Y/N]: "
read -r CONFIRM_MOVE
if [ "$CONFIRM_MOVE" != "Y" ] && [ "$CONFIRM_MOVE" != "y" ]; then
    echo "Operation cancelled."
    exit 0
fi

# 移动每个文件或文件夹到垃圾桶，并加上时间
for FILE in "$@"; do
    if [ -e "$FILE" ]; then
        BASENAME=$(basename "$FILE")
        # 判断文件夹
        if [ -d "$FILE" ]; then
            mv "$FILE" "$TRASH_DIR/$BASENAME-$TIMESTAMP"
            echo "Moved directory $FILE to $TRASH_DIR/$BASENAME-$TIMESTAMP"
        else
            mv "$FILE" "$TRASH_DIR/$BASENAME-$TIMESTAMP"
            echo "Moved file $FILE to $TRASH_DIR/$BASENAME-$TIMESTAMP"
        fi
    else
        echo "Warning: $FILE does not exist."
    fi
done

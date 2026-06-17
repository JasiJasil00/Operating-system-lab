
# Stage 2: Understanding the eXpFS Filesystem

## Objective

Learn how the **eXperimental File System (eXpFS)** works and how to use the **XFS Interface** to:

* Format the XSM disk
* Load data and executable files
* Export files back to UNIX
* Examine filesystem metadata
* Understand disk structures:

  * Inode Table
  * Root File
  * Disk Free List
  * User Table

---

# 1. eXpFS Overview

eXpFS is the filesystem used by eXpOS.

The XSM disk contains:

* **512 blocks**
* Each block stores **512 words**
* Total disk size = 512 × 512 words

Files are stored as collections of disk blocks.

eXpFS hides block allocation details from application programs.

---

# 2. File Types

There are three file types.

| Type | Description                  |
| ---- | ---------------------------- |
| ROOT | Stores metadata of all files |
| DATA | Normal user data files       |
| EXEC | Executable program files     |

---

# 3. Root File

The root file acts like a directory.

### Root Entry Format

| Field      | Description            |
| ---------- | ---------------------- |
| File Name  | Name of file           |
| File Size  | Size in words          |
| File Type  | ROOT / DATA / EXEC     |
| Username   | Owner                  |
| Permission | Open(1) / Exclusive(0) |

Example:

| File Name    | Size | Type |
| ------------ | ---- | ---- |
| root         | 512  | ROOT |
| sample.dat   | 19   | DATA |
| program.xexe | 1025 | EXEC |

### Important

* Root File is stored in **Disk Block 5**
* Maximum entries = **60**
* Root entry index must match inode entry index

Example:

```
Inode Entry 7  <--> Root Entry 7
```

---

# 4. Inode Table

The inode table stores physical information about files.

Stored in:

```
Disk Blocks 3 and 4
```

Maximum entries:

```
MAX_FILE_NUM = 60
```

Maximum blocks per file:

```
MAX_FILE_BLOCKS = 4
```

Maximum file size:

```
MAX_FILE_SIZE = 2048 words
```

---

## Inode Entry Format

| Field        | Description       |
| ------------ | ----------------- |
| File Type    | ROOT/DATA/EXEC    |
| File Name    | Name              |
| File Size    | Size in words     |
| User ID      | Owner ID          |
| Permission   | Access permission |
| Data Block 1 | First block       |
| Data Block 2 | Second block      |
| Data Block 3 | Third block       |
| Data Block 4 | Fourth block      |

Unused data blocks contain:

```
-1
```

Example:

```
2
sample.dat
19
1
1
-1
-1
-1
69
-1
-1
-1
...
```

Meaning:

* File Type = DATA
* Name = sample.dat
* Size = 19 words
* Owner = root (userid = 1)
* Stored in block 69

---

# 5. Disk Free List

Tracks used and free blocks.

Stored in:

```
Disk Block 2
```

Format:

| Value | Meaning |
| ----- | ------- |
| 0     | Free    |
| 1     | Used    |

After formatting:

```
Blocks 0-68 -> Used
Blocks 69-511 -> Free
```

Example:

```
69 -> 1
```

means block 69 is allocated.

---

# 6. User Table

Stores user accounts.

Maximum users:

```
MAX_USER_NUM = 16
```

Stored after the inode table.

---

## User Entry Format

| Field              | Description |
| ------------------ | ----------- |
| Username           | User name   |
| Encrypted Password | Password    |

Special users:

| User   | ID |
| ------ | -- |
| kernel | 0  |
| root   | 1  |

Default root password:

```
root
```

(encrypted internally)

---

# 7. XFS Interface

Launch:

```bash
cd $HOME/myexpos/xfs-interface
./xfs-interface
```

Single command mode:

```bash
./xfs-interface <command>
```

---

# 8. Important Commands

## Format Disk

```bash
fdisk
```

Creates or formats:

```
disk.xfs
```

Initializes:

* Disk Free List
* Inode Table
* Root File
* User Table

---

## List Files

```bash
ls
```

Displays files present in eXpFS.

---

## Display Disk Free List

```bash
df
```

Shows used/free blocks.

---

## Load Data File

```bash
load --data <path>
```

Example:

```bash
load --data $HOME/myexpos/sample.dat
```

Effects:

1. Allocates disk block(s)
2. Updates free list
3. Creates inode entry
4. Creates root entry

---

## Load Executable

```bash
load --exec <path>
```

Example:

```bash
load --exec test.xexe
```

Creates an EXEC file entry.

---

## Export Data File

```bash
export sample.dat output.txt
```

Copies file from eXpFS → UNIX.

---

## Remove File

```bash
rm sample.dat
```

Deletes:

* Root entry
* Inode entry
* Data blocks

Updates free list.

---

## Display File Contents

```bash
cat sample.dat
```

Shows contents of file stored in eXpFS.

---

## Copy Disk Blocks

```bash
copy <start_block> <end_block> <output_file>
```

Example:

```bash
copy 3 4 inode_table.txt
```

Copies inode table blocks.

---

## Dump Inode Table

```bash
dump --inodeusertable
```

Output:

```
inodeusertable.txt
```

---

## Dump Root File

```bash
dump --rootfile
```

Output:

```
rootfile.txt
```

---

# 9. Sample Workflow

### Format Disk

```bash
fdisk
```

### Load File

```bash
load --data $HOME/myexpos/sample.dat
```

### Verify File

```bash
ls
```

### Check Allocation

```bash
df
```

### Dump Inode Table

```bash
dump --inodeusertable
```

### Dump Root File

```bash
dump --rootfile
```

### Export File

```bash
export sample.dat output.txt
```

### Delete File

```bash
rm sample.dat
```

---

# 10. Why Both Inode Table and Root File?

### Inode Table

* Kernel-only structure
* Contains actual disk block locations

### Root File

* Accessible through filesystem operations
* Allows user programs to search files

Therefore:

```
Root File -> User-level metadata
Inode Table -> Kernel-level metadata
```

Both are required.

---

# Stage 2 Assignments

## Assignment 1

Copy the Root File:

```bash
copy 5 5 root_file.txt
```

or

```bash
dump --rootfile
```

Verify that `sample.dat` has an entry.

---

## Assignment 2

Delete:

```bash
rm sample.dat
```

Verify changes in:

* Inode Table
* Root File
* Disk Free List

Expected:

* File entries become unused (`-1`)
* Allocated block becomes free (`0`) in Disk Free List

---

## Key Facts to Remember for Viva

1. Disk size = **512 blocks**
2. Block size = **512 words**
3. Root File = **Block 5**
4. Inode Table = **Blocks 3-4**
5. Disk Free List = **Block 2**
6. Max files = **60**
7. Max file blocks = **4**
8. Max file size = **2048 words**
9. kernel userid = **0**
10. root userid = **1**
11. Inode index must equal Root File index.
12. `fdisk` initializes filesystem structures.

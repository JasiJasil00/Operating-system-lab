# Experimental Operating System (eXpOS)

This repository contains my implementation of an Experimental Operating System (eXpOS) as part of the Operating Systems Lab at NITC. The project is developed using the **eXpOS toolchain**, which includes the **XSM machine** and the **XFS file system interface**.

---

## 🛠 Tools Used

- **XSM (eXperimental String Machine)** — A simulated machine for OS development
- **XFS Interface** — Custom filesystem interface for managing files in the XSM disk
- **xsm** and **xfs-interface** tools provided by eXpOS

---

## 📈 Progress Roadmap (Stages)

### ✅ Stage 1: Basic Familiarity

- Installed and configured the eXpOS toolchain
- Understood disk structure, boot process, and shell basics
- Loaded and tested sample programs in the XSM machine
- Learned usage of `xfs-interface` and basic shell commands (`ls`, `rm`, `df`, etc.)

### ✅ Stage 2: File Deletion using XFS Interface

- Deleted files (e.g., `sample.dat`) using `rm` command in the `xfs-interface`
- Verified changes in:
  - **Inode Table** — Inode status and filename entry removed
  - **Root File** — Entry for the file removed
  - **Disk Free List** — Blocks previously occupied are now marked free
- Understood file management at the filesystem level

---

## 📂 Folder Structure


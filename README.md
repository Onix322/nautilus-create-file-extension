# Nautilus Create File Extension
### Made to solve the problem of creating files from gui (context menu) interface
## Installation
This project uses GTK4 and libnautilus-extension-4. To keep the source tree clean, all build artifacts are stored in the out/ directory.

## Prerequisites
Ensure you have the development libraries installed:

```bash
sudo pacman -Syu base-devel cmake gtk4 libnautilus-extension kitty nautilus policykit
```

## Quick Start
The easiest way to build, install, and test the extension is by using the provided deployment script. This script handles sudo authentication, compiles the code into the out/ folder, installs the .so binary, and restarts Nautilus.

```bash
git clone https://github.com/Onix322/nautilus-create-file-extension.git
cd nautilus-create-file-extension
chmod +x install.sh
./install.sh
```

## Development & IDE Support
Usually compile_commands.json file is linked automatically by install.sh but if not you can link it to the root directory:

```bash
ln -s out/compile_commands.json .
```

## Manual Build
If you prefer to run the steps manually:

### Configure:

```bash
cmake -S . -B out -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
```

### Build:
```bash
cmake --build out
```

### Install:

```bash
sudo cmake --install out
```

### Restart Nautilus:

```bash
nautilus -q && nautilus &
```


#!/bin/bash

# 1. Request sudo privileges at the start
echo "🔐 Admin privileges required for installation..."
sudo -v

if sudo -n true 2>/dev/null; then
    echo "✅ Admin privileges already active. Proceeding..."
else
    echo "🔑 Password required. Please authenticate:"
    sudo -v
    if [ $? -ne 0 ]; then
        echo "❌ Authentication failed. Exiting script."
        exit 1
    fi
fi

# 2. Build process (keeping everything inside 'out')
echo "🔨 Building project..."
cmake -S . -B out -DCMAKE_EXPORT_COMPILE_COMMANDS=ON 
cmake --build out

# Check if build succeeded
if [ $? -ne 0 ]; then
    echo "❌ Build failed. Please check your code."
    exit 1
fi

# 3. Installation
echo "📦 Copying binary to Nautilus extensions folder..."
sudo cp out/libnautilus_ext.so /usr/lib/nautilus/extensions-4/

# 4. Restart Nautilus to apply changes
echo "🔄 Restarting Nautilus..."
nautilus -q

echo "✅ Success! Extension installed and Nautilus restarted."

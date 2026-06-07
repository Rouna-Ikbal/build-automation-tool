#!/bin/bash

function clean_build(){
    rm -f build/app
}

mkdir -p build
mkdir -p logs

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOGFILE="logs/build_$TIMESTAMP.log"

echo "====================="
echo "BUILD AUTOMATION TOOL"
echo "====================="

echo ""Cleaning old build...
clean_build

echo "Compiling source files..."
echo "Build Time: $(date)"

gcc src/*.c -Iinclude -o build/app > "$LOGFILE" 2>&1

if [ $? -eq 0 ]
then
    echo "Build Successful"
    echo "Build log: $LOGFILE"
else
    echo "Build Failed"
    echo "Check log file: $LOGFILE"
    exit 1
fi 

echo "Running Application..."

./build/app

echo "====================="
echo "   Build Completed   "
echo "====================="

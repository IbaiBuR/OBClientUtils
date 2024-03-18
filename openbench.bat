@echo off

set THREADS="%1"
set SERVER="%2"
set USERNAME="%3"
set PASSWORD="%4"
set REPO="%5"

REM Install dependencies via chocolatey
choco install make winlibs rust golang -y

REM Refresh environtment variables
@RefreshEnv.cmd

REM Clone client and install dependencies
git clone "%REPO"
cd OpenBench\Client
python -m pip install -r requirements.txt

REM Run worker
python .\client.py -U "%USERNAME" -P "%PASSWORD" -S "%SERVER" --clean -N 1 -T "%THREADS"

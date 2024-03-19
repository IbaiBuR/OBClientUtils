# Introduction
This repository contains bash/batch scripts that I use to launch the [OpenBench](https://github.com/AndyGrant/OpenBench) on Virtual Machines.

# Running

## Windows

```cmd
.\openbench.bat <threads> <server> <username> <password> <repo>
```

## Linux

```bash
./openbench.sh <threads> <server> <username> <password> <repo>
```

# Sample invocation

For example, to run it on Windows for the [main instance](http://chess.grantnet.us/index) of OpenBench with 4 threads

```cmd
.\openbench.bat 4 http://chess.grantnet.us/ <username> <password> https://github.com/AndyGrant/OpenBench.git
```

# Disclaimer

Of course, you shouldn't launch the scripts every time you want to run the client if you are doing it locally. They are intented to be used in Virtual Machines with time limit.

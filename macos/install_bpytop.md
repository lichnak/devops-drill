# Install bpytop

Not just the bpytop tool is impressive, but it offers tons of features. Here is a list of some of the features I found useful before we install awesome bpytop command on Linux, macOS and FreeBSD Unix:

1. Extremely easy to use with gaming style menu system.
2. Beautiful user interface.
3. Full mouse support in its glory. We can scroll and click. The days are gone when you need to remember tons of keyboard shortcuts. Of course, we can use the arrow and other keys to control responsive UI.
4. Various function keys to obtain in-depth statistics for running Linux, macOS, and FreeBSD process.
5. Sorting and filtering processes supported with filters.
6. We can also send various Unix signals to the selected process.
7. The bpytop will do an auto-updating graph for your server’s network usage.
8. Get a piece of quick information about current read and write speeds for your systems disk usage.

## Install with brew

```bash
brew install python3 git
python3 -m pip install psutil
brew install hacker1024/hacker1024/coretemp
brew install osx-cpu-temp
brew install bpytop
```

## Install by comppiling

Clone the repo and run:

```bash
git clone https://github.com/aristocratos/bpytop.git
cd bpytop
sudo make install
```

We can uninstall it if not needed as follows:

```bash
sudo make uninstall
```

## Runnig bpytop

```bash
bpytop

bpytop -p
# OR #
bpytop --proc

bpytop -s
# OR #
bpytop --stat
```

## Reference

- [Bpytop resource monitor](https://www.cyberciti.biz/open-source/command-line-hacks/bpytop-awesome-linux-macos-and-freebsd-resource-monitor/)

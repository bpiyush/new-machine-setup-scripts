On a new machine (assuming Linux), it is recommended to download Latex so that one can use it easily with `matplotlib`, etc.

1. Download `TexLive` following [this](https://tug.org/texlive/quickinstall.html).
   - When running `perl ./install-tl`, add, `-texdir /path/to/install/folder/`.

[Reference](https://stackoverflow.com/questions/58121461/runtimeerror-failed-to-process-string-with-tex-because-latex-could-not-be-found).
⚠️ This can take a while.



* Install [`ghostscript`](https://ghostscript.com/releases/gsdnld.html)
```sh
wget https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10011/ghostpdl-10.01.1.tar.xz
tar xvf ghostpdl-10.01.1.tar.xz
```
[Reference](https://askubuntu.com/questions/1076846/how-to-install-newer-version-of-ghostscript-on-server-than-provided-from-ubuntu)
⚠️ This can take a while.

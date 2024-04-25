<pre>
----------------------------------------------------------------
* Creating folders & files
$ touch Tasks/001-015-hidden-rm/{.01,.02,.03}-file.txt

total 16
drwxr-xr-x 1 root nogroup 224 Apr 26 09:16 .
drwxr-xr-x 1 root nogroup 576 Apr 26 09:10 ..
-rw-r--r-- 1 root nogroup   0 Apr 26 09:16 .01-file.txt
-rw-r--r-- 1 root nogroup   0 Apr 26 09:16 .02-file.txt
-rw-r--r-- 1 root nogroup   0 Apr 26 09:16 .03-file.txt
-rw-r--r-- 1 root nogroup 176 Apr 26 09:16 README.md
-rwxr-xr-x 1 root nogroup 791 Apr 26 09:16 _demo.sh

----------------------------------------------------------------
$ rm -rf Tasks/001-015-hidden-rm/{.01,.02,.03}-file.txt

total 16
drwxr-xr-x 1 root nogroup 128 Apr 26 09:16 .
drwxr-xr-x 1 root nogroup 576 Apr 26 09:10 ..
-rw-r--r-- 1 root nogroup 683 Apr 26 09:16 README.md
-rwxr-xr-x 1 root nogroup 791 Apr 26 09:16 _demo.sh

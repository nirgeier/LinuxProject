<pre>
----------------------------------------------------------------
Setting up playground folders
----------------------------------------------------------------
* Creating folders & files
$ mkdir -p {dir1,dir2,dir3} && touch {01,02,03}-file$RANDOM.txt

Output:
/src/playground
|-- 01-file27348.txt
|-- 02-file19486.txt
|-- 03-file5670.txt
|-- dir1
|-- dir2
`-- dir3

3 directories, 3 files

----------------------------------------------------------------
* Finding and moving files
$ find /src/playground -name *.txt -exec mv {} /src/playground/dir1

Output:
/src/playground
|-- dir1
|   |-- 01-file27348.txt
|   |-- 02-file19486.txt
|   `-- 03-file5670.txt
|-- dir2
`-- dir3

3 directories, 3 files

----------------------------------------------------------------
$ cd /src/playground/dir1

----------------------------------------------------------------
* Finding and moving files
$ find /src/playground -name *.txt -exec mv {} /src/playground/dir2

Output:
/src/playground
|-- dir1
|-- dir2
|   |-- 01-file27348.txt
|   |-- 02-file19486.txt
|   `-- 03-file5670.txt
`-- dir3

3 directories, 3 files

----------------------------------------------------------------
* Delete the files from the directory
$ find /src/playground -name *.txt -exec rm {} /src/playground/dir2

Output:
/src/playground
|-- dir1
|-- dir2
`-- dir3

3 directories, 0 files

</pre>

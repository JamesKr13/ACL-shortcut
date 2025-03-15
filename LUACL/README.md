## List User ACL
Luacl (List user acl) is a very short script made to get and output the acl permission a user has on a list of files and folder. 
Exampel:
```bash
[user@machine]$ luacl username file1 file2 folder1 file3 folder4
file1 -> read write
file2 -> read execute
...
```

#Note
The code was made to work with Fedora linux, it's configured to work with the specific format. If you format is the same for the getfacl command then it will run fine. 


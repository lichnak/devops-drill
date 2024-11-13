# Bandit Tutorial

This document provides a walkthrough for the [Bandit wargame](https://overthewire.org/wargames/bandit/) hosted on  
overthewire.org. The game is designed to teach the basics  
of security and working with various Unix utilities in a terminal environment.

- ***We made progress up to level 15. and we will continue to update this document as we progress through the game.***

---

## Level 0

**Goal**: Log into the game using SSH.

**Host**: bandit.labs.overthewire.org  
**Port**: 2220  
**Username**: bandit0  
**Password**: bandit0

**Instructions**: Once logged in, copy password from readme file, then proceed to the Level 1 page for further challenges.

### Solution

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
cat readme 
```

---

## Level 0 → Level 1

**Goal**: Access the next level using the password stored in a readme file.

**Host**: bandit.labs.overthewire.org  
**Port**: 2220  
**Username**: bandit1  
**Password**: NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL

**Instructions**: Use the password from the previous level to log into bandit1 using SSH.  
The password for level 1 is located in a readme file.

### Solution

```bash
ssh bandit1@bandit.labs.overthewire.org -p 2220
```

---

## Level 1 → Level 2

**Goal**: Access the next level using the password stored in a special names file  `-`.

**Host**: bandit.labs.overthewire.org  
**Port**: 2220  
**Username**: bandit1  
**Password**: rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi

**Instructions**: You can access the file via `cat ./-`. The password for level 2 is located in the file.

### Solution

```bash
cat ./-
ssh bandit2@bandit.labs.overthewire.org -p 2220
```

---

## Level 2 → Level 3

**Goal**: Access the next level using the password stored in a file named `spaces in this filename`.

**Host**: bandit.labs.overthewire.org  
**Port**: 2220  
**Username**: bandit2  
**Password**: aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG

**Instructions**: You can access the file via `cat "spaces in this filename"`. The password for level 3 is located in the file.

### Solution

```bash
cat "spaces in this filename"
ssh bandit3@bandit.labs.overthewire.org -p 2220
```

---

## Level 3 → Level 4

**Goal**: Access the next level using the password stored in a hidden file.

**Host**: bandit.labs.overthewire.org  
**Port**: 2220  
**Username**: bandit3  
**Password**: 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe

**Instructions**: You can access the file via `cat inhere/.hidden`. The password for level 4 is located in the file.

### Solution

```bash
cat inhere/.hidden
ssh bandit4@bandit.labs.overthewire.org -p 2220
```

---

## Level 4 → Level 5

**Goal**: Access the next level using the password stored in a file that contains only human-readable strings.

**Host**: bandit.labs.overthewire.org  
**Port**: 2220  
**Username**: bandit4  
**Password**: lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR

**Instructions**: You can access the file via `cat inhere/-file07` or `grep -I . ./-file07`
. The password for level 5 is located in the file.

### Solution

```bash
cat inhere/-file07
ssh bandit5@bandit.labs.overthewire.org -p 2220
```

---

## Level 5 → Level 6

**Goal**: Access the next level using the password stored in a file that is human-readable, 1033 bytes in size, and not executable.

**Host**: bandit.labs.overthewire.org  
**Port**: 2220  
**Username**: bandit5  
**Password**: P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU  

**Instructions**: You can access the file via `find inhere/ -size 1033c -type f -exec cat {} \;`  
or just `find . -size 1033c` . The password for level 6 is located in the file.

### Solution

```bash
find inhere/ -size 1033c -type f -exec cat {} \;
ssh bandit6@bandit.labs.overthewire.org -p 2220
```

---

## Level 6 → Level 7

**Goal**:  Access the next level using the password stored in a file  
that is owned by the user bandit7 and has the group bandit6 and is 33 bytes in size.

**Host**: bandit.labs.overthewire.org  
**Port**: 2220  
**Username**: bandit6  
**Password**: P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU  

**Instructions**: You can access the file via `find / -user bandit7 -group bandit6 -size 33c`  
and then `cat /var/lib/dpkg/info/bandit7.password`. The password for level 7 is located in the file.

### Solution

```bash
find / -user bandit7 -group bandit6 -size 33c
cat /var/lib/dpkg/info/bandit7.password
ssh bandit7@bandit.labs.overthewire.org -p 2220
```

---

## Level 7 → Level 8

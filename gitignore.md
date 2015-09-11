gitignore
===============
Every project using git should include a specific `.gitignore` file.

- [Official Doc](http://git-scm.com/docs/gitignore)
- [gitignore Collection](https://github.com/github/gitignore)
- [gitignore Tool](https://github.com/joeblau/gitignore.io)

## patterns
```sh
pattern    # a glob pattern, relative to .gitignore
dir/       # match only directory
foo/*
!foo/bar/  # Don't ignore
```

A common mistake:
```sh
foo/
!foo/bar/
```
It is not possible to re-include a file if a parent directory of that file is excluded.

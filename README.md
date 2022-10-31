# defer-diagnostics-test

This repository demonstrates a GHC bug where `-fdefer-diagnostics` doesn't appear to work.

The `Makefile` has some commands that show what's going on. 

With GHC 9.2, warnings are printed after all modules are done.
See [./ghc924-warnings-deferred.txt](./ghc924-warnings-deferred.txt).

However, with GHC 9.4.2, it appears that the flag is ignored.
[`./ghc942-warnings-deferred.txt`](./ghc942-warnings-deferred.txt) has the relevant output.

Notably, the *diff* is very small for these two commands:

```
λ diff ghc942-warnings-deferred.txt ghc942-warnings-regular.txt 
4c4
< cabal build lib --ghc-options "-fdefer-diagnostics"
---
> cabal build lib
```

This isn't just a `cabal` bug - it also happens with `ghc --make`.

```
λ diff ghc94-warnings-deferred.txt ghc94-warnings-regular.txt 
4c4
< bash -c "ghc --make -Wall -fdefer-diagnostics src/Lib.hs src/Lib/A.hs src/Lib/B.hs"
---
> bash -c "ghc --make -Wall src/Lib.hs src/Lib/A.hs src/Lib/B.hs"
```

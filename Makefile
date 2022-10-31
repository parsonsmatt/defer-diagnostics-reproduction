warnings-regular: clean
	cabal build lib

.PHONY: warnings-regular

warnings-deferred: clean
	cabal build lib --ghc-options "-fdefer-diagnostics"

.PHONY: warnings-deferred

warnings-ghc: clean
	bash -c "ghc --make -Wall -fdefer-diagnostics src/Lib.hs src/Lib/A.hs src/Lib/B.hs"

.PHONY: warnings-ghc

clean:
	cabal clean
	bash -c "rm -rf src/**/*.{hi,o}"
	bash -c "rm -rf **/*.{hi,o}"

.PHONY: clean

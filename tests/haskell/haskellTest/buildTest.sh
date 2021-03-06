BIN_DIR=$1

if [ "$(id -u)" -ne 0 ]
then
  # Build haskell bindings package.
  stack test --no-run-tests --extra-lib-dirs=${BIN_DIR}
  patchelf --set-rpath ${BIN_DIR} ".stack-work/dist/x86_64-linux/Cabal-1.24.0.0/build/haskell-test-suite/haskell-test-suite"
else
    echo "Can't run Haskell-Tests as root"
fi
